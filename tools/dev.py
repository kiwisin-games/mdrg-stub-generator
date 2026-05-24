from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
TOOLS = ROOT / "tools"


def run(command: list[str], *, allow_failure: bool = False) -> int:
    print(f"> {' '.join(command)}", flush=True)
    result = subprocess.run(command, cwd=ROOT)
    if result.returncode and not allow_failure:
        raise SystemExit(result.returncode)
    return result.returncode


def python_command(script: str) -> list[str]:
    return [sys.executable, str(TOOLS / script)]


def py_compile() -> None:
    scripts = sorted(str(path) for path in TOOLS.glob("*.py"))
    run([sys.executable, "-m", "py_compile", *scripts])


def command_index(_: argparse.Namespace) -> None:
    run(python_command("build_source_indexes.py"))


def command_generate(_: argparse.Namespace) -> None:
    run(python_command("generate_luals_addon.py"))


def command_validate(_: argparse.Namespace) -> None:
    run(python_command("validate_addon.py"))


def command_health(_: argparse.Namespace) -> None:
    run(python_command("validate_addon.py") + ["--health"])


def generated_diff_summary() -> list[str]:
    if not (ROOT / ".git").exists() or not shutil.which("git"):
        return []
    result = subprocess.run(
        ["git", "status", "--short", "--", "library", "README.md", "config.json", "info.json", "analysis"],
        cwd=ROOT,
        check=False,
        capture_output=True,
        text=True,
    )
    if result.returncode:
        return []
    return [line for line in result.stdout.splitlines() if line.strip()]


def command_check(_: argparse.Namespace) -> None:
    py_compile()
    run(python_command("sync_example_helpers.py") + ["--check"])
    run(python_command("generate_luals_addon.py"))
    run(python_command("validate_addon.py") + ["--health"])

    diffs = generated_diff_summary()
    if diffs:
        print("Generated/tracked outputs have pending diffs after generation:")
        for line in diffs:
            print(f"  {line}")
        print("Review and commit these generated output changes when expected.")
    else:
        print("Generated/tracked outputs are in sync.")

    lua_ls = shutil.which("lua-language-server")
    if lua_ls:
        print(f"lua-language-server found: {lua_ls}")
        print("LuaLS execution is environment-specific; run your workspace check command if configured.")
    else:
        print("Warning: lua-language-server not found in PATH; LuaLS check skipped.")


def command_clean(_: argparse.Namespace) -> None:
    removed: list[str] = []
    for path in ROOT.rglob("__pycache__"):
        if path.is_dir() and path.resolve().is_relative_to(ROOT):
            shutil.rmtree(path)
            removed.append(str(path.relative_to(ROOT)))
    for pattern in [".luals-*", ".tmp_raw_sources"]:
        for path in ROOT.glob(pattern):
            if path.exists() and path.resolve().is_relative_to(ROOT):
                if path.is_dir():
                    shutil.rmtree(path)
                else:
                    path.unlink()
                removed.append(str(path.relative_to(ROOT)))
    if removed:
        print("Removed:")
        for item in removed:
            print(f"- {item}")
    else:
        print("Nothing to clean.")


def command_sync(_: argparse.Namespace) -> None:
    run(python_command("sync_example_helpers.py") + ["--write"])


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="MDRG addon development helper.")
    subcommands = parser.add_subparsers(dest="command", required=True)

    for name, handler, help_text in [
        ("index", command_index, "rebuild curated data indexes from local raw sources"),
        ("generate", command_generate, "regenerate library/, README.md, config.json, and reports"),
        ("validate", command_validate, "run addon structural validation"),
        ("health", command_health, "print a short project health report"),
        ("sync", command_sync, "sync duplicated example helper files"),
        ("check", command_check, "compile scripts, generate, validate, and report LuaLS availability"),
        ("clean", command_clean, "remove local caches and temporary validation directories"),
    ]:
        command_parser = subcommands.add_parser(name, help=help_text)
        command_parser.set_defaults(handler=handler)
    return parser


def main() -> int:
    parser = build_parser()
    args = parser.parse_args()
    args.handler(args)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
