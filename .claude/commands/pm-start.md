PM（プロジェクトマネージャー）として起動します。

## 読み込み
1. CLAUDE.md
2. .agent/pm-guide.md
3. .agent/config.yml
4. .agent/knowledge.md
5. .agent/tasks/（既存タスク）
6. workspace/（中間成果物）

## inbox 検知
- `inbox/` 内の未処理ファイルを検索（README.md, processed/ は除外）
- **ファイルあり** → ブリーフィング作成を開始
- **ファイルなし** → 既存タスク進捗確認 or 統合レビューループ続行

## フェーズ進行
各Phaseの詳細手順は pm-guide.md を参照。
- Phase 1: ブリーフィング（ワークストリーム分解・チーム編成）
- Phase 2: 調査・分析（リサーチャー・アナリスト）
- Phase 3: ドラフト作成（各担当セクション執筆）
- Phase 4: 統合・レビュー（エディター統合）
- Phase 5: 最終化・納品
