#!/bin/sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
CODEX_SKILL_SRC="$ROOT_DIR/skills/neis-school-cli"
CODEX_SKILL_DEST="$HOME/.codex/skills/neis-school-cli"
CLAUDE_CMD_SRC="$ROOT_DIR/integrations/claude/commands/sc/neis-school.md"
CLAUDE_CMD_DEST="$HOME/.claude/commands/sc/neis-school.md"

mkdir -p "$HOME/.codex/skills"
mkdir -p "$HOME/.claude/commands/sc"

ln -sfn "$CODEX_SKILL_SRC" "$CODEX_SKILL_DEST"
ln -sfn "$CLAUDE_CMD_SRC" "$CLAUDE_CMD_DEST"

printf 'Installed Codex skill -> %s\n' "$CODEX_SKILL_DEST"
printf 'Installed Claude command -> %s\n' "$CLAUDE_CMD_DEST"
