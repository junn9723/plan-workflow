# メンバーガイド — 実行メンバー共通

> 共通ルールは `CLAUDE.md`、ロール・ツール詳細は `.agent/config.yml` を参照。

---

## 1. メンバー行動規範

1. `.agent/tasks/` から自分のタスクを確認する
2. `.agent/knowledge.md` で関連知見を確認する
3. `docs/specs/` で仕様を確認する
4. TDDでテスト→実装の順で作業する
5. セルフレビューを実施する
6. タスクファイルのステータスを更新する
7. 成果物は指定ディレクトリに保存する
8. 軽微な作業を除き、該当 Skill を積極的に使用する（一覧: `.agent/skills.md`）

---

## 2. ロール別作業手順

### Architect (設計者) — Phase 1

1. inbox/ のユーザー要件を分析 (必要に応じてWeb検索で類似サービス調査)
2. `docs/specs/requirements.md` 作成: ペルソナ、コア機能、ユーザーストーリー、画面一覧・遷移図(Mermaid)
3. `docs/specs/design.md` 作成: DB設計(ER図)、API設計、ディレクトリ構成
4. `.agent/tasks/` に実装タスクをチェックリスト形式で作成
5. 重要な設計判断では深い思考(think hard/ultrathink)で品質を高める

### Developer (実装者) — Phase 2 & 4

**Phase 2 (実装):**
1. **RED**: 失敗するテストを `tests/` に先に書く
2. **GREEN**: パスする最小実装を `app/` に書く
3. **REFACTOR**: 整理 (テストはグリーン維持)
4. 全ユニットテストパス確認 → セルフレビュー
5. `workspace/development-completion-report.md` 作成

**Phase 4 (修正):**
1. `workspace/e2e-test-result.md` を精読し不合格項目を把握
2. 各不具合の**根本原因**を特定 (表面的な対処ではなく)
3. 全不具合を修正、既存テストへの影響がないことを確認
4. `workspace/correction-report.md` に修正内容を記録

### Reviewer (レビュアー) — Phase 1

1. レビュー対象の成果物を精読
2. 指摘事項を CRITICAL / MAJOR / MINOR に分類
3. 総合判定 (APPROVED / REJECTED) を `.agent/reviews/` に保存
4. **設計レビューは担当者以外が実施すること**

### Tester (テスター) — Phase 3

**STEP A: テスト計画策定**
- 入力: development-completion-report.md + 仕様書
- 出力: `workspace/e2e-test-plan.md`
- ルーティング定義を元に全機能を一覧し漏れなくカバー
- ループ再実行時もゼロベースでテスト計画を再策定

**STEP B: テスト実行**
- Playwright MCP でテスト実行 → `workspace/e2e-test-result.md` に記録
- エビデンス (スクリーンショット・ログ) を `workspace/downloads/` に保存
- 不合格項目は **再現手順・期待挙動・実際のエラー** を明記
- 全パス → Phase 5 / 不合格あり → Phase 4 へ

---

## 3. 重要ルール

- **設計は担当者以外のレビュアーが必ずレビューしてからFIX**
- **実装は必ずテスターによるテストを経て完了**
- **同一担当者で不合格3回 → PM差し戻し・別担当者に再アサイン / テスト-修正ループ全体の上限は5回**
- **E2Eテストの省略は重大違反**
- 品質を左右する場面では深い思考で品質を高める
- 知見があれば `.agent/knowledge.md` に記録する
