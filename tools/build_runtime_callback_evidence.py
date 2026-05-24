from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

from catalog_lua_callbacks import CRITICAL_CALLBACK_KEYS, parse_debug_mod_matrix, parse_stub_callbacks
from probe_runtime_index import ROOT, build_runtime_probe_index, report_timestamp


DATA = ROOT / "data"
ANALYSIS = ROOT / "analysis"
DEFAULT_OUTPUT = DATA / "runtime_callback_evidence.json"

BUCKETS = [
    "runtime-confirmed",
    "registered-but-not-triggered",
    "assignable-but-not-triggered",
    "not-assignable-from-plain-lua",
    "requires-runtime-instance",
    "requires-csharp-bridge",
    "manual-ui-only",
    "dangerous/state-sensitive",
    "inaccessible-or-missing-at-runtime",
    "unknown",
]

ARG_TYPE_HINTS = {
    "item": "Item",
    "nutritionProfile": "EdibleItemNutritionProfile",
    "profile": "EdibleItemNutritionProfile",
    "fixedValue": "GameStatFixedValue",
    "shopItem": "ShopItem",
    "popupFinishType": "PopupFinishTypesEnum",
    "storyCondition": "StoryCondition",
    "condition": "ItemScopeCondition",
    "material": "Material",
    "renderTexture": "RenderTexture",
    "enumerator": "IEnumerator",
}

CONTEXTUAL_CALLBACKS = {
    "UiOverlay.*": {
        "status": "manual-ui-only",
        "reason": "Requires explicit UI/runtime trigger; reports must preserve context.",
    },
    "ItemManager.*events": {
        "status": "dangerous/state-sensitive",
        "reason": "Manager events require lifecycle and unsubscribe policy before stub notes are applied.",
    },
}


def rel(path: Path) -> str:
    try:
        return path.relative_to(ROOT).as_posix()
    except ValueError:
        return path.as_posix()


def now_utc() -> str:
    return datetime.now(UTC).replace(microsecond=0).isoformat()


def counter_data(counter: Counter[str]) -> dict[str, int]:
    return dict(sorted(counter.items(), key=lambda item: (-item[1], item[0].lower())))


def find_runtime_tests(probe_root: Path) -> list[Path]:
    if not probe_root.exists():
        return []
    return sorted(path for path in probe_root.glob("runtime_test_*") if path.is_dir())


def report_files(test_dirs: list[Path]) -> list[Path]:
    reports: list[Path] = []
    for test_dir in test_dirs:
        reports.extend(sorted(test_dir.glob("callback-report-*.txt")))
    return sorted(reports)


def load_runtime_test_summary(test_dir: Path) -> dict[str, Any]:
    path = test_dir / "runtime_test_summary.json"
    if not path.exists():
        return {}
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError:
        return {"parse_error": rel(path)}


def read_notes(test_dir: Path) -> list[str]:
    path = test_dir / "notes.txt"
    if not path.exists():
        return []
    lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    return [line for line in lines[:40] if line.strip()]


def callback_key(context: dict[str, Any]) -> str:
    return str(
        context.get("source_stub")
        or context.get("callback_name")
        or context.get("callback_id")
        or ""
    )


def coverage_status(entry: dict[str, str]) -> tuple[str, list[str], list[str], str, str]:
    key = entry.get("callback_key", "")
    reason = entry.get("reason", "")
    risk = entry.get("risk", "")
    text = f"{key} {reason} {risk} {entry.get('status', '')}".lower()
    secondary: list[str] = []
    notes: list[str] = []
    suggested_action = ""

    if "plain lua" in text or "c# bridge" in text or "clr" in text or "system.func" in text:
        secondary.append("requires-csharp-bridge")
        suggested_action = "Document as requiring a C# bridge or native helper before plain Lua assignment is recommended."
        return "not-assignable-from-plain-lua", secondary, notes, reason, suggested_action
    if "runtime-manager-instance" in text or "instance method" in text:
        return "requires-runtime-instance", secondary, notes, reason, "Require a live runtime instance before documenting usage."
    if key.startswith("UiOverlay.") or "ui" in risk.lower():
        return "manual-ui-only", secondary, notes, reason, "Keep as manual/contextual UI callback evidence."
    if "itemmanager" in key.lower() or "event" in key.lower() or "subscribe" in text:
        return "dangerous/state-sensitive", secondary, notes, reason, "Document lifecycle and unsubscribe policy before use."
    if "shader" in text or "asset" in text:
        notes.append("Requires asset/runtime context; no automatic stub change.")
        return "unknown", secondary, notes, reason, "Collect a runtime report with the shader/asset case enabled."
    if entry.get("status") in {"covered", "conditional", "justified"}:
        return "registered-but-not-triggered", secondary, notes, reason, "Wait for runtime callback report before applying stub notes."
    return "unknown", secondary, notes, reason, "Needs additional runtime evidence."


