# Agent Instructions

> 整合自 `skills-engine`，部署到项目后自动生效。

## 执行框架与规则

- 执行流程：`.skills-engine/core/AGENT.md`
- 个人规则细则：`.skills-engine/core/RULES.md`
- 编码约定与技术选型：`.skills-engine/core/CONVENTIONS.md`

**核心要点**：先说方案再动手；只问一个问题；小步执行每步验证；不动范围外文件；卡住换策略不中止。

## 编码约定摘要

- Python: `uv` + `ruff` + `pyright`，`src/` layout，`pyproject.toml` 统一配置
- TypeScript: Node.js 22+，`pnpm`，`strict: true`，ESM 优先
- 安全：禁止硬编码密钥；所有外部输入必须验证；依赖锁定版本
- Git: Conventional Commits；不提交 `.env` 和构建产物


## 可用技能

> 技能存放于 `.skills-engine/skills/`，每个子目录含 `SKILL.md`。
- **skill-creator**: 创建和更新有效技能的指南。当用户想添加或修改专门工作流/知识技能时触发。 -> 详见 .skills-engine/skills/skill-creator/SKILL.md
- **skill-installer**: 从精选列表或 GitHub 仓库等路径安装技能。当用户要求列出或安装技能时触发。 -> 详见 .skills-engine/skills/skill-installer/SKILL.md
- **find-skills**: 帮助用户发现和安装生态系统中的技能。当用户询问"我该如何做某事"或"寻找某事技能"时触发。 -> 详见 .skills-engine/skills/find-skills/SKILL.md
- **vercel-react-best-practices**: Vercel 提供的 React 和 Next.js 最佳实践。当编写、审查或重构 React/Next.js 代码时触发。 -> 详见 .skills-engine/skills/vercel-react-best-practices/SKILL.md
- **web-design-guidelines**: 审查代码是否符合 Web 界面设计指南。要求"审查我的 UI/UX "或检查无障碍时触发。 -> 详见 .skills-engine/skills/web-design-guidelines/SKILL.md
- **frontend-design**: 创建高设计感的前端界面，打破常规 AI 审美。要求构建 Web 组件、美化 UI 或写网页时触发。 -> 详见 .skills-engine/skills/frontend-design/SKILL.md
- **webapp-testing**: 利用 Playwright 对 Web 应用程序进行本地自动化交互和测试。 -> 详见 .skills-engine/skills/webapp-testing/SKILL.md
- **frontend-code-review**: 前端代码审查助手。涵盖业务逻辑、组件性能及架构规范检查。 -> 详见 .skills-engine/skills/frontend-code-review/SKILL.md
- **fullstack-developer**: 提供涵盖 React、Node.js 及数据库的全栈 Web 开发专家级知识体系。 -> 详见 .skills-engine/skills/fullstack-developer/SKILL.md
- **brainstorming**: 强制实施编码前的需求梳理与设计方案输出。 -> 详见 .skills-engine/skills/brainstorming/SKILL.md
- **browser-use**: 自动化浏览器操作与网页数据抓取。 -> 详见 .skills-engine/skills/browser-use/SKILL.md
- **ui-ux-pro-max**: 顶级 UI/UX 设计决策与页面生成向导。 -> 详见 .skills-engine/skills/ui-ux-pro-max/SKILL.md
- **test-driven-development**: 强制执行 TDD (测试驱动开发) 流程与规范。 -> 详见 .skills-engine/skills/test-driven-development/SKILL.md
- **requesting-code-review**: 审查与验证已完成的代码实现。 -> 详见 .skills-engine/skills/requesting-code-review/SKILL.md
