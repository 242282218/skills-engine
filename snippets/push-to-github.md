# 提示词 — 将业务项目中的 skills 变更同步并推送到 GitHub

> 当你在业务项目中修改了 `.skills-engine/` 等内容后，把下面这段话发给 AI，让它帮你同步回原仓库并推送。

---

## 提交并推送

```
请帮我把当前项目中涉及 skills-engine 的变更，直接同步并推送到 GitHub 远程仓库。

技能引擎远程仓库：https://github.com/242282218/skills-engine
变更范围（限定在业务项目中的这些目录/文件）：`.skills-engine/ .gemini/ .trae/ CLAUDE.md AGENTS.md GEMINI.md`

步骤：
1. 克隆仓库：将上述远程仓库克隆到一个系统临时目录。
2. 同步项目变更到临时目录：找出当前业务项目中上述“变更范围”内的最新文件改动，将其复制并覆盖到临时目录对应的位置：
   - `.skills-engine/core/` -> 临时目录的 `core/`
   - `.skills-engine/skills/` -> 临时目录的 `skills/`
   - `.skills-engine/snippets/` -> 临时目录的 `snippets/`
   - `.skills-engine/templates/` -> 临时目录的 `templates/`
   - `CLAUDE.md` 等适配器文件 -> 临时目录的 `adapters/` 目录下
3. 在临时目录执行 Git 操作：进入临时目录。
4. 运行 git status 和 git diff --stat 查看原始仓库中被覆盖同步后产生的实际变更。
5. 如果没有任何变更，告诉我“工作区干净与云端一致”，清理临时目录并结束。
6. 如果有变更，向我展示差异摘要（受影响文件和简要说明），等我确认。
7. 我确认后，请继续在临时目录中操作：
   - 生成符合规范的 commit message (例如 feat: xxx, docs: xxx, chore: xxx)
   - 运行 git add -A 和 git commit -m "<message>"
   - 运行 git push origin main 推送到远程 main 分支
8. 告诉我最新的 commit hash 和推送结果，最后清理临时目录。
```

---

## 仅查看差异（不覆盖推送到云端）

```
请帮我检查当前业务项目中针对 skills-engine 的变更，如果推送到云端会有哪些变化。

技能引擎远程仓库：https://github.com/242282218/skills-engine

步骤：
1. 找出当前业务项目中 `.skills-engine/ .gemini/ .trae/ CLAUDE.md AGENTS.md GEMINI.md` 范围内的最新改动。
2. 将远程仓库克隆到一个系统临时目录。
3. 把业务项目中的这些改动内容与临时目录里的云端最新内容进行比较。
4. 向我输出“如果执行同步推送的话”，云端仓库里会有哪些文件被修改/新增，并简要概述变化。
5. 仅限比较和展示，绝勿执行任何实际的复制覆盖、提交或推送操作。
6. 检查完毕后清理临时目录。
```