def ensure_callback(callbacks: dict[str, dict[str, Any]], key: str) -> dict[str, Any]:
    if key not in callbacks:
        callbacks[key] = {
            "status": "unknown",
            "secondary_statuses": [],
            "observed_count": 0,
            "invocation_count": 0,
            "contexts": Counter(),
            "phases": Counter(),
            "callback_ids": Counter(),
            "observed_args": {},
            "observed_fields": {},
            "access_errors": [],
            "evidence_reports": set(),
            "source_runtime_tests": set(),
            "debug_cases": [],
            "notes": [],
            "suggested_action": "",
        }
    return callbacks[key]


def add_arg(callback: dict[str, Any], arg: dict[str, Any]) -> None:
    name = str(arg.get("name") or arg.get("index") or "arg")
    typ = str(arg.get("type") or "unknown")
    bucket = callback["observed_args"].setdefault(
        (name, typ),
        {"name": name, "type": typ, "examples": set(), "metatables": set()},
    )
    value = str(arg.get("value") or "")
    if value:
        bucket["examples"].add(value[:180])
    metatable = str(arg.get("metatable") or "")
    if metatable:
        bucket["metatables"].add(metatable[:180])


def add_field(callback: dict[str, Any], field: dict[str, Any]) -> None:
    owner = str(field.get("owner") or "")
    name = str(field.get("field") or "")
    key = (owner, name, str(field.get("status") or ""), str(field.get("type") or ""))
    bucket = callback["observed_fields"].setdefault(
        key,
        {
            "owner": owner,
            "field": name,
            "type": str(field.get("type") or ""),
            "status": str(field.get("status") or ""),
            "source": str(field.get("source") or ""),
            "examples": set(),
        },
    )
    value = str(field.get("value") or "")
    if value:
        bucket["examples"].add(value[:180])


def owner_type(owner: str, callback: dict[str, Any]) -> str:
    if owner in ARG_TYPE_HINTS:
        return ARG_TYPE_HINTS[owner]
    for arg in callback["observed_args"].values():
        if arg.get("name") == owner and arg.get("type") not in {"", "nil", "unknown"}:
            return str(arg.get("type"))
    return owner or "unknown"


def add_field_finding(field_findings: dict[str, dict[str, list[dict[str, str]]]], callback: dict[str, Any], field: dict[str, Any]) -> None:
    owner = str(field.get("owner") or "")
    field_name = str(field.get("field") or "")
    typ = str(field.get("type") or "")
    status = str(field.get("status") or "")
    klass = owner_type(owner, callback)
    bucket = field_findings.setdefault(klass, {"confirmed": [], "not_confirmed_or_inaccessible": []})
    entry = {
        "path": field_name,
        "type": typ,
        "status": status,
        "owner": owner,
        "source": str(field.get("source") or ""),
    }
    target = "confirmed" if status == "present" else "not_confirmed_or_inaccessible"
    if entry not in bucket[target]:
        bucket[target].append(entry)


def serialize_callback(callback: dict[str, Any]) -> dict[str, Any]:
    args = []
    for item in callback["observed_args"].values():
        args.append(
            {
                "name": item["name"],
                "type": item["type"],
                "examples": sorted(item["examples"])[:8],
                "metatables": sorted(item["metatables"])[:8],
            }
        )
    fields = []
    for item in callback["observed_fields"].values():
        fields.append(
            {
                "owner": item["owner"],
                "field": item["field"],
                "type": item["type"],
                "status": item["status"],
                "source": item["source"],
                "examples": sorted(item["examples"])[:8],
            }
        )
    return {
        "status": callback["status"],
        "secondary_statuses": sorted(set(callback["secondary_statuses"])),
        "observed_count": callback["observed_count"],
        "invocation_count": callback["invocation_count"],
        "contexts": counter_data(callback["contexts"]),
        "phases": counter_data(callback["phases"]),
        "callback_ids": counter_data(callback["callback_ids"]),
        "observed_args": sorted(args, key=lambda item: (item["name"], item["type"])),
        "observed_fields": sorted(fields, key=lambda item: (item["owner"], item["field"], item["status"])),
        "access_errors": callback["access_errors"][:40],
        "evidence_reports": sorted(callback["evidence_reports"]),
        "source_runtime_tests": sorted(callback["source_runtime_tests"]),
        "debug_cases": callback["debug_cases"],
        "notes": callback["notes"],
        "suggested_action": callback["suggested_action"],
    }


