from __future__ import annotations

import argparse
import json
import re
from collections import Counter
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

from build_runtime_callback_evidence import build_and_write
from probe_runtime_index import ROOT, build_runtime_probe_index, report_timestamp


ANALYSIS = ROOT / "analysis"


def counter_dict(counter: Counter[str]) -> dict[str, int]:
    return dict(sorted(counter.items(), key=lambda item: (-item[1], item[0].lower())))


def test_label(test_dir: Path) -> str:
    match = re.match(r"runtime_test_\d{3}_(.+)$", test_dir.name)
    if match:
        return match.group(1)
    return ""


def summarize_test(test_dir: Path) -> dict[str, Any]:
    reports = sorted(test_dir.glob("callback-report-*.txt"))
    callbacks: Counter[str] = Counter()
    callback_ids: Counter[str] = Counter()
    phases: Counter[str] = Counter()
    contexts: Counter[str] = Counter()
    item_labels: Counter[str] = Counter()
    item_args: Counter[str] = Counter()
    access_errors: Counter[str] = Counter()
    missing_or_error_fields: Counter[str] = Counter()
    timestamps: list[str] = []

    for report in reports:
        timestamp = report_timestamp(report)
        if timestamp:
            timestamps.append(timestamp)
        index = build_runtime_probe_index(ROOT, report)
        for context in index.get("callback_contexts", []):
            if not isinstance(context, dict):
                continue
            callback_id = str(context.get("callback_id") or context.get("callback_name") or "")
            source_stub = str(context.get("source_stub") or "")
            phase = str(context.get("phase") or "")
            detected = str(context.get("detected_context") or "")
            if source_stub:
                callbacks[source_stub] += 1
            if callback_id:
                callback_ids[callback_id] += 1
            if phase:
                phases[phase] += 1
            if detected:
                contexts[detected] += 1
        for item in index.get("callback_item_contexts", []):
            if not isinstance(item, dict):
                continue
            label = str(item.get("inferred_item_label") or item.get("value") or "")
            arg_name = str(item.get("arg_name") or "")
            if label:
                item_labels[label] += 1
            if arg_name:
                item_args[arg_name] += 1
        for error in index.get("callback_errors", []):
            if not isinstance(error, dict):
                continue
            key = str(error.get("kind") or "error")
            access_errors[key] += 1
        for field in index.get("callback_fields", []):
            if not isinstance(field, dict):
                continue
            status = str(field.get("status") or "")
            if status in {"missing", "error"}:
                owner = str(field.get("owner") or "")
                name = str(field.get("field") or "")
                missing_or_error_fields[f"{owner}.{name}:{status}"] += 1

    summary = {
        "test_id": test_dir.name,
        "label": test_label(test_dir),
        "folder": test_dir.relative_to(ROOT).as_posix() if test_dir.is_relative_to(ROOT) else test_dir.as_posix(),
        "generated_at_utc": datetime.now(UTC).replace(microsecond=0).isoformat(),
        "report_count": len(reports),
        "reports": [report.name for report in reports],
        "first_timestamp": min(timestamps) if timestamps else None,
        "last_timestamp": max(timestamps) if timestamps else None,
        "callbacks": counter_dict(callbacks),
        "callback_ids": counter_dict(callback_ids),
        "phases": counter_dict(phases),
        "contexts": counter_dict(contexts),
        "items": counter_dict(item_labels),
        "item_args": counter_dict(item_args),
        "access_errors": counter_dict(access_errors),
        "missing_or_error_fields": counter_dict(missing_or_error_fields),
    }
    (test_dir / "runtime_test_summary.json").write_text(
        json.dumps(summary, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    update_notes(test_dir, summary)
    return summary


def update_notes(test_dir: Path, summary: dict[str, Any]) -> None:
    notes_path = test_dir / "notes.txt"
    existing = notes_path.read_text(encoding="utf-8", errors="replace") if notes_path.exists() else "# MDRG Runtime Test\n"
    update_lines = [
        "",
        "## Generated reports update",
        "",
        f"updated_at: {summary['generated_at_utc']}",
        f"report_count: {summary['report_count']}",
        "",
        "Reports:",
        *[f"- {name}" for name in summary.get("reports", [])],
        "",
        "Callbacks:",
        *[f"- {name}: {count}" for name, count in summary.get("callbacks", {}).items()],
        "",
    ]
    notes_path.write_text(existing.rstrip() + "\n" + "\n".join(update_lines), encoding="utf-8")


def find_tests(root: Path) -> list[Path]:
    if not root.exists():
        return []
    return sorted(path for path in root.glob("runtime_test_*") if path.is_dir())


def render_global_summary(summaries: list[dict[str, Any]], evidence: dict[str, Any] | None = None) -> str:
    evidence = evidence or {}
    callbacks = evidence.get("callbacks", {})
    confirmed = {
        key: value for key, value in callbacks.items() if isinstance(value, dict) and value.get("status") == "runtime-confirmed"
    }
    stub_relevant = {
        key: value
        for key, value in callbacks.items()
        if isinstance(value, dict)
        and value.get("status")
        in {
            "runtime-confirmed",
            "not-assignable-from-plain-lua",
            "requires-csharp-bridge",
            "requires-runtime-instance",
            "registered-but-not-triggered",
        }
    }
    lines = [
        "# Runtime Tests Summary",
        "",
        "| Test | Reports | Contexts | Confirmed callbacks | Items | Errors |",
        "|---|---:|---|---|---|---:|",
    ]
    for summary in summaries:
        contexts = ", ".join(summary.get("contexts", {}).keys()) or "-"
        summary_callbacks = ", ".join(summary.get("callbacks", {}).keys()) or "-"
        items = ", ".join(summary.get("items", {}).keys()) or "-"
        errors = sum(summary.get("access_errors", {}).values())
        lines.append(
            f"| `{summary['test_id']}` | {summary['report_count']} | {contexts} | {summary_callbacks} | {items} | {errors} |"
        )
    if not summaries:
        lines.append("| _none_ | 0 | - | - | - | 0 |")
    lines.extend(
        [
            "",
            "## Runtime callback evidence",
            "",
            f"- Evidence callbacks: `{len(callbacks)}`",
            f"- Runtime-confirmed callbacks: `{len(confirmed)}`",
            f"- Stub-relevant findings: `{len(stub_relevant)}`",
            "",
            "### Confirmed callbacks",
            "",
        ]
    )
    if confirmed:
        for key, callback in sorted(confirmed.items()):
            lines.append(f"- `{key}`: {callback.get('observed_count', 0)} report context(s)")
    else:
        lines.append("- None")
    lines.extend(["", "### Stub-relevant findings", ""])
    if stub_relevant:
        for key, callback in sorted(stub_relevant.items()):
            lines.append(f"- `{key}`: `{callback.get('status')}`")
    else:
        lines.append("- None")
    lines.extend(
        [
            "",
            "Detailed review files:",
            "- `data/runtime_callback_evidence.json`",
            "- `analysis/runtime_confirmed_callbacks.md`",
            "- `analysis/runtime_stub_findings.md`",
            "- `analysis/suggested_stub_updates.md`",
        ]
    )
    return "\n".join(lines) + "\n"


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Summarize MDRG runtime callback test folders.")
    parser.add_argument("--root", type=Path, default=ROOT / "probe", help="probe root containing runtime_test_* folders")
    parser.add_argument("--test", type=Path, help="single runtime_test_* folder")
    return parser


def main() -> int:
    args = build_parser().parse_args()
    target = args.test if args.test else args.root
    target = target if target.is_absolute() else ROOT / target
    tests = [target] if args.test else find_tests(target)
    summaries = [summarize_test(test_dir) for test_dir in tests if test_dir.exists()]
    evidence_root = target.parent if args.test else target
    evidence = build_and_write(evidence_root)
    ANALYSIS.mkdir(parents=True, exist_ok=True)
    (ANALYSIS / "runtime_tests_summary.md").write_text(render_global_summary(summaries, evidence), encoding="utf-8")
    print(f"Summarized runtime tests: tests={len(summaries)}, reports={sum(item['report_count'] for item in summaries)}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
