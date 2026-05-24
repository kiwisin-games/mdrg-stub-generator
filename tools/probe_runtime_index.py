from __future__ import annotations

import argparse
import hashlib
import json
import re
from datetime import UTC, datetime
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[1]
PROBE = ROOT / "probe"
DATA = ROOT / "data"
RUNTIME_PROBE_INDEX = DATA / "runtime_probe_index.json"
DOCS = ROOT / "docs.txt"

REPORT_NAME_RE = re.compile(r"^(?:callback-)?report-(\d{8})-(\d{6})(?:[-_A-Za-z0-9]*)?\.txt$")
CONSOLE_PREFIX_RE = re.compile(r"^(?:\[\d{2}:\d{2}:\d{2}\.\d{3}\])?(?:\s*\[[^\]]+\])+\s?")
SECTION_RE = re.compile(r"^##\s+(.+)$")
CHUNK_MARKER_RE = re.compile(r"^MDRG_[A-Z0-9_]*_PROBE_CHUNK(?:\s+\S+)?$")

RUNTIME_ALIAS_TARGETS = {
    "gv": "GameVariables",
    "flowchart": "Flowchart",
}


def sha256(path: Path) -> str | None:
    if not path.exists() or not path.is_file():
        return None
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def report_timestamp(path: Path) -> str | None:
    match = REPORT_NAME_RE.match(path.name)
    if not match:
        return None
    return f"{match.group(1)}-{match.group(2)}"


def latest_report(root: Path = ROOT) -> Path | None:
    reports = []
    for path in (root / "probe").glob("*.txt"):
        timestamp = report_timestamp(path)
        if timestamp:
            reports.append((timestamp, path))
    if not reports:
        return None
    reports.sort(key=lambda item: item[0])
    return reports[-1][1]


def strip_console_prefix(line: str) -> tuple[str, bool]:
    stripped = CONSOLE_PREFIX_RE.sub("", line.rstrip("\n\r"))
    return stripped, stripped != line.rstrip("\n\r")


def clean_report_lines(path: Path) -> tuple[list[str], bool, int]:
    lines: list[str] = []
    saw_prefix = False
    chunk_markers = 0
    for raw_line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        clean, had_prefix = strip_console_prefix(raw_line)
        saw_prefix = saw_prefix or had_prefix
        if CHUNK_MARKER_RE.match(clean):
            chunk_markers += 1
            continue
        lines.append(clean)
    return lines, saw_prefix, chunk_markers


def split_machine_line(line: str) -> list[str]:
    """Split pipe-delimited probe rows, honoring backslash escapes."""
    parts: list[str] = []
    current: list[str] = []
    escaped = False
    for char in line.strip():
        if escaped:
            if char == "n":
                current.append("\n")
            elif char == "r":
                current.append("\r")
            elif char == "t":
                current.append("\t")
            else:
                current.append(char)
            escaped = False
            continue
        if char == "\\":
            escaped = True
            continue
        if char == "|":
            parts.append("".join(current).strip())
            current = []
            continue
        current.append(char)
    if escaped:
        current.append("\\")
    parts.append("".join(current).strip())
    return parts


def split_sections(lines: list[str]) -> dict[str, list[str]]:
    sections: dict[str, list[str]] = {}
    current = "Preamble"
    sections[current] = []
    for line in lines:
        match = SECTION_RE.match(line)
        if match:
            current = match.group(1).strip()
            sections.setdefault(current, [])
            continue
        if set(line.strip()) in [{"-"}]:
            continue
        sections.setdefault(current, []).append(line)
    return sections


def parse_machine_blocks(lines: list[str]) -> dict[str, list[list[str]]]:
    blocks: dict[str, list[list[str]]] = {}
    current: str | None = None
    for line in lines:
        if line.startswith("BEGIN_MDRG_"):
            block_name = line.removeprefix("BEGIN_MDRG_").strip()
            if block_name.startswith("PROBE_"):
                current = block_name.removeprefix("PROBE_")
            else:
                current = block_name
            blocks.setdefault(current, [])
            continue
        if line.startswith("END_MDRG_"):
            current = None
            continue
        if current is None or not line:
            continue
        blocks.setdefault(current, []).append(split_machine_line(line))
    return blocks


