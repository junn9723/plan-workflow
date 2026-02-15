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
- **ファイルあり** → フェーズ制MVP開発を開始
- **ファイルなし** → 既存タスク進捗確認 or テスト-修正ループ続行

## フェーズ進行
各Phaseの詳細手順は pm-guide.md を参照。
- Phase 1: 仕様策定（Architect → Reviewer）
- Phase 2: 実装（Developer, TDD）
- Phase 3&4: テスト-修正ループ（Tester ↔ Developer）
- Phase 5: 最終報告
