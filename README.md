# skills-engine

> 个人 AI Agent 技能仓库 — 独立 Git 仓库，通过 GitHub Clone + Copy 部署到各项目

## 支持平台

| 平台 | 部署文件 |
|------|---------|
| Gemini | `.gemini/skills/` ← `skills/` |
| Claude Code | `CLAUDE.md` ← `adapters/CLAUDE.md` |
| Codex CLI | `AGENTS.md` ← `adapters/AGENTS.md` |
| Trae | `AGENTS.md` + `.trae/rules/project_rules.md` (生成) |

## 快速开始

在新项目中把 `snippets/link-to-project.md` 里的提示词发给 AI，它会自动从 GitHub 拉取并部署。

仓库地址：https://github.com/242282218/skills-engine

## 技能索引

> 暂无 skill，新增后运行 `snippets/sync-skills-index.md` 里的提示词自动更新此处。

## 目录结构

```
skills-engine/
├── core/                      ← 执行框架 / 规则 / 编码约定
│   ├── AGENT.md
│   ├── RULES.md
│   └── CONVENTIONS.md
├── skills/                    ← 技能库（每个 skill 一个目录）
│   └── _TEMPLATE/SKILL.md     ← 新建 skill 时复制此模板
├── adapters/                  ← 平台适配层
│   ├── AGENTS.md              ← Codex / Trae
│   ├── CLAUDE.md              ← Claude Code
│   └── GEMINI.md              ← Gemini
├── templates/                 ← 输出模板（plan / report / changelog）
├── snippets/                  ← 常用提示词
│   ├── link-to-project.md     ← 部署到新项目
│   └── sync-skills-index.md   ← 同步技能索引到 adapters
└── setup.ps1 / setup.sh       ← 备用：symlink 链接脚本
```