def stub_signature_map() -> dict[str, dict[str, str]]:
    result: dict[str, dict[str, str]] = {}
    for entry in parse_stub_callbacks():
        key = f"{entry.owner}.{entry.name}"
        data = {
            "source": entry.source,
            "line": str(entry.line),
            "owner": entry.owner,
            "name": entry.name,
            "kind": entry.kind,
            "signature": entry.signature,
        }
        result.setdefault(key, data)
        if entry.kind in {"param", "return", "overload"}:
            result.setdefault(entry.owner, data)
    return result


def build_evidence(probe_root: Path) -> dict[str, Any]:
    probe_root = probe_root if probe_root.is_absolute() else ROOT / probe_root
    test_dirs = find_runtime_tests(probe_root)
    reports = report_files(test_dirs)
    callbacks: dict[str, dict[str, Any]] = {}
    field_findings: dict[str, dict[str, list[dict[str, str]]]] = {}
    test_summaries = []

    for test_dir in test_dirs:
        test_summaries.append(
            {
                "folder": rel(test_dir),
                "notes": read_notes(test_dir),
                "summary": load_runtime_test_summary(test_dir),
                "reports": [rel(path) for path in sorted(test_dir.glob("callback-report-*.txt"))],
            }
        )

    for report in reports:
        index = build_runtime_probe_index(ROOT, report)
        report_rel = rel(report)
        test_rel = rel(report.parent)
        timestamp = report_timestamp(report)
        for context in index.get("callback_contexts", []):
            if not isinstance(context, dict):
                continue
            key = callback_key(context)
            if not key:
                continue
            callback = ensure_callback(callbacks, key)
            callback["status"] = "runtime-confirmed"
            callback["observed_count"] += 1
            if str(context.get("phase") or "") == "before":
                callback["invocation_count"] += 1
            detected_context = str(context.get("detected_context") or context.get("context") or "unknown")
            phase = str(context.get("phase") or "unknown")
            callback_id = str(context.get("callback_id") or context.get("callback_name") or "")
            callback["contexts"][detected_context] += 1
            callback["phases"][phase] += 1
            if callback_id:
                callback["callback_ids"][callback_id] += 1
            callback["evidence_reports"].add(report_rel)
            callback["source_runtime_tests"].add(test_rel)
            if timestamp:
                callback["notes"].append(f"observed_at:{timestamp}")
            for arg in context.get("args", []):
                if isinstance(arg, dict):
                    add_arg(callback, arg)
            for field in context.get("fields", []):
                if isinstance(field, dict):
                    add_field(callback, field)
                    add_field_finding(field_findings, callback, field)
            for error in context.get("errors", []):
                if isinstance(error, dict):
                    callback["access_errors"].append(error)

    coverage, _categories = parse_debug_mod_matrix()
    for entry in coverage:
        key = entry.get("callback_key", "")
        if not key:
            continue
        callback = ensure_callback(callbacks, key)
        status, secondary, notes, reason, suggested_action = coverage_status(entry)
        if callback["status"] != "runtime-confirmed":
            callback["status"] = status
        callback["secondary_statuses"].extend(secondary)
        callback["debug_cases"].append(
            {
                "case_id": entry.get("case_id", ""),
                "status": entry.get("status", ""),
                "trigger_hint": entry.get("trigger_hint", ""),
                "risk": entry.get("risk", ""),
                "reason": reason,
            }
        )
        callback["notes"].extend(notes)
        if reason and reason not in callback["notes"]:
            callback["notes"].append(reason)
        if suggested_action and not callback["suggested_action"]:
            callback["suggested_action"] = suggested_action

    for key, info in CONTEXTUAL_CALLBACKS.items():
        if key not in callbacks:
            callback = ensure_callback(callbacks, key)
            callback["status"] = info["status"]
            callback["notes"].append(info["reason"])
            callback["suggested_action"] = "Keep as contextual documentation only until runtime reports exist."

    incompatible = {}
    for key, callback in callbacks.items():
        if callback["status"] in {"not-assignable-from-plain-lua", "requires-csharp-bridge", "requires-runtime-instance"}:
            incompatible[key] = {
                "status": callback["status"],
                "secondary_statuses": sorted(set(callback["secondary_statuses"])),
                "reason": "; ".join(callback["notes"][:3]),
                "suggested_action": callback["suggested_action"],
            }

    serialized_callbacks = {
        key: serialize_callback(callback)
        for key, callback in sorted(callbacks.items(), key=lambda item: item[0].lower())
    }

    status_counts = Counter(item["status"] for item in serialized_callbacks.values())
    return {
        "schema_version": 1,
        "generated_at_utc": now_utc(),
        "source_root": rel(probe_root),
        "source_runtime_tests": [rel(path) for path in test_dirs],
        "source_reports": [rel(path) for path in reports],
        "runtime_test_summaries": test_summaries,
        "status_counts": counter_data(status_counts),
        "callbacks": serialized_callbacks,
        "field_findings": {
            owner: {
                "confirmed": sorted(data["confirmed"], key=lambda item: item["path"]),
                "not_confirmed_or_inaccessible": sorted(
                    data["not_confirmed_or_inaccessible"], key=lambda item: (item["path"], item["status"])
                ),
            }
            for owner, data in sorted(field_findings.items())
        },
        "incompatible_callbacks": incompatible,
        "stub_signatures": stub_signature_map(),
        "notes": [
            "Runtime callback reports are evidence, not an automatic source for stub changes.",
            "No library/*.d.lua files are edited by this tool.",
            "A single runtime context must not be generalized without review.",
        ],
    }


