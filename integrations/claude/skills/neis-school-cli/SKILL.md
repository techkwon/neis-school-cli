---
name: neis-school-cli
description: Query Korean school information, meals, and timetables from the official NEIS OpenAPI. Use when the user asks for school lunch menus, school timetables, or school code lookup in Korea. Prefer --json output when another agent or tool will consume the result.
---

# Claude NEIS School CLI Skill

Use this skill when the user wants:
- 학교명으로 학교 코드 찾기
- 학교 급식 조회
- 학교 시간표 조회
- JSON 형태로 기계가 읽기 쉬운 결과 받기

## Execution

- Run `bash /Users/techkwon/Documents/MyApps/neis-school-skill/skills/neis-school-cli/scripts/run-neis-cli.sh ...`
- Prefer `--json` when the result will be consumed by another tool or UI
- If school names are ambiguous, add `--region`

## Examples

```bash
bash /Users/techkwon/Documents/MyApps/neis-school-skill/skills/neis-school-cli/scripts/run-neis-cli.sh school search "세종과학예술영재학교" --json
bash /Users/techkwon/Documents/MyApps/neis-school-skill/skills/neis-school-cli/scripts/run-neis-cli.sh meal --school "늘봄초등학교" --region "세종" --date 2026-03-16 --json
bash /Users/techkwon/Documents/MyApps/neis-school-skill/skills/neis-school-cli/scripts/run-neis-cli.sh timetable --school "세종과학예술영재학교" --region "세종" --date 2026-03-16 --grade 1 --classroom 1 --json
```

## Contract

- JSON output includes `ok`, `cli`, `provider`, `command`, `endpoint`, `query`, `count`, and `data`
- Reference: `/Users/techkwon/Documents/MyApps/neis-school-skill/docs/ai/cli-manifest.json`
