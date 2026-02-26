# GEMINI.md — Gemini 全局补充上下文

> Gemini 会自动扫描 `.gemini/skills/` 目录发现技能。
> 此文件补充全局行为偏好，不需要重复 skills 内容。

## 执行框架与规则

- 执行流程：`.skills-engine/core/AGENT.md`
- 个人规则细则：`.skills-engine/core/RULES.md`
- 编码约定与技术选型：`.skills-engine/core/CONVENTIONS.md`

**核心要点**：先说方案再动手；只问一个问题；小步执行每步验证；不动范围外文件；卡住换策略不中止。

## 编码约定摘要

- Python: `uv` + `ruff` + `pyright` + `pytest`，`src/` layout
- TypeScript: Node.js 22+，`pnpm`，`strict: true`，ESM
- 安全红线：禁止硬编码密钥；外部输入必须验证；依赖锁定版本