def load_evidence(path: Path = DEFAULT_OUTPUT) -> dict[str, Any]:
    if not path.exists():
        return {}
    return json.loads(path.read_text(encoding="utf-8"))


def callback_groups(evidence: dict[str, Any]) -> dict[str, list[tuple[str, dict[str, Any]]]]:
    groups: dict[str, list[tuple[str, dict[str, Any]]]] = defaultdict(list)
    for key, callback in evidence.get("callbacks", {}).items():
        groups[callback.get("status", "unknown")].append((key, callback))
        for secondary in callback.get("secondary_statuses", []):
            groups[secondary].append((key, callback))
    for items in groups.values():
        items.sort(key=lambda item: item[0].lower())
    return groups


def args_text(callback: dict[str, Any]) -> str:
    args = callback.get("observed_args", [])
    if not args:
        return "-"
    return ", ".join(f"{arg.get('name')}: {arg.get('type')}" for arg in args)


def contexts_text(callback: dict[str, Any]) -> str:
    contexts = callback.get("contexts", {})
    if not contexts:
        return "-"
    return ", ".join(f"{name} ({count})" for name, count in contexts.items())


def render_runtime_confirmed_callbacks(evidence: dict[str, Any]) -> str:
    groups = callback_groups(evidence)
    lines = [
        "# Runtime confirmed callbacks",
        "",
        "Generated from `probe/runtime_test_*`.",
        "",
    ]
    if not evidence.get("source_runtime_tests"):
        lines.extend(
            [
                "> No `probe/runtime_test_*` folders were found. Sections below contain only declared debug-case evidence where available.",
                "",
            ]
        )

    lines.extend(["## Confirmed", "", "| Callback | Count | Contexts | Args | Notes |", "|---|---:|---|---|---|"])
    confirmed = groups.get("runtime-confirmed", [])
    if not confirmed:
        lines.append("| _none_ | 0 | - | - | No runtime callback reports yet. |")
    for key, callback in confirmed:
        lines.append(
            f"| `{key}` | {callback.get('observed_count', 0)} | {contexts_text(callback)} | {args_text(callback)} | Lua assignment/runtime invocation observed in callback report. |"
        )

    sections = [
        ("Registered but not triggered", "registered-but-not-triggered"),
        ("Not assignable from plain Lua", "not-assignable-from-plain-lua"),
        ("Requires C# bridge", "requires-csharp-bridge"),
        ("Manual/contextual", "manual-ui-only"),
        ("Requires runtime instance", "requires-runtime-instance"),
        ("Dangerous/state-sensitive", "dangerous/state-sensitive"),
        ("Unknown", "unknown"),
    ]
    for title, status in sections:
        lines.extend(["", f"## {title}", "", "| Callback | Reason |", "|---|---|"])
        items = groups.get(status, [])
        if not items:
            lines.append("| _none_ | - |")
            continue
        seen: set[str] = set()
        for key, callback in items:
            if key in seen:
                continue
            seen.add(key)
            reason = "; ".join(callback.get("notes", [])[:2]) or callback.get("suggested_action", "")
            lines.append(f"| `{key}` | {reason or '-'} |")

    return "\n".join(lines) + "\n"


