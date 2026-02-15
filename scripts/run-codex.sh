#!/bin/bash
# Codex CLI タスク実行: ./scripts/run-codex.sh <task-file> [Role]
set -euo pipefail

TASK_FILE="${1:?Usage: $0 <task-file> [role]}"
ROLE="${2:-Developer}"
[ ! -f "$TASK_FILE" ] && echo "Error: $TASK_FILE not found" && exit 1

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

SPEC_FILES=""
[ -f "$PROJECT_ROOT/docs/specs/requirements.md" ] && SPEC_FILES="$SPEC_FILES
   - docs/specs/requirements.md"
[ -f "$PROJECT_ROOT/docs/specs/design.md" ] && SPEC_FILES="$SPEC_FILES
   - docs/specs/design.md"

echo "=== Codex CLI: $ROLE | $TASK_FILE ==="

cd "$PROJECT_ROOT"
codex exec --full-auto \
  "あなたは ${ROLE} としてタスクを実行します。

【読み込み】
1. CLAUDE.md
2. .agent/config.yml
3. .agent/knowledge.md${SPEC_FILES}

【タスク】
${TASK_FILE} を読み込み実行してください。

【ルール】
- 受入条件を全て満たすこと
- TDD: テストを先に書く
- 完了後ステータス更新、知見があれば knowledge.md に追記"
