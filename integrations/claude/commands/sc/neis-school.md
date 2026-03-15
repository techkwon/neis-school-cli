---
allowed-tools: [Read, Bash]
description: "Query Korean school search, meals, and timetables through the local neis-school CLI"
---

# /sc:neis-school

## Purpose

Use the local `neis-school-cli` to search schools, meals, and timetables through the NEIS OpenAPI.

## Usage

```bash
/sc:neis-school school search "세종과학예술영재학교"
/sc:neis-school meal --school "늘봄초등학교" --region "세종" --date 2026-03-16
/sc:neis-school timetable --school "세종과학예술영재학교" --region "세종" --date 2026-03-16 --grade 1 --classroom 1
```

## Execution

1. Run `bash /Users/techkwon/Documents/MyApps/neis-school-skill/skills/neis-school-cli/scripts/run-neis-cli.sh ...`
2. Prefer `--json` when the result will be consumed by another tool or step
3. If school names are ambiguous, add `--region`
4. Return the CLI output directly unless the user asked for transformation

## Notes

- JSON output uses a stable envelope with `ok`, `command`, `endpoint`, `query`, `count`, and `data`
- Command contract lives in `/Users/techkwon/Documents/MyApps/neis-school-skill/docs/ai/cli-manifest.json`
