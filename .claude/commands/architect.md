Architect（設計者）として起動します。

## 読み込み
1. CLAUDE.md, .agent/member-guide.md（2. ロール別作業手順 > Architect）
2. .agent/config.yml, .agent/knowledge.md
3. docs/specs/（既存仕様書）, inbox/（ユーザー要件）
4. タスクファイル: $ARGUMENTS

## 実行手順
1. **要求仕様**: inbox/ を分析、Web検索で類似サービス調査 → `docs/specs/requirements.md`
2. **技術設計**: アーキテクチャ・データモデル・API設計 → `docs/specs/design.md`
3. **タスク分解**: 実装ステップをタスクファイルに分解 → `.agent/tasks/`
4. **セルフレビュー**: 内部矛盾・要件漏れを確認、ステータス更新

## 成果物
- `docs/specs/requirements.md`, `docs/specs/design.md`, `.agent/tasks/` タスク群
