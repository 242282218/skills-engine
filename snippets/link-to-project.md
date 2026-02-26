# 提示词 — 从 GitHub 部署 skills-engine 到当前项目

> 在新项目中把下面这段话发给 AI 即可。
> 使用前请先把 skills-engine 推送到 GitHub，然后替换下方 `<GITHUB_URL>`。

---

## 提示词

```
请帮我部署 skills-engine 到当前项目。

从这个仓库获取：<GITHUB_URL>

步骤：
1. 将仓库克隆到系统临时目录
2. 将以下文件复制到当前项目根目录，保持原始目录结构：
   - .gemini/skills/ ← 复制仓库中的 skills/ 目录内容到这里（不含 _TEMPLATE）
   - CLAUDE.md ← 复制 adapters/CLAUDE.md
   - AGENTS.md ← 复制 adapters/AGENTS.md
   - GEMINI.md ← 复制 adapters/GEMINI.md
3. 将以下内容追加到 .gitignore（如果不存在则创建）：
   CLAUDE.md
   AGENTS.md
   GEMINI.md
   .gemini/skills/
4. 清理临时目录
5. 告诉我部署了哪些文件

注意：不要覆盖项目中已存在的同名文件，如果有冲突先问我。
```

---

## 更新时的提示词

```
请帮我更新 skills-engine。

从这个仓库获取最新版：<GITHUB_URL>

步骤：
1. 克隆到临时目录
2. 用仓库中的最新文件覆盖当前项目中的：
   - .gemini/skills/ 下所有 skill（用 skills/ 目录内容替换，不含 _TEMPLATE）
   - CLAUDE.md（用 adapters/CLAUDE.md 替换）
   - AGENTS.md（用 adapters/AGENTS.md 替换）
   - GEMINI.md（用 adapters/GEMINI.md 替换）
3. 清理临时目录
4. 告诉我更新了哪些文件，哪些有变化
```
