#!/usr/bin/env python3
"""Render browser-compatible SVG files to portable publication formats."""

import argparse
import html
import subprocess
from pathlib import Path


PAGE = """<!doctype html>
<style>
@page { size: 50mm 50mm; margin: 0; }
html, body { margin: 0; width: 50mm; height: 50mm; overflow: hidden; }
img { display: block; width: 50mm; height: 50mm; }
</style>
<img src="{}">
"""


def run(*command: str) -> None:
    subprocess.run(command, check=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("directory", type=Path)
    args = parser.parse_args()

    for svg in sorted(args.directory.glob("*.svg")):
        source_svg = svg.with_suffix(".source.svg")
        page = svg.with_suffix(".html")
        pdf = svg.with_suffix(".pdf")
        eps = svg.with_suffix(".eps")
        png_stem = svg.with_suffix("")

        svg.rename(source_svg)
        page.write_text(PAGE.format(html.escape(source_svg.name, quote=True)))
        run(
            "google-chrome", "--headless", "--no-sandbox", "--disable-gpu",
            "--allow-file-access-from-files", "--no-pdf-header-footer",
            f"--print-to-pdf={pdf.resolve()}", page.resolve().as_uri(),
        )
        run("pdftops", "-eps", str(pdf), str(eps))
        run("pdftocairo", "-svg", str(pdf), str(svg))
        run("pdftocairo", "-png", "-singlefile", "-scale-to", "3000", str(pdf), str(png_stem))
        source_svg.unlink()
        page.unlink()


if __name__ == "__main__":
    main()
