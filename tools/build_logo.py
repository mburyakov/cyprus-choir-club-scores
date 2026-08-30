#!/usr/bin/env python3
"""Build all logo variants and publication formats."""

import argparse
import hashlib
import shutil
import subprocess
import sys
import urllib.request
from pathlib import Path


JOST_URL = "https://raw.githubusercontent.com/google/fonts/main/ofl/jost/Jost%5Bwght%5D.ttf"
SOURCE_HASH_PREFIX = "%%SourceSHA256: "


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    project_root = Path(__file__).resolve().parent.parent
    tools = project_root / "tools"
    source = project_root / "include" / "cyprus-choral-club.svg"
    font = project_root / "build" / "fonts" / "Jost.ttf"
    output = project_root / "build" / "logo"
    bundled_eps = project_root / "include" / "cyprus-choral-club.eps"
    source_hash = hashlib.sha256(source.read_bytes()).hexdigest()

    if args.check:
        expected = f"{SOURCE_HASH_PREFIX}{source_hash}"
        if expected not in bundled_eps.read_text():
            raise SystemExit("Bundled EPS is stale; run tools/build_logo.py and commit it")
        return

    if not font.exists():
        font.parent.mkdir(parents=True, exist_ok=True)
        urllib.request.urlretrieve(JOST_URL, font)

    subprocess.run([
        sys.executable,
        tools / "export-logo-variants.py",
        source,
        output,
    ], check=True)
    subprocess.run([
        sys.executable,
        tools / "render-logo-formats.py",
        output,
        "--font", font,
    ], check=True)

    compact_eps = output / "cyprus-choral-club-compact.eps"
    contents = compact_eps.read_text()
    compact_eps.write_text(contents.replace(
        "\n", f"\n{SOURCE_HASH_PREFIX}{source_hash}\n", 1,
    ))
    shutil.copyfile(compact_eps, bundled_eps)


if __name__ == "__main__":
    main()
