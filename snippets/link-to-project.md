# 提示词 — 链接 skills-engine 到当前项目

> 在新项目中把下面这段话发给 AI，它会自动帮你执行链接。

---

## 使用方式

复制下方提示词，粘贴给 AI 发送即可。根据你的系统选 Windows 或 Linux 版本。

---

## Windows 版

```
请帮我将 skills-engine 链接到当前项目。

步骤：
1. 找到 skills-engine 仓库路径（位于 C:\Users\24228\Desktop\skills_project）
2. 当前项目路径就是工作区根目录
3. 执行命令：& "C:\Users\24228\Desktop\skills_project\setup.ps1" -TargetProject "<当前项目绝对路径>"
4. 检查执行结果，确认以下文件/目录已创建：
   - .gemini/skills/（目录链接）
   - CLAUDE.md
   - AGENTS.md
   - .trae/rules/project_rules.md
5. 将这些链接/生成的文件加入 .gitignore（它们不应该提交到项目仓库）
6. 告诉我链接结果
```

## Linux / macOS 版

```
请帮我将 skills-engine 链接到当前项目。

步骤：
1. 找到 skills-engine 仓库路径（通常在 ~/skills-engine 或 ~/Desktop/skills_project）
2. 当前项目路径就是工作区根目录
3. 执行命令：bash <skills-engine路径>/setup.sh "<当前项目绝对路径>"
4. 检查执行结果，确认以下文件/目录已创建：
   - .gemini/skills/（符号链接）
   - CLAUDE.md
   - AGENTS.md
   - .trae/rules/project_rules.md
5. 将这些链接/生成的文件加入 .gitignore（它们不应该提交到项目仓库）
6. 告诉我链接结果
```

---

## 推荐追加到 .gitignore 的内容

```
# skills-engine links
CLAUDE.md
AGENTS.md
GEMINI.md
.gemini/skills
.trae/rules/project_rules.md
```
