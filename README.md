# skills-engine

> 个人 AI Agent 技能仓库 — 独立 Git 仓库，通过 symlink 链接到各项目

## 支持平台

| 平台 | 链接文件 |
|------|---------|
| Gemini | `.gemini/skills/` → `skills/` |
| Claude Code | `CLAUDE.md` → `adapters/CLAUDE.md` |
| Codex CLI | `AGENTS.md` → `adapters/AGENTS.md` |
| Trae | `.trae/rules/project_rules.md` (生成) |

## 快速开始

```powershell
# Windows — 链接到目标项目
.\setup.ps1 <target-project-path>

# Linux / macOS
bash setup.sh <target-project-path>
```

## 技能索引

> 待填充

## 目录结构

```
skills-engine/
├── core/          ← 核心指令（平台无关）
├── skills/        ← 技能库
├── templates/     ← 输出模板
├── snippets/      ← 代码片段
├── adapters/      ← 平台适配层
└── setup.ps1/sh   ← 链接脚本
```