def format_stub_signature(signature: dict[str, str]) -> str:
    kind = signature.get("kind", "")
    name = signature.get("name", "")
    owner = signature.get("owner", "")
    value = signature.get("signature", "")
    if kind == "field":
        return f"---@field {name} {value}"
    if kind == "param":
        return f"---@param {name} {value}\nfunction {owner}(...) end"
    if kind == "return":
        return f"---@return {value}\nfunction {owner}(...) end"
    if kind == "overload":
        return f"---@overload fun({value})\nfunction {owner}(...) end"
    return f"---@{kind} {name} {value}".rstrip()


def render_runtime_stub_findings(evidence: dict[str, Any]) -> str:
    signatures = evidence.get("stub_signatures", {})
    groups = callback_groups(evidence)
    lines = [
        "# Runtime stub findings",
        "",
        "These findings are review material only. They do not edit stubs automatically.",
        "",
        "## Callback signatures",
        "",
    ]
    interesting = []
    for status in [
        "runtime-confirmed",
        "not-assignable-from-plain-lua",
        "requires-csharp-bridge",
        "requires-runtime-instance",
        "registered-but-not-triggered",
    ]:
        interesting.extend(groups.get(status, []))
    seen: set[str] = set()
    for key, callback in interesting:
        if key in seen:
            continue
        seen.add(key)
        signature = signatures.get(key, {})
        lines.extend([f"### {key}", ""])
        if signature:
            lines.extend(["Stub signature:", "```lua", format_stub_signature(signature), "```", ""])
        else:
            lines.append("Stub signature: not found in callback catalog.")
            lines.append("")
        lines.extend(
            [
                "Runtime result:",
                f"- Status: `{callback.get('status')}`.",
                f"- Observed reports: {len(callback.get('evidence_reports', []))}.",
                f"- Observed args: {args_text(callback)}.",
            ]
        )
        if callback.get("access_errors"):
            lines.append("- Access errors:")
            for error in callback.get("access_errors", [])[:8]:
                lines.append(f"  - `{error.get('kind')}` `{error.get('path')}`: {error.get('message')}")
        suggested = callback.get("suggested_action") or "Do not change stubs without manual review."
        lines.extend(["", "Suggested stub note:", f"- {suggested}", ""])

    lines.extend(["## Runtime-confirmed fields", ""])
    field_findings = evidence.get("field_findings", {})
    if not field_findings:
        lines.append("- No callback field probes were found.")
    for owner, data in field_findings.items():
        lines.extend([f"### {owner}", "", "Confirmed:"])
        confirmed = data.get("confirmed", [])
        if not confirmed:
            lines.append("- None")
        for field in confirmed:
            suffix = f": {field.get('type')}" if field.get("type") else ""
            lines.append(f"- `{field.get('path')}`{suffix}")
        lines.append("")
        lines.append("Inaccessible/not confirmed:")
        missing = data.get("not_confirmed_or_inaccessible", [])
        if not missing:
            lines.append("- None")
        for field in missing:
            lines.append(f"- `{field.get('path')}` ({field.get('status')})")
        lines.extend(["", "Suggested action:", "- Do not add inaccessible fields as public fields without additional evidence.", ""])
    return "\n".join(lines) + "\n"


