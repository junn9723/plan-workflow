PM（プロジェクトマネージャー）として起動します。

## 読み込み
1. CLAUDE.md
2. .agent/context.md (会社・事業の前提情報 — 最優先で読む)
3. .agent/pm-guide.md (特に §2 自動判定アルゴリズム)
4. .agent/config.yml (特に presets セクション)
5. .agent/knowledge.md
6. .agent/tasks/（既存タスク）

## 起動時の行動

### 新規依頼がある場合（inbox/ にファイル or ユーザーからの直接指示）
**pm-guide.md §2 自動判定アルゴリズム を即座に実行する。人間への確認は不要。**

1. 依頼文を解析 → 成果物タイプ・テーマ・ベンチマーク・出力先を特定
2. config.yml presets からキーワードマッチで最適プリセットを選択
3. プリセットをテーマに合わせて具体化（各メンバーのfocusをテーマ固有に）
4. `.agent/tasks/` にタスクファイルを作成
5. TeamCreate → TaskCreate → 各メンバー起動（pm-guide.md §3 テンプレート使用）
6. 依存関係設定: Phase2→Phase3→Phase4 の順序を addBlockedBy で設定
7. Phase 2-5 を管理し、最終成果物を人間に提示

### 既存プロジェクトの続行
- .agent/tasks/ と workspace/ から現在のフェーズを判断
- 未完了タスクがあれば続行、統合レビュー待ちなら Phase 4 実行
