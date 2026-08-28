#!/usr/bin/env python3
"""Render browser-compatible SVG files to portable publication formats."""

import argparse
import html
import shutil
import subprocess
from pathlib import Path


PAGE = """<!doctype html>
<style>
@page {{ size: 50mm 50mm; margin: 0; }}
html, body {{ margin: 0; overflow: hidden; }}
img {{ display: block; }}
@media print {{ html, body, img {{ width: 50mm; height: 50mm; }} }}
@media screen {{ html, body, img {{ width: 3000px; height: 3000px; }} }}
</style>
<img src="{}">
"""


def run(*command: str) -> None:
    subprocess.run(command, check=True)


def find_browser() -> str:
    for command in ("google-chrome", "chromium", "chromium-browser"):
        if path := shutil.which(command):
            return path
    macos_chrome = Path("/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
    if macos_chrome.exists():
        return str(macos_chrome)
    raise SystemExit("Google Chrome or Chromium is required")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("directory", type=Path)
    args = parser.parse_args()
    browser = find_browser()

    for command in ("pdftops", "pdftocairo"):
        if not shutil.which(command):
            raise SystemExit(f"{command} is required (install the Poppler package)")

    for svg in sorted(args.directory.glob("*.svg")):
        source_svg = svg.with_suffix(".source.svg")
        page = svg.with_suffix(".html")
        pdf = svg.with_suffix(".pdf")
        eps = svg.with_suffix(".eps")
        png_stem = svg.with_suffix("")

        svg.rename(source_svg)
        page.write_text(PAGE.format(html.escape(source_svg.name, quote=True)))
        run(
            browser, "--headless", "--no-sandbox", "--disable-gpu",
            "--allow-file-access-from-files", "--no-pdf-header-footer",
            f"--print-to-pdf={pdf.resolve()}", page.resolve().as_uri(),
        )
        run(
            browser, "--headless", "--no-sandbox", "--disable-gpu",
            "--allow-file-access-from-files", "--hide-scrollbars",
            "--run-all-compositor-stages-before-draw", "--window-size=3000,3000",
            f"--screenshot={png_stem.with_suffix('.png').resolve()}", page.resolve().as_uri(),
        )
        run("pdftops", "-eps", str(pdf), str(eps))
        run("pdftocairo", "-svg", str(pdf), str(svg))
        source_svg.unlink()
        page.unlink()


if __name__ == "__main__":
    main()
