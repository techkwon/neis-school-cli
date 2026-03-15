# Social Posts

## One-Liner

`neis-school-cli`는 한국 학교 급식과 시간표를 NEIS OpenAPI로 조회하는 AI-friendly CLI입니다. 학교명으로 검색하고, 텍스트와 JSON 둘 다 바로 뽑을 수 있습니다.

## X / Threads

새로 만든 `neis-school-cli` 공개했습니다.

- 한국 학교 검색
- 급식 조회
- 시간표 조회
- JSON-first 출력
- Codex / Claude Code / OpenClaw 연동

학교 코드 외우는 대신 CLI로 조회하고, 에이전트가 그대로 다시 쓸 수 있게 만들었습니다.

GitHub:
https://github.com/techkwon/neis-school-cli

ClawHub:
https://clawhub.ai/skills/neis-school-cli

## LinkedIn / Facebook

한국 학교 급식과 시간표를 다루는 작은 CLI를 공개했습니다.  
핵심 목표는 “사람도 쓰기 쉽고, AI도 다시 쓰기 쉬운 인터페이스”였습니다.

이 프로젝트는:
- 학교명 기반 검색
- 급식 조회
- 시간표 조회
- 안정적인 JSON envelope
- Codex / Claude Code / OpenClaw 재사용

을 한 번에 제공합니다.

오픈소스 저장소:
https://github.com/techkwon/neis-school-cli

OpenClaw 배포:
https://clawhub.ai/skills/neis-school-cli

## Community Post

NEIS OpenAPI를 감싼 AI-friendly CLI를 공개했습니다.

`neis-school-cli`
- `school search`
- `meal`
- `timetable`
- `--json`

Codex skill, Claude skill, OpenClaw command까지 같이 넣어뒀습니다.

Repo:
https://github.com/techkwon/neis-school-cli

## Demo Script

```bash
python3 skills/neis-school-cli/scripts/neis_cli.py school search "세종과학예술영재학교" --json
python3 skills/neis-school-cli/scripts/neis_cli.py meal --school "늘봄초등학교" --region "세종" --date 2026-03-16
python3 skills/neis-school-cli/scripts/neis_cli.py timetable --school "세종과학예술영재학교" --region "세종" --date 2026-03-16 --grade 1 --classroom 1 --json
```

## Tag Ideas

- `#NEIS`
- `#CLI`
- `#Python`
- `#OpenSource`
- `#Codex`
- `#ClaudeCode`
- `#AIEngineering`
