# CLAUDE.md — Claude Code Instructions

> 整合自 `skills-engine/core/`，链接到项目后自动生效。

## 执行框架与规则

- 执行流程：`core/AGENT.md`
- 个人规则细则：`core/RULES.md`
- 编码约定与技术选型：`core/CONVENTIONS.md`

**核心要点**：先说方案再动手；只问一个问题；小步执行每步验证；不动范围外文件；卡住换策略不中止。

## 编码约定摘要

- Python: `uv` + `ruff` + `pyright` + `pytest`，`src/` layout
- TypeScript: Node.js 22+，`pnpm`，`strict: true`，ESM
- 安全红线：禁止硬编码密钥；外部输入必须验证；依赖锁定版本

## 可用技能

当任务匹配以下技能时，主动读取对应 `SKILL.md` 并按其指令执行：

> 新增技能时在此追加：`- **skill-name**: 描述 → 详见 skills/skill-name/SKILL.md`

- **skill-creator**: 创建和更新有效技能的指南。当用户想添加或修改专门工作流/知识技能时触发。 → 详见 skills/skill-creator/SKILL.md
- **skill-installer**: 从精选列表或 GitHub 仓库等路径安装技能。当用户要求列出或安装技能时触发。 → 详见 skills/skill-installer/SKILL.md
- **find-skills**: 帮助用户发现和安装生态系统中的技能。当用户询问“我该如何做某事”或“寻找某事技能”时触发。 → 详见 skills/find-skills/SKILL.md
- **vercel-react-best-practices**: Vercel 提供的 React 和 Next.js 最佳实践。当编写、审查或重构 React/Next.js 代码时触发。 → 详见 skills/vercel-react-best-practices/SKILL.md
- **web-design-guidelines**: 审查代码是否符合 Web 界面设计指南。要求“审查我的 UI/UX ”或检查无障碍时触发。 → 详见 skills/web-design-guidelines/SKILL.md
