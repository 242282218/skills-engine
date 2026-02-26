# 提示词 — 将 skills-engine 本地变更推送到 GitHub

> 在 skills-engine 仓库目录中把下面这段话发给 AI 即可。

---

## 提交并推送

```
请帮我把 skills-engine 的本地变更提交并推送到 GitHub。

仓库路径：C:\Users\24228\Desktop\skills_project
远程仓库：https://github.com/242282218/skills-engine

步骤：
1. 运行 git status 查看当前变更
2. 如果没有变更，告诉我"工作区干净，无需提交"并结束
3. 如果有变更，展示差异摘要：
   - 运行 git diff --stat 查看文件改动统计
   - 列出新增、修改、删除的文件清单
   - 简要说明主要变化内容
4. 等我确认后，再执行以下操作：
   - 按以下规则生成 commit message：
     - 格式：Conventional Commits（feat/fix/docs/chore）
     - 示例：feat(skills): add xxx skill
     - 示例：docs(rules): update coding conventions
     - 示例：chore: sync adapter indexes
     - 如果改动涉及多个类别，只用一条最合适的
   - 执行 git add -A 暂存所有变更
   - 执行 git commit -m "<message>"
   - 执行 git push 推送到远程 main 分支
5. 告诉我：提交了什么、commit hash、推送是否成功

注意：如果 push 失败（如远端有新提交），先 git pull --rebase 再重试。
```

---

## 仅查看变更（不提交）

```
请帮我检查 skills-engine 仓库当前有哪些未提交的变更。

仓库路径：C:\Users\24228\Desktop\skills_project

步骤：
1. 运行 git status 查看变更概览
2. 运行 git diff --stat 查看具体文件改动统计
3. 告诉我哪些文件有改动、是新增还是修改
4. 不要自动提交，等我确认
```
