# Agent Instructions

> 整合自 `skills-engine/core/`，链接到项目后自动生效。

## 执行框架

先想后做 → 只问一个问题 → 小步执行 → 做完验证 → 简短说明结果。

流程：理解任务 → 有疑问给选项+问一个 → 说方案 → 等确认 → 执行 → 报告（改了什么/在哪/怎么验证）。

执行中：小步推进；失败就最小修复；不动任务范围外的文件；卡住换策略不中止。

## 规则

详见 `core/RULES.md`（个人细则持续补充中）。

## 编码约定

- Python: `uv` + `ruff` + `pyright`，`src/` layout，`pyproject.toml` 统一配置
- TypeScript: Node.js 22+，`pnpm`，`strict: true`，ESM 优先
- 安全：禁止硬编码密钥；所有外部输入必须验证；依赖锁定版本
- Git: Conventional Commits；不提交 `.env` 和构建产物

详见 `core/CONVENTIONS.md`。

## 可用技能

> 技能存放于 `skills/`，每个子目录含 `SKILL.md`。
- **skill-creator**: 创建和更新有效技能的指南。当用户想添加或修改专门工作流/知识技能时触发。 -> 详见 skills/skill-creator/SKILL.md
- **skill-installer**: 从精选列表或 GitHub 仓库等路径安装技能。当用户要求列出或安装技能时触发。 -> 详见 skills/skill-installer/SKILL.md
- **find-skills**: 帮助用户发现和安装生态系统中的技能。当用户询问“我该如何做某事”或“寻找某事技能”时触发。 -> 详见 skills/find-skills/SKILL.md
- **vercel-react-best-practices**: Vercel 提供的 React 和 Next.js 最佳实践。当编写、审查或重构 React/Next.js 代码时触发。 -> 详见 skills/vercel-react-best-practices/SKILL.md
- **web-design-guidelines**: 审查代码是否符合 Web 界面设计指南。要求“审查我的 UI/UX ”或检查无障碍时触发。 -> 详见 skills/web-design-guidelines/SKILL.md
- **frontend-design**: 创建高设计感的前端界面，打破常规 AI 审美。要求构建 Web 组件、美化 UI 或写网页时触发。 -> 详见 skills/frontend-design/SKILL.md
- **webapp-testing**: 利用 Playwright 对 Web 应用程序进行本地自动化交互和测试。 -> 详见 skills/webapp-testing/SKILL.md
- **frontend-code-review**: 前端代码审查助手。涵盖业务逻辑、组件性能及架构规范检查。 -> 详见 skills/frontend-code-review/SKILL.md
- **fullstack-developer**: 提供涵盖 React、Node.js 及数据库的全栈 Web 开发专家级知识体系。 -> 详见 skills/fullstack-developer/SKILL.md