def parse_callback_reports(lines: list[str]) -> list[dict[str, Any]]:
    contexts: list[dict[str, Any]] = []
    block: str | None = None
    current: dict[str, Any] | None = None
    last_context: dict[str, Any] | None = None

    def ensure_context() -> dict[str, Any]:
        nonlocal current, last_context
        if block == "context" and current is not None:
            return current
        if last_context is not None:
            return last_context
        current = {"args": [], "fields": [], "errors": []}
        contexts.append(current)
        last_context = current
        return current

    for line in lines:
        if line.startswith("BEGIN_MDRG_CALLBACK_CONTEXT"):
            current = {"args": [], "fields": [], "errors": []}
            block = "context"
            continue
        if line.startswith("END_MDRG_CALLBACK_CONTEXT"):
            if current is not None:
                contexts.append(current)
                last_context = current
            current = None
            block = None
            continue
        if line.startswith("BEGIN_MDRG_CALLBACK_ARGS"):
            block = "args"
            continue
        if line.startswith("END_MDRG_CALLBACK_ARGS"):
            block = None
            continue
        if line.startswith("BEGIN_MDRG_CALLBACK_FIELDS"):
            block = "fields"
            continue
        if line.startswith("END_MDRG_CALLBACK_FIELDS"):
            block = None
            continue
        if line.startswith("BEGIN_MDRG_CALLBACK_ITEM_CONTEXT"):
            block = "item_context"
            continue
        if line.startswith("END_MDRG_CALLBACK_ITEM_CONTEXT"):
            block = None
            continue
        if line.startswith("BEGIN_MDRG_CALLBACK_ERRORS"):
            block = "errors"
            continue
        if line.startswith("END_MDRG_CALLBACK_ERRORS"):
            block = None
            continue
        if block is None or not line:
            continue

        row = split_machine_line(line)
        if block == "context":
            if current is None:
                current = {"args": [], "fields": [], "errors": []}
            if len(row) >= 3 and row[0] == "callback":
                current[row[1]] = row[2]
            elif "=" in line:
                key, value = line.split("=", 1)
                current[key.strip()] = value.strip()
        elif block == "args":
            context = ensure_context()
            if len(row) >= 5 and row[0] == "arg":
                metatable = row[5] if len(row) > 5 else ""
                if metatable.startswith("metatable:"):
                    metatable = metatable.split(":", 1)[1]
                context.setdefault("args", []).append(
                    {
                        "index": row[1],
                        "name": row[2],
                        "type": row[3],
                        "value": row[4],
                        "metatable": metatable,
                    }
                )
        elif block == "fields":
            context = ensure_context()
            if len(row) >= 7 and row[0] == "field":
                context.setdefault("fields", []).append(
                    {
                        "owner": row[1],
                        "field": row[2],
                        "type": row[3],
                        "status": row[4],
                        "source": row[5],
                        "value": row[6],
                    }
                )
        elif block == "item_context":
            context = ensure_context()
            if len(row) >= 3 and row[0] == "item":
                item_context = context.setdefault("item_context", {})
                item_context[row[1]] = row[2]
        elif block == "errors":
            context = ensure_context()
            if len(row) >= 4 and row[0] == "error":
                context.setdefault("errors", []).append(
                    {
                        "kind": row[1],
                        "path": row[2],
                        "message": row[3],
                    }
                )

    if current is not None and current not in contexts:
        contexts.append(current)

    return contexts


def parse_machine_runtime_test(rows: list[list[str]]) -> dict[str, str]:
    runtime_test: dict[str, str] = {}
    for row in rows:
        if len(row) >= 3 and row[0] == "runtime_test":
            runtime_test[row[1]] = row[2]
    return runtime_test


def flatten_callback_items(contexts: list[dict[str, Any]], key: str) -> list[dict[str, Any]]:
    flattened: list[dict[str, Any]] = []
    for context in contexts:
        callback_id = context.get("callback_id", "")
        callback_name = context.get("callback_name", "")
        phase = context.get("phase", "")
        for item in context.get(key, []):
            if isinstance(item, dict):
                entry = dict(item)
                entry["callback_id"] = callback_id
                entry["callback_name"] = callback_name
                entry["phase"] = phase
                flattened.append(entry)
    return flattened


def flatten_callback_item_contexts(contexts: list[dict[str, Any]]) -> list[dict[str, Any]]:
    flattened: list[dict[str, Any]] = []
    for context in contexts:
        item_context = context.get("item_context")
        if not isinstance(item_context, dict):
            continue
        entry = dict(item_context)
        entry.setdefault("callback_id", context.get("callback_id", ""))
        entry.setdefault("callback_name", context.get("callback_name", ""))
        entry.setdefault("phase", context.get("phase", ""))
        flattened.append(entry)
    return flattened


def parse_machine_symbols(rows: list[list[str]]) -> tuple[list[dict[str, str]], list[str]]:
    present: list[dict[str, str]] = []
    missing: list[str] = []
    for row in rows:
        if len(row) < 5 or row[0] != "symbol":
            continue
        entry = {
            "name": row[1],
            "type": row[2],
            "status": row[3],
            "value": row[4],
        }
        if entry["status"] == "present":
            present.append(entry)
        elif entry["status"] == "missing":
            missing.append(entry["name"])
    return present, missing


def parse_machine_aliases(rows: list[list[str]]) -> list[dict[str, str]]:
    aliases: list[dict[str, str]] = []
    for row in rows:
        if len(row) < 6 or row[0] != "alias" or row[3] != "present":
            continue
        aliases.append(
            {
                "name": row[1],
                "target": row[2],
                "type": row[4],
                "value": row[5],
                "evidence": "Machine Readable Summary",
            }
        )
    return aliases


def parse_machine_callables(rows: list[list[str]]) -> list[dict[str, Any]]:
    callables: list[dict[str, Any]] = []
    for row in rows:
        if len(row) < 6 or row[0] != "callable":
            continue
        callables.append(
            {
                "path": row[1],
                "origin": row[4],
                "safety": row[3],
                "dangerous_name": row[5].lower() == "true",
            }
        )
    return callables


def parse_machine_fields(rows: list[list[str]]) -> list[dict[str, str]]:
    fields: list[dict[str, str]] = []
    for row in rows:
        if len(row) < 7 or row[0] != "field":
            continue
        fields.append(
            {
                "owner": row[1],
                "field": row[2],
                "type": row[3],
                "status": row[4],
                "source": row[5],
                "value": row[6],
            }
        )
    return fields


def parse_machine_enum_values(rows: list[list[str]]) -> list[dict[str, str]]:
    values: list[dict[str, str]] = []
    for row in rows:
        if len(row) < 7 or row[0] != "enum":
            continue
        values.append(
            {
                "enum": row[1],
                "value": row[2],
                "type": row[3],
                "status": row[4],
                "source": row[5],
                "result": row[6],
            }
        )
    return values


