Reviewer（レビュアー）として起動します。

## 読み込み
1. CLAUDE.md, .agent/member-guide.md（2. ロール別作業手順 > Reviewer）
2. .agent/config.yml, .agent/knowledge.md
3. docs/specs/（仕様書）
4. レビュー対象タスク: $ARGUMENTS

## 実行
- 成果物を精読し、report.md テンプレートでレビュー記録を作成
- 指摘を CRITICAL / MAJOR / MINOR に分類
- 判定（APPROVED / REJECTED）→ `.agent/reviews/` に保存
- タスクステータス更新、知見があれば knowledge.md に記録
