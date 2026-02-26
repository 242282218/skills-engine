# 提示词 — 自动更新来源于上游的技能 (Update Upstream Skills)

> 复制以下提示词发给 AI 助手，它会自动寻找配置了 `.upstream.yaml` 的技能并进行拉取与合并更新。

---

```text
请帮我检查 skills-engine 中所有包含 `.upstream.yaml` 的技能，并尝试将它们更新到上游最新版本。

执行步骤要求：
1. 扫描 `skills/` 目录，找出所有包含 `.upstream.yaml` 的技能文件夹。
2. 读取每个 `.upstream.yaml` 中的 `upstream_url` 和 `notes`。
3. 如果 `upstream_url` 对应 GitHub 仓库目录，请将该目录的最新内容通过 clone/下载拉取到一个临时目录。
4. 将上游最新内容合并到本地技能目录，**注意处理合并逻辑**：
   - 绝大多数情况我们保留了上游逻辑，只是翻译了 `SKILL.md` 的 YAML Frontmatter。
   - 因此，覆写 `SKILL.md` 时，请务必保留本地已翻译为中文的 `description`、`name` 等 Frontmatter 元数据属性。
   - 更新底层脚本（如 `scripts/`）或其他参考资料（如 `references/`、`assets/`）为上游最新状态。
5. 更新成功后，将本地该技能的 `.upstream.yaml` 中的 `last_synced` 字段更新为今天的日期。
6. 最后删除临时目录，并向我输出每个被更新的技能名字以及简短的更新摘要，整理一个方便写入 CHANGELOG 的列表给我。
```