def parse_machine_environment(rows: list[list[str]]) -> dict[str, Any]:
    environment: dict[str, Any] = {}
    for row in rows:
        if len(row) < 2:
            continue
        key = row[0]
        value = row[1]
        if value == "true":
            environment[key] = True
        elif value == "false":
            environment[key] = False
        else:
            environment[key] = value
    return environment


def parse_machine_enum_candidates(rows: list[list[str]]) -> list[dict[str, str]]:
    values: list[dict[str, str]] = []
    for row in rows:
        if len(row) < 7 or row[0] != "enum_candidate":
            continue
        values.append(
            {
                "enum": row[1],
                "value": row[2],
                "type": row[3],
                "status": row[4],
                "source": row[5],
                "result": row[6],
            }
        )
    return values


def parse_machine_generic(prefix: str, rows: list[list[str]]) -> list[dict[str, str]]:
    parsed: list[dict[str, str]] = []
    for row in rows:
        if not row or row[0] != prefix:
            continue
        parsed.append({f"col_{index}": value for index, value in enumerate(row[1:], start=1)})
    return parsed


def infer_environment_from_legacy(
    present_symbols: list[dict[str, str]],
    output_context: dict[str, Any],
) -> dict[str, Any]:
    names = {entry.get("name") for entry in present_symbols}
    environment = {
        "context_label": "auto",
        "safe_io_expected": False,
        "io_present": "io" in names,
        "io_open_present": bool(output_context.get("io_available")),
        "current_mod_guid_present": "CurrentModGuid" in names,
        "gamevariables_present": "GameVariables" in names,
        "gv_present": "gv" in names,
        "flowchart_present": "flowchart" in names,
        "effective_gamevariables_source": "GameVariables" if "GameVariables" in names else ("gv" if "gv" in names else "none"),
        "transport": "console-fallback" if output_context.get("console_fallback") else "file",
    }
    if environment["gamevariables_present"]:
        environment["detected_context"] = "save-aware-context"
        environment["context_confidence"] = "low"
    elif environment["current_mod_guid_present"] and environment["io_open_present"]:
        environment["detected_context"] = "mod-with-safe-io-start"
        environment["context_confidence"] = "low"
    elif environment["current_mod_guid_present"]:
        environment["detected_context"] = "mod-start"
        environment["context_confidence"] = "low"
    elif environment["gv_present"] and environment["flowchart_present"] and environment["io_open_present"]:
        environment["detected_context"] = "luaexec-with-safe-io-scene-context"
        environment["context_confidence"] = "low"
    elif environment["gv_present"] and environment["flowchart_present"]:
        environment["detected_context"] = "luaexec-scene-context"
        environment["context_confidence"] = "low"
    else:
        environment["detected_context"] = "unknown"
        environment["context_confidence"] = "low"
    return environment


def safe_io_info(
    present_symbols: list[dict[str, str]],
    output_context: dict[str, Any],
    environment: dict[str, Any] | None = None,
) -> dict[str, Any]:
    environment = environment or {}
    io_entry = next((entry for entry in present_symbols if entry.get("name") == "io"), None)
    env_io_present = environment.get("io_present")
    if env_io_present is None:
        env_io_present = io_entry is not None

    transport = environment.get("transport") or output_context.get("transport")
    if not transport:
        transport = "console-fallback" if output_context.get("console_fallback") else "file"

    return {
        "io_present": bool(env_io_present),
        "io_open_present": bool(environment.get("io_open_present", output_context.get("io_available") is True)),
        "io_popen_present": bool(environment.get("io_popen_present", False)),
        "io_tmpfile_present": bool(environment.get("io_tmpfile_present", False)),
        "safe_io_expected": bool(environment.get("safe_io_expected", False)),
        "safe_io_likely_injected": environment.get("safe_io_likely_injected", "unknown"),
        "transport": transport,
        "io_type": io_entry.get("type") if io_entry else None,
        "io_value": io_entry.get("value") if io_entry else "",
        "console_fallback": output_context.get("console_fallback"),
    }


def parse_report_value(value: str) -> Any:
    value = value.strip()
    if value == "true":
        return True
    if value == "false":
        return False
    if value == "<missing>":
        return None
    if len(value) >= 2 and value[0] == '"' and value[-1] == '"':
        try:
            return json.loads(value)
        except json.JSONDecodeError:
            return value[1:-1]
    return value


def docs_symbols() -> set[str]:
    if not DOCS.exists():
        return set()
    symbols: set[str] = set()
    for line in DOCS.read_text(encoding="utf-8", errors="replace").splitlines():
        match = re.match(r'^"([^"]+)"\s+-', line.strip())
        if match:
            symbols.add(match.group(1))
    return symbols


def parse_runtime(lines: list[str]) -> dict[str, Any]:
    runtime: dict[str, Any] = {"moonsharp": {}}
    for line in lines:
        if line.startswith("_VERSION:"):
            runtime["lua_version"] = parse_report_value(line.split(":", 1)[1])
        elif line.startswith("CurrentModGuid:"):
            value = parse_report_value(line.split(":", 1)[1])
            runtime["current_mod_guid"] = value
            runtime["current_mod_guid_present"] = value is not None
        else:
            match = re.match(r"^_MOONSHARP\.([^:]+):\s+(.+)$", line)
            if match:
                runtime["moonsharp"][match.group(1)] = parse_report_value(match.group(2))
    return runtime


