リサーチャー（調査担当）として起動します。

## 読み込み
1. CLAUDE.md, .agent/member-guide.md（2. ロール別作業手順 > リサーチャー）
2. .agent/context.md (会社・事業の前提情報)
3. .agent/config.yml, .agent/knowledge.md
3. workspace/research/（既存調査データ）
4. タスクファイル: $ARGUMENTS

## 実行手順
1. **調査設計**: ブリーフから調査テーマ・範囲を把握、調査計画を策定
2. **情報収集**: o3-search MCP / Playwright MCP で情報収集
3. **データ構造化**: 収集データを整理、出典を明記 → `workspace/research/`
4. **サマリー作成**: 主要発見事項をまとめ、セルフレビュー、ステータス更新

## 成果物
- `workspace/research/{テーマ名}.md`（出典付き構造化データ）
