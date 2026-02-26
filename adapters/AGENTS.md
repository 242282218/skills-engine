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

## 技能调用规则

> **[强制]** 接到任何编码任务时，必须先扫描下方技能分类，判断是否有可用技能。有则**必须**读取对应 `SKILL.md` 并遵守其指令，不得跳过。

- 🔒 **强制**：对应阶段必须触发，不允许跳过
- 📌 **按需**：任务场景匹配时应主动调用，不应等用户要求

## 可用技能

### 🛡️ 流程管控（🔒 强制）
- **brainstorming**: 在进行任何创造性工作之前强制触发，梳理需求和设计方案 -> 详见 .skills-engine/skills/brainstorming/SKILL.md
- **test-driven-development**: 实现功能或修复 Bug 前强制触发，先写测试再写代码 -> 详见 .skills-engine/skills/test-driven-development/SKILL.md
- **requesting-code-review**: 完成任务或重大功能后强制触发，审查代码是否达标 -> 详见 .skills-engine/skills/requesting-code-review/SKILL.md

### 🎨 前端与设计（📌 按需）
- **frontend-design**: 构建 Web 组件、美化 UI 或写网页时触发 -> 详见 .skills-engine/skills/frontend-design/SKILL.md
- **ui-ux-pro-max**: 规划、设计、审查或优化 UI/UX 视觉方案时触发 -> 详见 .skills-engine/skills/ui-ux-pro-max/SKILL.md
- **web-design-guidelines**: 审查 UI/UX 规范性或检查无障碍时触发 -> 详见 .skills-engine/skills/web-design-guidelines/SKILL.md
- **vercel-react-best-practices**: 编写、审查或重构 React/Next.js 代码时触发 -> 详见 .skills-engine/skills/vercel-react-best-practices/SKILL.md

### 🔍 代码质量（📌 按需）
- **frontend-code-review**: 审查前端文件（.tsx/.ts/.js）的业务逻辑、性能及架构规范时触发 -> 详见 .skills-engine/skills/frontend-code-review/SKILL.md

### 🌐 全栈开发（📌 按需）
- **fullstack-developer**: 涉及 React/Next.js/Node.js/数据库的全栈开发时触发 -> 详见 .skills-engine/skills/fullstack-developer/SKILL.md

### 🧪 测试与自动化（📌 按需）
- **webapp-testing**: 利用 Playwright 对 Web 应用进行本地自动化测试时触发 -> 详见 .skills-engine/skills/webapp-testing/SKILL.md
- **browser-use**: 需要导航网站、与网页交互、填表或抓取数据时触发 -> 详见 .skills-engine/skills/browser-use/SKILL.md

### ⚙️ 技能管理（📌 按需）
- **skill-creator**: 用户想创建或修改技能时触发 -> 详见 .skills-engine/skills/skill-creator/SKILL.md
- **skill-installer**: 用户要求安装技能时触发 -> 详见 .skills-engine/skills/skill-installer/SKILL.md
- **find-skills**: 用户询问"我该如何做某事"或寻找技能时触发 -> 详见 .skills-engine/skills/find-skills/SKILL.md
