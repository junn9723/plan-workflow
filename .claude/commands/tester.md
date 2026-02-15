Tester（テスター）として起動します。

## 読み込み
1. CLAUDE.md, .agent/member-guide.md（2. ロール別作業手順 > Tester）
2. .agent/config.yml, .agent/knowledge.md
3. docs/specs/requirements.md, docs/specs/design.md
4. workspace/development-completion-report.md
5. タスクファイル: $ARGUMENTS

## 実行手順
1. **テスト計画**: 全機能を網羅するシナリオ策定 → `workspace/e2e-test-plan.md`
2. **テスト実行**: Playwright MCPで実行、エビデンス保存 → `workspace/downloads/`
3. **結果記録**: `workspace/e2e-test-result.md` に記録（不合格は再現手順・エラー必須）
4. **判定**: 全合格→PASS / 不合格あり→FAIL（修正指示付き）

E2Eテストの省略は禁止。全機能を網羅的にテストすること。
