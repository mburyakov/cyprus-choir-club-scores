#!/usr/bin/env python3
"""Create standalone logo variants from the shared SVG source."""

import argparse
import re
from pathlib import Path


VARIANTS = ("ring", "compact")
HIDDEN_LAYERS = {
    "ring": ("text-compact", "text-concentric"),
    "compact": ("external-ring", "text-ring"),
}
POSITION_TRANSFORMS = {
    "staff-position": "translate(-261 -323) scale(1.61)",
    "cyprus-position": "translate(-881 -486) scale(1.56)",
    "olive-position": "translate(-936 -610) scale(1.56)",
}


def resolve_css_colors(svg: str) -> str:
    colors = dict(re.findall(r"--([\w-]+):\s*([^;]+);", svg))

    def replace(match: re.Match[str]) -> str:
        name = match.group(1)
        if name not in colors:
            raise SystemExit(f"Undefined CSS variable: --{name}")
        return colors[name]

    return re.sub(r"var\(--([\w-]+)\)", replace, svg)


def inline_position_transforms(svg: str) -> str:
    for class_name, transform in POSITION_TRANSFORMS.items():
        svg = svg.replace(
            f'class="{class_name}"',
            f'transform="{transform}"',
        )
    return svg


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    source = inline_position_transforms(resolve_css_colors(args.source.read_text()))
    source = re.sub(r"\s*<script\b.*?</script>", "", source, count=1, flags=re.DOTALL)
    args.output.mkdir(parents=True, exist_ok=True)

    for variant in VARIANTS:
        rendered, replacements = re.subn(
            r'(<svg\b[^>]*\bclass=")[^"]+("[^>]*>)',
            rf"\g<1>variant-{variant}\g<2>",
            source,
            count=1,
        )
        if replacements != 1:
            raise SystemExit("The root <svg> must have exactly one class attribute")
        hidden = "|".join(HIDDEN_LAYERS[variant])
        rendered = re.sub(
            rf'\s*<use class="(?:{hidden})"[^>]*/>',
            "",
            rendered,
        )
        (args.output / f"cyprus-choral-club-{variant}.svg").write_text(rendered)


if __name__ == "__main__":
    main()
