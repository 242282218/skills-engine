# 维护提示词 — 同步技能索引到 adapters

> 当你新增或删除了 `skills/` 下的 skill 之后，把下面这段话发给 AI：

---

## 使用方式

复制下方提示词，粘贴给 AI 发送即可。

---

## 提示词

```
请帮我同步 skills-engine 的技能索引。

执行以下步骤：
1. 扫描 skills/ 目录，找到所有包含 SKILL.md 的子目录（忽略 _TEMPLATE）
2. 读取每个 SKILL.md 的 frontmatter，提取 name 和 description
3. 生成技能清单，格式为：
   - **{name}**: {description} → 详见 skills/{dir}/SKILL.md
4. 用生成的清单替换以下两个文件中 "## 可用技能" 章节下的内容：
   - adapters/AGENTS.md
   - adapters/CLAUDE.md
5. 告诉我替换了哪些技能、删除了哪些、新增了哪些

不要修改其他任何内容。
```

---

## 触发时机

- ✅ 新建了一个 skill（复制 `_TEMPLATE` 并填写完毕后）
- ✅ 删除或重命名了某个 skill
- ✅ 修改了某个 skill 的 `description` 字段