def render_suggested_stub_updates(evidence: dict[str, Any]) -> str:
    groups = callback_groups(evidence)
    lines = [
        "# Suggested stub updates",
        "",
        "Do not apply blindly. Review each suggestion manually.",
        "",
        "## Safe documentation-only notes",
        "",
    ]
    confirmed = groups.get("runtime-confirmed", [])
    if not confirmed:
        lines.append("- None yet; no runtime-confirmed callback reports were found.")
    for key, callback in confirmed:
        lines.extend(
            [
                f"### `{key}`",
                "",
                "Suggested note:",
                "```lua",
                f"---Runtime-confirmed Lua callback in {len(callback.get('evidence_reports', []))} report(s).",
                "```",
                "",
                "Evidence:",
                f"- Reports: {len(callback.get('evidence_reports', []))}",
                f"- Tests: {', '.join(callback.get('source_runtime_tests', [])) or '-'}",
                "",
            ]
        )

    lines.extend(["## Caution notes", ""])
    caution_statuses = ["not-assignable-from-plain-lua", "requires-csharp-bridge", "requires-runtime-instance"]
    seen: set[str] = set()
    for status in caution_statuses:
        for key, callback in groups.get(status, []):
            if key in seen:
                continue
            seen.add(key)
            lines.extend(
                [
                    f"### `{key}`",
                    "",
                    "Suggested note:",
                    "```lua",
                    f"---{callback.get('suggested_action') or '; '.join(callback.get('notes', [])[:2])}",
                    "```",
                    "",
                    "Evidence:",
                    f"- Status: `{callback.get('status')}`",
                    f"- Reports: {len(callback.get('evidence_reports', []))}",
                    f"- Notes: {'; '.join(callback.get('notes', [])[:3]) or '-'}",
                    "",
                ]
            )
    if not seen:
        lines.append("- None.")
        lines.append("")

    lines.extend(["## Possible type refinements", ""])
    field_findings = evidence.get("field_findings", {})
    if not field_findings:
        lines.append("- None yet; no callback field probes were found.")
    for owner, data in field_findings.items():
        lines.extend([f"### `{owner}`", "", "Suggested:"])
        confirmed = data.get("confirmed", [])
        if not confirmed:
            lines.append("- None")
        for field in confirmed:
            lines.append(f"- Consider documenting `{field.get('path')}` only if additional source evidence agrees.")
        missing = data.get("not_confirmed_or_inaccessible", [])
        if missing:
            lines.extend(["", "Do not add without future reports:"])
            for field in missing:
                lines.append(f"- `{field.get('path')}` ({field.get('status')})")
        lines.append("")
    return "\n".join(lines) + "\n"


def render_next_prompt() -> str:
    return """# Next prompt: apply reviewed runtime callback notes

Use `data/runtime_callback_evidence.json` and the three runtime evidence reports as review material.

Rules:
- Do not edit `library/*.d.lua` manually.
- Apply only documentation comments that are confirmed by runtime reports and still align with `docs.txt`.
- Keep caution notes for `not-assignable-from-plain-lua`, `requires-csharp-bridge`, and `requires-runtime-instance`.
- Do not create APIs, fields or type changes from callback reports alone.
"""


def write_outputs(evidence: dict[str, Any], output: Path = DEFAULT_OUTPUT, analysis: Path = ANALYSIS) -> None:
    output.parent.mkdir(parents=True, exist_ok=True)
    analysis.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(evidence, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    (analysis / "runtime_confirmed_callbacks.md").write_text(render_runtime_confirmed_callbacks(evidence), encoding="utf-8")
    (analysis / "runtime_stub_findings.md").write_text(render_runtime_stub_findings(evidence), encoding="utf-8")
    (analysis / "suggested_stub_updates.md").write_text(render_suggested_stub_updates(evidence), encoding="utf-8")
    (analysis / "next_prompt_apply_reviewed_stub_notes.md").write_text(render_next_prompt(), encoding="utf-8")


def build_and_write(probe_root: Path, output: Path = DEFAULT_OUTPUT, analysis: Path = ANALYSIS) -> dict[str, Any]:
    evidence = build_evidence(probe_root)
    write_outputs(evidence, output, analysis)
    return evidence


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Build reviewed runtime callback evidence from callback reports.")
    parser.add_argument("--root", type=Path, default=ROOT / "probe", help="probe root containing runtime_test_* folders")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT, help="output JSON path")
    parser.add_argument("--analysis", type=Path, default=ANALYSIS, help="analysis output directory")
    return parser


def main() -> int:
    args = build_parser().parse_args()
    probe_root = args.root if args.root.is_absolute() else ROOT / args.root
    output = args.output if args.output.is_absolute() else ROOT / args.output
    analysis = args.analysis if args.analysis.is_absolute() else ROOT / args.analysis
    evidence = build_and_write(probe_root, output, analysis)
    print(
        "Built runtime callback evidence: "
        f"tests={len(evidence.get('source_runtime_tests', []))}, "
        f"reports={len(evidence.get('source_reports', []))}, "
        f"callbacks={len(evidence.get('callbacks', {}))}."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
