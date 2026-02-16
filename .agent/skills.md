# Skill管理台帳

> **Skillの積極利用はプロジェクト成否に直結する。** 手動作業より Skill を優先すること。
> PMは `/find-skills` でプロジェクトに有用な Skill を発見し、本台帳を更新する。

---

## 利用ルール

- 軽微な作業（1行修正、設定値変更等）を除き、該当 Skill がある場合は **必ず使用する**
- PMはプロジェクト開始時・フェーズ移行時に `/find-skills` を実行し、本台帳を更新する
- 新たに有用な Skill を発見したら即座に追記し、チームに共有する
- Codex CLI は Skill 非対応。Claude Code メンバーのみが使用可能

---

## 標準Skill一覧

| Skill | 用途 | 使用フェーズ | 対象ロール |
|-------|------|------------|-----------|
| `/find-skills` | Skill検索・インストール提案 | 全フェーズ | PM |
| `/design` | システム設計 | Phase 1 | Architect |
| `/build` | プロジェクトビルド | Phase 2 | Developer |
| `/test` | テスト実行 | Phase 2-4 | Developer, Tester |
| `/analyze` | コード分析 | Phase 2-4 | Developer, Reviewer |
| `/scan` | セキュリティスキャン | Phase 3 | Reviewer, Tester |
| `/troubleshoot` | デバッグ・問題解決 | Phase 4 | Developer |
| `/improve` | コード改善 | Phase 2, 4 | Developer |
| `/git` | Git操作 | 全フェーズ | PM, Developer |
| `/explain` | 技術ドキュメント | Phase 1-2 | Architect, Developer |

---

## プロジェクト固有Skill

> PMが `/find-skills` で発見・インストールした Skill をここに追記する。

| Skill | 用途 | インストール日 | 備考 |
|-------|------|--------------|------|
| (例: `/shadcn`) | (UIコンポーネント) | (YYYY-MM-DD) | (PMが追記) |

---

## 更新履歴

| 日付 | 更新者 | 内容 |
|------|--------|------|
| (プロジェクト開始時) | PM | 初版作成・標準Skill登録 |