def parse_known_symbols(lines: list[str]) -> tuple[list[dict[str, str]], list[str]]:
    present: list[dict[str, str]] = []
    missing: list[str] = []
    mode = ""
    for line in lines:
        if "Runtime symbol expected - present" in line:
            mode = "present"
            continue
        if "Runtime symbol expected - missing" in line:
            mode = "missing"
            continue
        if "Stub-only alias expected" in line:
            mode = "stub-only"
            continue
        if not line.startswith("- "):
            continue
        item = line[2:].strip()
        if mode == "present":
            match = re.match(r"^([^:]+):\s+([A-Za-z_][A-Za-z0-9_-]*)\s*(.*)$", item)
            if match:
                present.append(
                    {
                        "name": match.group(1).strip(),
                        "type": match.group(2).strip(),
                        "value": match.group(3).strip(),
                    }
                )
        elif mode == "missing" and item:
            missing.append(item)
    return present, missing


def parse_possibly_undocumented(lines: list[str], known_docs: set[str]) -> dict[str, list[dict[str, str]]]:
    known_in_docs: list[dict[str, str]] = []
    not_in_docs: list[dict[str, str]] = []
    for line in lines:
        match = re.match(r"^- ([^(]+) \(([^)]+)\)$", line.strip())
        if not match:
            continue
        entry = {"name": match.group(1).strip(), "type": match.group(2).strip()}
        if entry["name"] in known_docs:
            known_in_docs.append(entry)
        else:
            not_in_docs.append(entry)
    return {
        "known_in_docs": sorted(known_in_docs, key=lambda item: item["name"].lower()),
        "not_in_docs": sorted(not_in_docs, key=lambda item: item["name"].lower()),
    }


def parse_userdata_globals(lines: list[str]) -> dict[str, str]:
    values: dict[str, str] = {}
    for line in lines:
        match = re.match(r"^- ([A-Za-z_][A-Za-z0-9_]*):\s+(<userdata: .+>)$", line.strip())
        if match:
            values[match.group(1)] = match.group(2)
    return values


def parse_callables(lines: list[str]) -> list[dict[str, Any]]:
    callables: list[dict[str, Any]] = []
    for line in lines:
        match = re.match(
            r"^- (.+?) : function \[origin=(.+?), safety=([^\]]+)\](?: \[dangerous-name\])?$",
            line.strip(),
        )
        if not match:
            continue
        callables.append(
            {
                "path": match.group(1).strip(),
                "origin": match.group(2).strip(),
                "safety": match.group(3).strip(),
                "dangerous_name": line.strip().endswith("[dangerous-name]"),
            }
        )
    return callables


def parse_enum_like(lines: list[str]) -> tuple[list[dict[str, Any]], list[dict[str, Any]]]:
    userdata: list[dict[str, Any]] = []
    tables: list[dict[str, Any]] = []
    current: dict[str, Any] | None = None
    current_kind = ""
    for line in lines:
        stripped = line.strip()
        user_match = re.match(r"^- (.+?) \(Enum-like Userdata: (.+)\)$", stripped)
        table_match = re.match(r"^- (.+?) \((enum-like|constant-like|known enum from stubs)\)$", stripped)
        if user_match:
            current = {"name": user_match.group(1), "kind": user_match.group(2), "details": {}}
            userdata.append(current)
            current_kind = "userdata"
            continue
        if table_match:
            current = {"name": table_match.group(1), "kind": table_match.group(2), "values": []}
            tables.append(current)
            current_kind = "table"
            continue
        if current is None:
            continue
        if current_kind == "userdata":
            detail_match = re.match(r"^(type|value|metatable):\s+(.+)$", stripped)
            if detail_match:
                current["details"][detail_match.group(1)] = detail_match.group(2)
        elif current_kind == "table":
            value_match = re.match(r"^([^=]+)=\s+(.+)$", stripped)
            if value_match and not value_match.group(1).strip().startswith("composition"):
                current["values"].append(
                    {
                        "key": value_match.group(1).strip(),
                        "value": value_match.group(2).strip(),
                    }
                )
    return userdata, tables


def parse_output_context(lines: list[str], saw_prefix: bool, chunk_markers: int) -> dict[str, Any]:
    context: dict[str, Any] = {
        "transport_prefix_detected": saw_prefix,
        "console_fallback": False,
        "io_available": None,
        "chunk_markers": chunk_markers,
    }
    for line in lines:
        if line.startswith("Result:"):
            context["result"] = line.split(":", 1)[1].strip()
            context["console_fallback"] = "printed to console fallback" in line
            if "saved with io.open" in line:
                context["io_available"] = True
        elif line.startswith("Fallback reason:"):
            reason = line.split(":", 1)[1].strip()
            context["fallback_reason"] = reason
            if "io table unavailable" in reason or "io.open unavailable" in reason:
                context["io_available"] = False
        elif line.startswith("Target filename:"):
            context["target_filename"] = line.split(":", 1)[1].strip()
    return context


def merge_execution_context(context: dict[str, Any], lines: list[str]) -> dict[str, Any]:
    for line in lines:
        if line.startswith("PROBE_MODE:"):
            context["probe_mode"] = line.split(":", 1)[1].strip()
        elif line.startswith("TABLE_ENUM_MODE:"):
            context["table_enum_mode"] = line.split(":", 1)[1].strip()
        elif line.startswith("IO_AVAILABLE at startup:"):
            value = line.split(":", 1)[1].strip().lower()
            context["io_available_at_startup"] = value == "true"
        elif line.startswith("ENABLE_DEEP_GLOBAL_DUMP:"):
            value = line.split(":", 1)[1].strip().lower()
            context["deep_global_dump"] = value == "true"
    return context


