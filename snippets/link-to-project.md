# 提示词 — 从 GitHub 部署 skills-engine 到当前项目

> 在新项目中把下面这段话发给 AI 即可。

---

## 部署提示词

```
请帮我部署 skills-engine 到当前项目。

从这个仓库获取：https://github.com/242282218/skills-engine

步骤：
1. 将仓库克隆到系统临时目录
2. 在当前项目根目录创建 `.skills-engine/` 文件夹
3. 将仓库中以下目录/文件复制到 `.skills-engine/`，保持原始结构：
   - core/          （执行框架、规则、编码约定）
   - skills/         （所有技能，不含 _TEMPLATE）
   - snippets/       （提示词模板）
   - templates/      （文档模板）
4. 将以下适配器文件复制到项目根目录：
   - CLAUDE.md  ← 复制 adapters/CLAUDE.md
   - AGENTS.md  ← 复制 adapters/AGENTS.md
   - GEMINI.md  ← 复制 adapters/GEMINI.md
5. 为 Gemini 建立技能目录（如果项目使用 Gemini）：
   - 将 .skills-engine/skills/ 下的所有技能目录复制到 .gemini/skills/
6. 为 Trae 建立规则和技能目录（如果项目使用 Trae）：
   - 创建 .trae/rules/ 目录，将 AGENTS.md 复制为 .trae/rules/project_rules.md
   - 创建 .trae/skills/ 目录，将 .skills-engine/skills/ 下的所有技能目录复制到 .trae/skills/
7. 将以下内容追加到 .gitignore（如果不存在则创建）：
   .skills-engine/
   CLAUDE.md
   AGENTS.md
   GEMINI.md
   .gemini/skills/
   .trae/
8. 清理临时目录
9. 告诉我部署了哪些文件

注意：不要覆盖项目中已存在的同名文件，如果有冲突先问我。
```

---

## 更新时的提示词

```
请帮我更新 skills-engine。

从这个仓库获取最新版：https://github.com/242282218/skills-engine

步骤：
1. 克隆到临时目录
2. 用仓库中的最新文件覆盖当前项目中的：
   - .skills-engine/core/
   - .skills-engine/skills/（不含 _TEMPLATE）
   - .skills-engine/snippets/
   - .skills-engine/templates/
   - CLAUDE.md（用 adapters/CLAUDE.md 替换）
   - AGENTS.md（用 adapters/AGENTS.md 替换）
   - GEMINI.md（用 adapters/GEMINI.md 替换）
3. 如果项目使用 Gemini，同步更新 .gemini/skills/
4. 如果项目使用 Trae，同步更新：
   - .trae/rules/project_rules.md（用 AGENTS.md 内容替换）
   - .trae/skills/（用 .skills-engine/skills/ 内容替换）
5. 清理临时目录
6. 告诉我更新了哪些文件，哪些有变化
```

---

## 部署后的项目结构

```
your-project/
├── .skills-engine/           ← 完整的技能引擎
│   ├── core/                 ← 执行框架、规则、编码约定
│   │   ├── AGENT.md
│   │   ├── RULES.md
│   │   └── CONVENTIONS.md
│   ├── skills/               ← 所有技能
│   │   ├── brainstorming/
│   │   ├── frontend-design/
│   │   ├── ui-ux-pro-max/
│   │   └── ...
│   ├── snippets/             ← 提示词模板
│   └── templates/            ← 文档模板
├── .gemini/skills/           ← Gemini 专用（从 .skills-engine/skills/ 复制）
├── .trae/                    ← Trae 专用
│   ├── rules/
│   │   └── project_rules.md  ← 项目规则（来自 AGENTS.md）
│   └── skills/               ← 技能目录（从 .skills-engine/skills/ 复制）
├── CLAUDE.md                 ← Claude Code 入口
├── AGENTS.md                 ← OpenAI Codex 入口
└── GEMINI.md                 ← Gemini 入口
```
