#!/bin/sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
CODEX_SKILL_SRC="$ROOT_DIR/skills/neis-school-cli"
CODEX_SKILL_DEST="$HOME/.codex/skills/neis-school-cli"
CLAUDE_CMD_SRC="$ROOT_DIR/integrations/claude/commands/sc/neis-school.md"
CLAUDE_CMD_DEST="$HOME/.claude/commands/sc/neis-school.md"
CLAUDE_SKILL_SRC="$ROOT_DIR/integrations/claude/skills/neis-school-cli"
CLAUDE_SKILL_DEST="$HOME/.claude/skills/neis-school-cli"
OPENCLAW_CMD_SRC="$ROOT_DIR/integrations/openclaw/commands/sg/neis-school.toml"
OPENCLAW_CMD_DEST="$HOME/.gemini/commands/sg/neis-school.toml"
OPENCLAW_SKILL_SRC="$ROOT_DIR/skills/neis-school-cli"
OPENCLAW_SKILL_DEST="$HOME/.openclaw/skills/neis-school-cli"

mkdir -p "$HOME/.codex/skills"
mkdir -p "$HOME/.claude/commands/sc"
mkdir -p "$HOME/.claude/skills"
mkdir -p "$HOME/.gemini/commands/sg"
mkdir -p "$HOME/.openclaw/skills"

ln -sfn "$CODEX_SKILL_SRC" "$CODEX_SKILL_DEST"
ln -sfn "$CLAUDE_CMD_SRC" "$CLAUDE_CMD_DEST"
ln -sfn "$CLAUDE_SKILL_SRC" "$CLAUDE_SKILL_DEST"
ln -sfn "$OPENCLAW_CMD_SRC" "$OPENCLAW_CMD_DEST"
ln -sfn "$OPENCLAW_SKILL_SRC" "$OPENCLAW_SKILL_DEST"

printf 'Installed Codex skill -> %s\n' "$CODEX_SKILL_DEST"
printf 'Installed Claude command -> %s\n' "$CLAUDE_CMD_DEST"
printf 'Installed Claude skill -> %s\n' "$CLAUDE_SKILL_DEST"
printf 'Installed OpenClaw command -> %s\n' "$OPENCLAW_CMD_DEST"
printf 'Installed OpenClaw skill -> %s\n' "$OPENCLAW_SKILL_DEST"
