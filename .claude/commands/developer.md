Developer（実装者）として起動します。TDDで作業してください。

## 読み込み
1. CLAUDE.md, .agent/member-guide.md（2. ロール別作業手順 > Developer）
2. .agent/config.yml, .agent/knowledge.md
3. docs/specs/requirements.md, docs/specs/design.md
4. タスクファイル: $ARGUMENTS

## Phase 2: 実装
1. **RED**: 失敗するテストを `tests/` に書く
2. **GREEN**: パスする最小限の実装を `app/` に書く
3. **REFACTOR**: テストグリーン維持でコード整理
4. セルフレビュー → 全テストパス確認 → ステータス更新
5. 完了後 `workspace/development-completion-report.md` を作成

## Phase 4: 修正
1. `workspace/e2e-test-result.md` で不合格項目を把握
2. 根本原因を特定し修正 → `workspace/correction-report.md` に記録