def runtime_aliases_from_report(
    present_symbols: list[dict[str, str]],
    possible: dict[str, list[dict[str, str]]],
    userdata_globals: dict[str, str],
) -> list[dict[str, str]]:
    present_names = {entry["name"]: entry for entry in present_symbols}
    possible_names = {entry["name"]: entry for group in possible.values() for entry in group}
    aliases: list[dict[str, str]] = []
    for alias, target in sorted(RUNTIME_ALIAS_TARGETS.items()):
        evidence = ""
        typ = ""
        value = ""
        if alias in userdata_globals:
            evidence = "Userdata Globals"
            typ = "userdata"
            value = userdata_globals[alias]
        elif alias in present_names:
            evidence = "Known Stub Symbols Present/Missing"
            typ = present_names[alias].get("type", "")
            value = present_names[alias].get("value", "")
        elif alias in possible_names:
            evidence = "Possibly Undocumented Globals"
            typ = possible_names[alias].get("type", "")
        else:
            continue
        aliases.append(
            {
                "name": alias,
                "target": target,
                "type": typ,
                "value": value,
                "evidence": evidence,
            }
        )
    return aliases


def build_runtime_probe_index(root: Path = ROOT, report: Path | None = None) -> dict[str, Any]:
    report = report or latest_report(root)
    if report is None or not report.exists():
        return {
            "schema_version": 1,
            "generated_at_utc": datetime.now(UTC).replace(microsecond=0).isoformat(),
            "source_report": None,
            "source_timestamp": None,
            "source_sha256": None,
            "runtime": {},
            "output_context": {"console_fallback": None, "transport_prefix_detected": False},
            "present_symbols": [],
            "missing_symbols": [],
            "runtime_aliases": [],
            "possibly_undocumented_globals": {"known_in_docs": [], "not_in_docs": []},
            "callables": [],
            "enum_like_userdata": [],
            "enum_like_tables": [],
            "field_probes": [],
            "enum_value_probes": [],
            "enum_value_candidates": [],
            "environment": {},
            "runtime_test": {},
            "callback_contexts": [],
            "callback_args": [],
            "callback_fields": [],
            "callback_errors": [],
            "callback_item_contexts": [],
            "safe_io": {
                "io_present": False,
                "io_open_present": False,
                "io_popen_present": False,
                "io_tmpfile_present": False,
                "safe_io_expected": False,
                "safe_io_likely_injected": "unknown",
                "transport": None,
                "io_type": None,
                "io_value": "",
                "console_fallback": None,
            },
            "counts": {},
        }

    lines, saw_prefix, chunk_markers = clean_report_lines(report)
    sections = split_sections(lines)
    machine_blocks = parse_machine_blocks(lines)
    known_docs = docs_symbols()
    output_context = merge_execution_context(
        parse_output_context(sections.get("Output", []), saw_prefix, chunk_markers),
        sections.get("Execution / Transport Context", []),
    )
    if "SYMBOLS" in machine_blocks:
        present_symbols, missing_symbols = parse_machine_symbols(machine_blocks.get("SYMBOLS", []))
    else:
        present_symbols, missing_symbols = parse_known_symbols(sections.get("Known Stub Symbols Present/Missing", []))
    possible = parse_possibly_undocumented(sections.get("Possibly Undocumented Globals", []), known_docs)
    userdata_globals = parse_userdata_globals(sections.get("Userdata Globals", []))
    enum_userdata, enum_tables = parse_enum_like(sections.get("Enum-like Tables / Constants", []))
    if "CALLABLES" in machine_blocks:
        callables = parse_machine_callables(machine_blocks.get("CALLABLES", []))
    else:
        callables = parse_callables(sections.get("Callable Inventory", []))
    if "ALIASES" in machine_blocks:
        runtime_aliases = parse_machine_aliases(machine_blocks.get("ALIASES", []))
    else:
        runtime_aliases = runtime_aliases_from_report(present_symbols, possible, userdata_globals)
    field_probes = parse_machine_fields(machine_blocks.get("FIELDS", []))
    enum_value_probes = parse_machine_enum_values(machine_blocks.get("ENUM_VALUES", []))
    enum_value_candidates = parse_machine_enum_candidates(machine_blocks.get("ENUM_CANDIDATES", []))
    environment = parse_machine_environment(machine_blocks.get("ENVIRONMENT", []))
    if not environment:
        environment = infer_environment_from_legacy(present_symbols, output_context)
    runtime_test = parse_machine_runtime_test(machine_blocks.get("RUNTIME_TEST_CONTEXT", []))
    callback_contexts = parse_callback_reports(lines)
    if callback_contexts:
        callback_args = flatten_callback_items(callback_contexts, "args")
        callback_fields = flatten_callback_items(callback_contexts, "fields")
        callback_errors = flatten_callback_items(callback_contexts, "errors")
        callback_item_contexts = flatten_callback_item_contexts(callback_contexts)
    else:
        callback_contexts = parse_machine_generic("callback", machine_blocks.get("CALLBACK_CONTEXT", []))
        callback_args = parse_machine_generic("arg", machine_blocks.get("CALLBACK_ARGS", []))
        callback_fields = parse_machine_generic("field", machine_blocks.get("CALLBACK_FIELDS", []))
        callback_errors = parse_machine_generic("error", machine_blocks.get("CALLBACK_ERRORS", []))
        callback_item_contexts = parse_machine_generic("item", machine_blocks.get("CALLBACK_ITEM_CONTEXT", []))

    timestamp = report_timestamp(report)
    index = {
        "schema_version": 1,
        "generated_at_utc": datetime.now(UTC).replace(microsecond=0).isoformat(),
        "source_report": report.relative_to(root).as_posix(),
        "source_timestamp": timestamp,
        "source_sha256": sha256(report),
        "runtime": parse_runtime(sections.get("Runtime", [])),
        "output_context": output_context,
        "environment": environment,
        "runtime_test": runtime_test,
        "present_symbols": sorted(present_symbols, key=lambda item: item["name"].lower()),
        "missing_symbols": sorted(set(missing_symbols), key=str.lower),
        "runtime_aliases": runtime_aliases,
        "possibly_undocumented_globals": possible,
        "callables": sorted(callables, key=lambda item: item["path"].lower()),
        "enum_like_userdata": sorted(enum_userdata, key=lambda item: item["name"].lower()),
        "enum_like_tables": sorted(enum_tables, key=lambda item: item["name"].lower()),
        "field_probes": sorted(field_probes, key=lambda item: (item["owner"].lower(), item["field"].lower())),
        "enum_value_probes": sorted(enum_value_probes, key=lambda item: (item["enum"].lower(), item["value"].lower())),
        "enum_value_candidates": sorted(enum_value_candidates, key=lambda item: (item["enum"].lower(), item["value"].lower())),
        "callback_contexts": callback_contexts,
        "callback_args": callback_args,
        "callback_fields": callback_fields,
        "callback_errors": callback_errors,
        "callback_item_contexts": callback_item_contexts,
        "safe_io": safe_io_info(present_symbols, output_context, environment),
        "counts": {
            "present_symbols": len(present_symbols),
            "missing_symbols": len(set(missing_symbols)),
            "runtime_aliases": len(runtime_aliases),
            "possibly_undocumented_known_in_docs": len(possible["known_in_docs"]),
            "possibly_undocumented_not_in_docs": len(possible["not_in_docs"]),
            "callables": len(callables),
            "enum_like_userdata": len(enum_userdata),
            "enum_like_tables": len(enum_tables),
            "field_probes": len(field_probes),
            "enum_value_probes": len(enum_value_probes),
            "enum_value_candidates": len(enum_value_candidates),
            "callback_contexts": len(callback_contexts),
            "callback_args": len(callback_args),
            "callback_fields": len(callback_fields),
            "callback_errors": len(callback_errors),
            "callback_item_contexts": len(callback_item_contexts),
        },
    }
    return index


