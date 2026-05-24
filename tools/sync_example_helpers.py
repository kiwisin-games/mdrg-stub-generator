from __future__ import annotations

import argparse
import hashlib
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "examples" / "mdrg_callback_context_probe.lua"
DESTINATION = ROOT / "examples" / "callback_debug_mod_real" / "mdrg_callback_context_probe.lua"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def check() -> bool:
    if not SOURCE.exists():
        print(f"Missing source helper: {SOURCE.relative_to(ROOT)}")
        return False
    if not DESTINATION.exists():
        print(f"Missing packaged helper: {DESTINATION.relative_to(ROOT)}")
        return False
    source_hash = sha256(SOURCE)
    destination_hash = sha256(DESTINATION)
    if source_hash != destination_hash:
        print("Callback helper copy is out of sync:")
        print(f"- source: {SOURCE.relative_to(ROOT)} {source_hash}")
        print(f"- copy:   {DESTINATION.relative_to(ROOT)} {destination_hash}")
        return False
    print("Callback helper copy is in sync.")
    return True


def write() -> None:
    DESTINATION.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(SOURCE, DESTINATION)
    print(f"Copied {SOURCE.relative_to(ROOT)} -> {DESTINATION.relative_to(ROOT)}")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Check or sync duplicated example helper files.")
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--check", action="store_true", help="fail if helper copies differ")
    mode.add_argument("--write", action="store_true", help="copy standalone helper into debug mod")
    return parser


def main() -> int:
    args = build_parser().parse_args()
    if args.write:
        write()
        return 0
    return 0 if check() else 1


if __name__ == "__main__":
    raise SystemExit(main())
