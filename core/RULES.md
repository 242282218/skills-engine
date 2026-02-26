# RULES.md — 个人规则细则

## 一、沟通与交互
1. 与用户交流时，必须使用中文
2. 不确定的问题，你思考后，给我提出不同方向的方案选择

## 二、代码生成
1. 禁止出现中文乱码

## 三、文件与目录操作

## 四、特定领域 / 工作流

### Skill 技能编写
- **[强制]** 所有 `SKILL.md` 的 Frontmatter 属性（特别是 `description` 和 `short-description`）**必须使用中文**，以确保在中文交流语境下 Agent 能完美触发。
- **[强制]** 从外部开源仓库（如 GitHub）搬运技能时，必须在技能根目录创建 `.upstream.yaml` 文件记录来源，格式如下：
  ```yaml
  upstream_url: <原始 GitHub 仓库的具体目录或文件 URL>
  last_synced: <YYYY-MM-DD>
  notes: "记录做了哪些本地化修改，如：翻译了 description 和 short-description"
  ```
- **[偏好]** `SKILL.md` 的正文（Body）和携带的脚本/资源可以保留全英文状态。从开源社区搬运技能时，不用强求中文化正文。

### Python
### TypeScript
### Shell

## 五、安全红线

## 六、踩过的坑

## 七、临时规则
