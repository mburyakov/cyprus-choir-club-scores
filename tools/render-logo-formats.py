#!/usr/bin/env python3
"""Render browser-compatible SVG files to portable publication formats."""

import argparse
import base64
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
    subprocess.run(command, check=True, timeout=60)


def find_browser() -> str:
    for command in ("google-chrome", "chromium", "chromium-browser"):
        if path := shutil.which(command):
            return path
    macos_chrome = Path("/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
    if macos_chrome.exists():
        return str(macos_chrome)
    raise SystemExit("Google Chrome or Chromium is required")


def embed_font(svg: Path, font: Path) -> None:
    encoded = base64.b64encode(font.read_bytes()).decode("ascii")
    font_face = (
        "<style>@font-face{font-family:Jost;"
        f"src:url(data:font/ttf;base64,{encoded}) format('truetype');"
        "font-style:normal;font-weight:100 900}</style>"
    )
    contents = svg.read_text()
    if "<defs>" not in contents:
        raise SystemExit(f"No <defs> element in {svg}")
    svg.write_text(contents.replace("<defs>", f"<defs>\n  {font_face}", 1))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("directory", type=Path)
    parser.add_argument("--font", required=True, type=Path)
    args = parser.parse_args()
    browser = find_browser()
    browser_args = (
        browser, "--headless", "--no-sandbox", "--disable-gpu",
        "--disable-background-networking", "--disable-component-update",
        "--disable-sync", "--no-first-run", "--no-default-browser-check",
        "--allow-file-access-from-files",
    )

    for command in ("pdftops",):
        if not shutil.which(command):
            raise SystemExit(f"{command} is required (install the Poppler package)")

    for svg in sorted(args.directory.glob("*.svg")):
        page = svg.with_suffix(".html")
        pdf = svg.with_suffix(".pdf")
        eps = svg.with_suffix(".eps")
        png_stem = svg.with_suffix("")

        embed_font(svg, args.font)
        page.write_text(PAGE.format(html.escape(svg.name, quote=True)))
        run(
            *browser_args, "--no-pdf-header-footer",
            f"--print-to-pdf={pdf.resolve()}", page.resolve().as_uri(),
        )
        run(
            *browser_args, "--hide-scrollbars", "--virtual-time-budget=10000",
            "--window-size=3000,3000",
            f"--screenshot={png_stem.with_suffix('.png').resolve()}", page.resolve().as_uri(),
        )
        run("pdftops", "-eps", str(pdf), str(eps))
        page.unlink()


if __name__ == "__main__":
    main()
