#!/usr/bin/env python3
"""Render terminal-style screenshots from text files."""

from __future__ import annotations

import argparse
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


BACKGROUND = "#0f1117"
PANEL = "#161b22"
BORDER = "#30363d"
TEXT = "#e6edf3"
MUTED = "#8b949e"
GREEN = "#3fb950"
YELLOW = "#d29922"
RED = "#f85149"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate terminal-like PNG screenshots from text.")
    parser.add_argument("--input", required=True, help="Path to the source text file.")
    parser.add_argument("--output", required=True, help="Path to the output PNG file.")
    parser.add_argument("--title", required=True, help="Window title shown in the header.")
    parser.add_argument("--command", required=True, help="Command line shown above the output.")
    return parser.parse_args()


def load_font(size: int) -> ImageFont.FreeTypeFont:
    for path in [
        "/System/Library/Fonts/AppleSDGothicNeo.ttc",
        "/System/Library/Fonts/Supplemental/AppleGothic.ttf",
        "/System/Library/Fonts/Menlo.ttc",
        "/System/Library/Fonts/SFNSMono.ttf",
    ]:
        if Path(path).exists():
            return ImageFont.truetype(path, size)
    return ImageFont.load_default()


def main() -> int:
    args = parse_args()
    source = Path(args.input).read_text(encoding="utf-8")
    lines = source.splitlines() or [""]

    title_font = load_font(26)
    body_font = load_font(24)
    line_height = 36
    padding_x = 44
    padding_y = 34
    header_h = 78
    body_top = header_h + 28
    max_line_width = 0

    dummy = Image.new("RGB", (1, 1))
    draw = ImageDraw.Draw(dummy)
    for line in [f"$ {args.command}", *lines]:
        left, top, right, bottom = draw.textbbox((0, 0), line, font=body_font)
        max_line_width = max(max_line_width, right - left)

    width = max(1400, max_line_width + padding_x * 2)
    height = body_top + padding_y + line_height * (len(lines) + 1)

    image = Image.new("RGB", (width, height), BACKGROUND)
    draw = ImageDraw.Draw(image)

    panel_bounds = [22, 22, width - 22, height - 22]
    draw.rounded_rectangle(panel_bounds, radius=24, fill=PANEL, outline=BORDER, width=2)

    # Header
    cx = 56
    cy = 60
    for color in (RED, YELLOW, GREEN):
        draw.ellipse((cx, cy, cx + 16, cy + 16), fill=color)
        cx += 28
    draw.text((120, 45), args.title, font=title_font, fill=TEXT)
    draw.text((width - 260, 48), "neis-school-cli demo", font=body_font, fill=MUTED)

    # Command line
    y = body_top
    draw.text((padding_x, y), f"$ {args.command}", font=body_font, fill=GREEN)
    y += line_height + 10

    for line in lines:
        draw.text((padding_x, y), line or " ", font=body_font, fill=TEXT)
        y += line_height

    Path(args.output).parent.mkdir(parents=True, exist_ok=True)
    image.save(args.output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