def load_runtime_probe_index(path: Path = RUNTIME_PROBE_INDEX) -> dict[str, Any] | None:
    if not path.exists():
        return None
    return json.loads(path.read_text(encoding="utf-8"))


def save_runtime_probe_index(index: dict[str, Any], path: Path = RUNTIME_PROBE_INDEX) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(index, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def render_runtime_probe_report(index: dict[str, Any]) -> str:
    lines = [
        "# Runtime probe stub improvements",
        "",
        "Generated from MDRG runtime probe report. This report is evidence only; docs.txt remains authoritative.",
        "",
        "## Source",
        "",
        f"- Report: `{index.get('source_report')}`",
        f"- Timestamp: `{index.get('source_timestamp')}`",
        f"- SHA256: `{index.get('source_sha256')}`",
        "",
        "## Runtime",
        "",
    ]
    runtime = index.get("runtime", {})
    moonsharp = runtime.get("moonsharp", {}) if isinstance(runtime, dict) else {}
    lines.append(f"- Lua version: `{runtime.get('lua_version')}`")
    lines.append(f"- MoonSharp version: `{moonsharp.get('version')}`")
    lines.append(f"- MoonSharp platform: `{moonsharp.get('platform')}`")
    lines.append(f"- Unity: `{moonsharp.get('is_unity')}`")
    safe_io = index.get("safe_io", {})
    if isinstance(safe_io, dict):
        lines.append(f"- Safe IO / `io` present: `{safe_io.get('io_present')}` ({safe_io.get('io_type')})")
        lines.append(f"- `io.open` present: `{safe_io.get('io_open_present')}`")
        lines.append(f"- `io.popen` present: `{safe_io.get('io_popen_present')}`")
        lines.append(f"- Safe IO likely injected: `{safe_io.get('safe_io_likely_injected')}`")
    lines.append("")
    environment = index.get("environment", {})
    if isinstance(environment, dict) and environment:
        lines.extend(
            [
                "## Environment",
                "",
                f"- Detected context: `{environment.get('detected_context')}`",
                f"- Confidence: `{environment.get('context_confidence')}`",
                f"- Effective GameVariables source: `{environment.get('effective_gamevariables_source')}`",
                f"- Transport: `{environment.get('transport')}`",
                "",
            ]
        )
    lines.append("## Runtime aliases")
    lines.append("")
    aliases = index.get("runtime_aliases", [])
    if aliases:
        for alias in aliases:
            lines.append(f"- `{alias['name']}` -> `{alias['target']}` ({alias.get('type')}, {alias.get('evidence')})")
    else:
        lines.append("- None")
    lines.extend(["", "## Present symbols not already listed as normal runtime stubs", ""])
    possible = index.get("possibly_undocumented_globals", {})
    known = possible.get("known_in_docs", [])
    unknown = possible.get("not_in_docs", [])
    lines.append("Known in docs.txt:")
    if known:
        for entry in known[:80]:
            lines.append(f"- `{entry['name']}` ({entry['type']})")
    else:
        lines.append("- None")
    lines.append("")
    lines.append("Not in docs.txt:")
    if unknown:
        for entry in unknown[:80]:
            lines.append(f"- `{entry['name']}` ({entry['type']})")
    else:
        lines.append("- None")
    lines.extend(["", "## Enum-like userdata", ""])
    enum_userdata = index.get("enum_like_userdata", [])
    if enum_userdata:
        for entry in enum_userdata:
            lines.append(f"- `{entry['name']}`: {entry.get('kind')}")
    else:
        lines.append("- None")
    lines.extend(["", "## Callable safety summary", ""])
    buckets: dict[str, int] = {}
    for callable_info in index.get("callables", []):
        safety = callable_info.get("safety", "Unknown")
        buckets[safety] = buckets.get(safety, 0) + 1
    if buckets:
        for safety, count in sorted(buckets.items()):
            lines.append(f"- `{safety}`: {count}")
    else:
        lines.append("- None")
    lines.extend(["", "## Probe field/value checks", ""])
    lines.append(f"- Known field probes: `{len(index.get('field_probes', []))}`")
    lines.append(f"- Enum value probes: `{len(index.get('enum_value_probes', []))}`")
    lines.append(f"- Unconfirmed enum candidates: `{len(index.get('enum_value_candidates', []))}`")
    lines.append(f"- Callback context rows: `{len(index.get('callback_contexts', []))}`")
    lines.append(f"- Callback args: `{len(index.get('callback_args', []))}`")
    lines.append(f"- Callback fields: `{len(index.get('callback_fields', []))}`")
    lines.append(f"- Callback access errors: `{len(index.get('callback_errors', []))}`")
    lines.append(f"- Callback item contexts: `{len(index.get('callback_item_contexts', []))}`")
    runtime_test = index.get("runtime_test", {})
    if isinstance(runtime_test, dict) and runtime_test:
        lines.extend(["", "Runtime test:"])
        lines.append(f"- ID: `{runtime_test.get('id')}`")
        lines.append(f"- Label: `{runtime_test.get('label')}`")
        lines.append(f"- Folder: `{runtime_test.get('folder')}`")
    callback_contexts = index.get("callback_contexts", [])
    if callback_contexts:
        lines.extend(["", "Callback context samples:"])
        for context in callback_contexts[:20]:
            if not isinstance(context, dict):
                continue
            lines.append(
                "- `"
                + str(context.get("callback_name") or context.get("callback_id"))
                + "` phase=`"
                + str(context.get("phase"))
                + "` context=`"
                + str(context.get("detected_context"))
                + "` surrounding=`"
                + str(context.get("surrounding_context") or context.get("detected_context") or "")
                + "`"
            )
    lines.extend(["", "## Rejected automatic changes", ""])
    lines.append("- No methods, fields or classes are created automatically from the probe.")
    lines.append("- Missing `GameVariables` global is treated as console/plugin context, not API absence.")
    lines.append("- Enum userdata presence confirms runtime exposure, but values still come from docs/dumps.")
    return "\n".join(lines) + "\n"


def present_symbol_names(index: dict[str, Any]) -> set[str]:
    return {entry.get("name", "") for entry in index.get("present_symbols", []) if isinstance(entry, dict)}


def present_field_keys(index: dict[str, Any]) -> set[str]:
    return {
        f"{entry.get('owner')}.{entry.get('field')}"
        for entry in index.get("field_probes", [])
        if isinstance(entry, dict) and entry.get("status") == "present"
    }


def present_enum_keys(index: dict[str, Any]) -> set[str]:
    return {
        f"{entry.get('enum')}.{entry.get('value')}"
        for entry in index.get("enum_value_probes", [])
        if isinstance(entry, dict) and entry.get("status") == "present"
    }


def callback_context_keys(index: dict[str, Any]) -> set[str]:
    keys: set[str] = set()
    for row in index.get("callback_contexts", []):
        if not isinstance(row, dict):
            continue
        callback = row.get("callback_name") or row.get("callback_id") or "<callback>"
        phase = row.get("phase") or "<phase>"
        detected = row.get("detected_context") or row.get("surrounding_context") or "<context>"
        keys.add(f"{callback}|{phase}|{detected}")
    return keys


def callback_arg_keys(index: dict[str, Any]) -> set[str]:
    keys: set[str] = set()
    for row in index.get("callback_args", []):
        if not isinstance(row, dict):
            continue
        callback = row.get("callback_id") or row.get("callback_name") or "<callback>"
        phase = row.get("phase") or "<phase>"
        index_text = row.get("index") or row.get("col_1") or "<index>"
        name = row.get("name") or row.get("col_2") or "<arg>"
        typ = row.get("type") or row.get("col_3") or "<type>"
        keys.add(f"{callback}|{phase}|{index_text}|{name}|{typ}")
    return keys


def callback_field_keys(index: dict[str, Any]) -> set[str]:
    keys: set[str] = set()
    for row in index.get("callback_fields", []):
        if not isinstance(row, dict):
            continue
        callback = row.get("callback_id") or row.get("callback_name") or "<callback>"
        phase = row.get("phase") or "<phase>"
        owner = row.get("owner") or row.get("col_1") or "<owner>"
        field = row.get("field") or row.get("col_2") or "<field>"
        status = row.get("status") or row.get("col_4") or "<status>"
        typ = row.get("type") or row.get("col_3") or "<type>"
        keys.add(f"{callback}|{phase}|{owner}.{field}|{status}|{typ}")
    return keys


def callback_error_keys(index: dict[str, Any]) -> set[str]:
    keys: set[str] = set()
    for row in index.get("callback_errors", []):
        if not isinstance(row, dict):
            continue
        callback = row.get("callback_id") or row.get("callback_name") or "<callback>"
        phase = row.get("phase") or "<phase>"
        kind = row.get("kind") or row.get("col_1") or "<kind>"
        path = row.get("path") or row.get("col_2") or "<path>"
        keys.add(f"{callback}|{phase}|{kind}|{path}")
    return keys


def callback_item_context_keys(index: dict[str, Any]) -> set[str]:
    keys: set[str] = set()
    for row in index.get("callback_item_contexts", []):
        if not isinstance(row, dict):
            continue
        callback = row.get("callback_id") or row.get("callback_name") or "<callback>"
        phase = row.get("phase") or "<phase>"
        label = row.get("inferred_item_label") or row.get("value") or "<item>"
        keys.add(f"{callback}|{phase}|{label}")
    return keys


def render_compare_report(a: dict[str, Any], b: dict[str, Any]) -> str:
    a_env = a.get("environment", {}) if isinstance(a.get("environment"), dict) else {}
    b_env = b.get("environment", {}) if isinstance(b.get("environment"), dict) else {}
    a_symbols = present_symbol_names(a)
    b_symbols = present_symbol_names(b)
    a_fields = present_field_keys(a)
    b_fields = present_field_keys(b)
    a_enums = present_enum_keys(a)
    b_enums = present_enum_keys(b)

    lines = [
        "# Runtime probe compare",
        "",
        f"- A: `{a.get('source_report')}`",
        f"- B: `{b.get('source_report')}`",
        "",
        "## Environment",
        "",
    ]
    keys = [
        "detected_context",
        "current_mod_guid_present",
        "gamevariables_present",
        "gv_present",
        "flowchart_present",
        "io_present",
        "io_open_present",
        "io_popen_present",
        "effective_gamevariables_source",
        "transport",
    ]
    for key in keys:
        lines.append(f"- `{key}`: A=`{a_env.get(key)}` B=`{b_env.get(key)}`")

    def append_delta(title: str, only_a: set[str], only_b: set[str]) -> None:
        lines.extend(["", f"## {title}", ""])
        lines.append("Only in A:")
        lines.extend(f"- `{item}`" for item in sorted(only_a, key=str.lower)[:120])
        if not only_a:
            lines.append("- None")
        lines.append("")
        lines.append("Only in B:")
        lines.extend(f"- `{item}`" for item in sorted(only_b, key=str.lower)[:120])
        if not only_b:
            lines.append("- None")

    append_delta("Present symbols", a_symbols - b_symbols, b_symbols - a_symbols)
    append_delta("Present field probes", a_fields - b_fields, b_fields - a_fields)
    append_delta("Present enum values", a_enums - b_enums, b_enums - a_enums)
    a_callbacks = callback_context_keys(a)
    b_callbacks = callback_context_keys(b)
    append_delta("Callback contexts", a_callbacks - b_callbacks, b_callbacks - a_callbacks)
    append_delta("Callback args", callback_arg_keys(a) - callback_arg_keys(b), callback_arg_keys(b) - callback_arg_keys(a))
    append_delta(
        "Callback fields",
        callback_field_keys(a) - callback_field_keys(b),
        callback_field_keys(b) - callback_field_keys(a),
    )
    append_delta(
        "Callback errors",
        callback_error_keys(a) - callback_error_keys(b),
        callback_error_keys(b) - callback_error_keys(a),
    )
    append_delta(
        "Callback item contexts",
        callback_item_context_keys(a) - callback_item_context_keys(b),
        callback_item_context_keys(b) - callback_item_context_keys(a),
    )
    return "\n".join(lines) + "\n"


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Build curated MDRG runtime probe index from report-*.txt.")
    parser.add_argument("--report", type=Path, help="specific probe report to ingest")
    parser.add_argument("--output", type=Path, default=RUNTIME_PROBE_INDEX, help="output JSON path")
    parser.add_argument("--compare", nargs=2, type=Path, metavar=("REPORT_A", "REPORT_B"), help="compare two probe reports")
    return parser


def main() -> int:
    args = build_parser().parse_args()
    if args.compare:
        reports = [path if path.is_absolute() else ROOT / path for path in args.compare]
        a = build_runtime_probe_index(ROOT, reports[0])
        b = build_runtime_probe_index(ROOT, reports[1])
        print(render_compare_report(a, b), end="")
        return 0

    report = args.report
    if report is not None and not report.is_absolute():
        report = ROOT / report
    index = build_runtime_probe_index(ROOT, report)
    save_runtime_probe_index(index, args.output if args.output.is_absolute() else ROOT / args.output)
    print(
        "Built runtime probe index: "
        f"report={index.get('source_report')}, "
        f"aliases={len(index.get('runtime_aliases', []))}, "
        f"present={len(index.get('present_symbols', []))}, "
        f"callables={len(index.get('callables', []))}, "
        f"enum_userdata={len(index.get('enum_like_userdata', []))}, "
        f"field_probes={len(index.get('field_probes', []))}."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
