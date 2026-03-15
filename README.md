# NEIS School CLI

한국 학교 검색, 급식 조회, 시간표 조회를 위한 AI-friendly CLI 저장소입니다.

이 저장소의 중심은 CLI입니다. Codex skill과 Claude command는 이 CLI를 호출하는 얇은 어댑터로 둡니다.

## Goals

- 웹의 NEIS OpenAPI를 안정적으로 다루는 로컬 CLI 제공
- 사람이 쓰기 쉬운 텍스트 출력과 AI가 쓰기 쉬운 JSON 출력 동시 제공
- Codex와 Claude에서 같은 CLI를 재사용
- GitHub에 공개해 `repo/path` 또는 command 파일 방식으로 배포 가능하게 유지

## Repository Shape

```text
neis-school-skill/
├── README.md
├── docs/
│   └── ai/
│       ├── cli-manifest.json
│       └── json-output-example.json
├── integrations/
│   ├── claude/
│   │   └── commands/
│   │       └── sc/
│   │           └── neis-school.md
│   └── openclaw/
│       └── commands/
│           └── sg/
│               └── neis-school.toml
└── skills/
    └── neis-school-cli/
        ├── SKILL.md
        ├── agents/openai.yaml
        ├── scripts/neis_cli.py
        ├── scripts/run-neis-cli.sh
        ├── references/neis-api.md
        └── tests/
```

## Core Commands

학교 검색:

```bash
python3 skills/neis-school-cli/scripts/neis_cli.py school search "세종과학예술영재학교"
```

급식 조회:

```bash
python3 skills/neis-school-cli/scripts/neis_cli.py meal --school "늘봄초등학교" --region "세종" --date 2026-03-16
```

시간표 조회:

```bash
python3 skills/neis-school-cli/scripts/neis_cli.py timetable --school "세종과학예술영재학교" --region "세종" --date 2026-03-16 --grade 1 --classroom 1
```

## JSON-First Use

AI 에이전트나 다른 도구가 붙을 때는 `--json`을 우선 사용합니다.

```bash
python3 skills/neis-school-cli/scripts/neis_cli.py school search "세종과학예술영재학교" --json
```

현재 JSON 응답은 공통 envelope를 사용합니다.

```json
{
  "ok": true,
  "cli": { "name": "neis-school-cli", "version": "0.2.0" },
  "provider": "neis",
  "command": "school.search",
  "endpoint": "schoolInfo",
  "query": { "school_name": "세종과학예술영재학교", "region": null },
  "count": 1,
  "data": {
    "schools": []
  }
}
```

기계가 읽어야 하는 계약은 [cli-manifest.json](/Users/techkwon/Documents/MyApps/neis-school-skill/docs/ai/cli-manifest.json)과 [json-output-example.json](/Users/techkwon/Documents/MyApps/neis-school-skill/docs/ai/json-output-example.json)에 둡니다.

## Environment

```bash
export NEIS_API_KEY="발급받은키"
```

일부 공개 조회는 키 없이도 동작할 수 있지만, 일관된 사용을 위해 키 설정을 권장합니다.

## Integrations

Codex:
- 저장소 안의 [SKILL.md](/Users/techkwon/Documents/MyApps/neis-school-skill/skills/neis-school-cli/SKILL.md)를 사용
- GitHub 공개 후 `skills/neis-school-cli` 경로를 설치 대상으로 사용

Claude:
- 저장소 안의 [neis-school.md](/Users/techkwon/Documents/MyApps/neis-school-skill/integrations/claude/commands/sc/neis-school.md)를 사용
- 저장소 안의 [Claude skill](/Users/techkwon/Documents/MyApps/neis-school-skill/integrations/claude/skills/neis-school-cli/SKILL.md)도 함께 제공
- 로컬 `~/.claude/skills/neis-school-cli/`에 연결하면 `/neis-school-cli` 형태의 정식 skill로 재사용 가능
- `~/.claude/commands/sc/` command도 유지해서 `/sc:neis-school`로 바로 호출 가능

OpenClaw:
- 저장소 안의 [neis-school.toml](/Users/techkwon/Documents/MyApps/neis-school-skill/integrations/openclaw/commands/sg/neis-school.toml)를 사용
- 로컬 `~/.gemini/commands/sg/`에 연결하면 `/sg:neis-school` 형태로 재사용 가능
- 현재 머신에서는 OpenClaw command registry가 `~/.gemini/commands/sg/` 구조로 보이므로 그 위치를 정식 등록 지점으로 사용
- OpenClaw workspace skill 경로인 `~/.openclaw/skills/neis-school-cli/`에도 동일 CLI 기반 skill을 연결

로컬 등록 스크립트:

```bash
bash scripts/install-local-integrations.sh
```

## Local Test

```bash
python3 -m unittest discover -s skills/neis-school-cli/tests -v
python3 skills/neis-school-cli/scripts/neis_cli.py --help
```

## Official Sources

- [NEIS OpenAPI 포털](https://open.neis.go.kr/portal/mainPage.do)
- [급식 API](https://open.neis.go.kr/hub/mealServiceDietInfo)
- [초등 시간표 API](https://open.neis.go.kr/hub/elsTimetable)
- [중등 시간표 API](https://open.neis.go.kr/hub/misTimetable)
- [고등 시간표 API](https://open.neis.go.kr/hub/hisTimetable)
