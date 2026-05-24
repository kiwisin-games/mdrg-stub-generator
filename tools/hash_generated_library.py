from __future__ import annotations

import argparse
import hashlib
import json
from datetime import UTC, datetime
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
LIBRARY = ROOT / "library"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def snapshot() -> dict[str, object]:
    files = {}
    for path in sorted(LIBRARY.glob("*.d.lua")):
        files[path.relative_to(ROOT).as_posix()] = {
            "sha256": sha256(path),
            "bytes": path.stat().st_size,
        }
    return {
        "generated_at_utc": datetime.now(UTC).replace(microsecond=0).isoformat(),
        "files": files,
    }


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Hash generated library stubs.")
    parser.add_argument("--output", type=Path, default=ROOT / "analysis" / "generator_output_snapshot.json")
    return parser


def main() -> int:
    args = build_parser().parse_args()
    output = args.output if args.output.is_absolute() else ROOT / args.output
    output.parent.mkdir(parents=True, exist_ok=True)
    data = snapshot()
    output.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Hashed generated library: files={len(data['files'])}, output={output.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
