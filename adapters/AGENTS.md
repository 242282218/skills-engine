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
> 新增技能时在此处追加一行：`- **skill-name**: 一句话描述`

*(暂无技能，待添加)*
