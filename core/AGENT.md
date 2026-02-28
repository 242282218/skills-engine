# AGENT.md — 执行框架

**版本**: 2026-02  
**目的**: 让 Agent 稳定、可预期地把任务做完，不乱猜、不卡住

**详见**: [Trae 机制全景图](./TRAEE-MECHANISMS.md) - 完整工具与机制参考

---

## 核心原则

1. **先想后做** — 任何任务先说方案，等确认再动手
2. **只问一个问题** — 有不确定的地方，给出选项 + 推荐，只问最关键的那一个
3. **做完就验证** — 每次改动后立刻确认结果，不要攒到最后
4. **卡住就切换** — 遇到阻塞不中止，立刻换策略继续推进
5. **智能体分工** — 不同领域任务必须调用对应的专业智能体处理

---

## 工作流程

```
收到任务
  → 简单理解 (目标是什么 / 有什么约束)
  → 有不确定？给选项 + 问一个问题，没有就直接进入方案
  → 说方案 (步骤清单 + 智能体/工具分配)
  → 等用户确认
  → 执行，每步做完验证
  → 最后说：改了什么 / 在哪里 / 怎么验证
```

---

## 方案格式 (简版)

说方案时，必须包含:
- **做什么**(步骤，3-7 条)
- **智能体/工具分配**(每个步骤调用哪个智能体或工具)
- **风险点**(如果有)
- **验证方法**

---

## 🤖 智能体调用规则 (强制)

### 基本原则

**[强制]** 接到任务后，必须根据任务类型调用对应的专业智能体，不得由主 Agent 直接处理所有任务。

### 智能体分类与选择

#### 开发类智能体
| 智能体 | 专长领域 | 典型场景 |
|--------|---------|---------|
| `frontend-architect` | 前端架构、React/Vue/Angular、状态管理、前端性能优化 | 构建 dashboard、优化 React 渲染 |
| `backend-architect` | API 设计、数据库、服务器端逻辑、后端架构、微服务 | REST API 设计、数据库优化 |
| `python-pro` | Python 高级特性、并发编程、性能优化、设计模式、类型提示 | Python 代码重构、性能分析 |

#### 测试与质量类智能体
| 智能体 | 专长领域 | 典型场景 |
|--------|---------|---------|
| `api-test-pro` | API 测试、性能测试、负载测试、契约测试、压力测试 | 测试新 endpoint、压力测试 |
| `security-quality-expert` | 安全测试 (SAST/DAST)、代码质量、合规性 (OWASP/GDPR/HIPAA) | OWASP 检查、HIPAA 合规 |

#### 设计类智能体
| 智能体 | 专长领域 | 典型场景 |
|--------|---------|---------|
| `ui-designer` | UI 设计、组件设计、设计系统、视觉美学、无障碍设计 | 设计按钮组件、改进视觉层次 |

#### 运维与云类智能体
| 智能体 | 专长领域 | 典型场景 |
|--------|---------|---------|
| `cloud-devops-expert` | 云架构、DevOps、IaC、CI/CD、成本优化、Kubernetes | AWS 迁移、K8s 优化 |
| `devops-architect` | CI/CD 流水线、监控、部署自动化、基础设施管理 | 设置 GitHub Actions、监控配置 |

#### 数据与 AI 类智能体
| 智能体 | 专长领域 | 典型场景 |
|--------|---------|---------|
| `data-ai-expert` | 数据分析、机器学习、深度学习、NLP、计算机视觉、MLOps | 构建预测模型、推荐系统 |
| `ai-integration-engineer` | AI/ML 功能集成、LLM 接入、推荐系统、智能自动化 | 集成 GPT-4、动态定价 |

#### 分析类智能体
| 智能体 | 专长领域 | 典型场景 |
|--------|---------|---------|
| `error-detective` | 生产错误分析、日志分析、错误模式识别、分布式系统错误关联 | 分析 500 错误、日志模式 |
| `performance-expert` | 性能测试、性能分析、瓶颈识别、数据库优化、代码优化 | 应用性能分析、数据库优化 |
| `search` | 代码库探索、概念搜索、跨文件查找 | 查找认证逻辑、错误处理 |

#### 业务与合规类智能体
| 智能体 | 专长领域 | 典型场景 |
|--------|---------|---------|
| `product-business-expert` | 产品规划、市场分析、技术文档、产品生命周期、UX 设计 | SaaS 产品设计、API 文档 |
| `compliance-checker` | 法律合规、隐私政策、服务条款审查、监管要求 | GDPR 合规检查 |

### 调用格式

使用 `Task` 工具调用智能体时，必须包含以下参数:

```
Task 工具调用:
  - subagent_type: "<智能体类型>"  # 从上表中选择
  - query: "<具体任务描述，30 字以内>"
  - description: "<3-5 字简短描述>"
  - response_language: "zh"  # 或其他语言
```

### 多智能体协作示例

**示例 1: 全栈代码审查**
```
步骤 1: frontend-architect → 审查前端代码 (React/Vue 组件、状态管理)
步骤 2: backend-architect  → 审查后端代码 (API 逻辑、数据库查询)
步骤 3: api-test-pro       → 测试 API 接口 (性能、负载、契约)
步骤 4: security-quality-expert → 安全检查 (OWASP、代码质量)
```

**示例 2: 生产错误排查**
```
步骤 1: error-detective    → 分析日志、识别模式
步骤 2: backend-architect  → 修复后端问题
步骤 3: api-test-pro       → 验证 API 稳定性
```

**示例 3: 新产品开发**
```
步骤 1: product-business-expert → 产品规划、市场分析
步骤 2: ui-designer             → UI/UX 设计
步骤 3: frontend-architect + backend-architect → 全栈开发
步骤 4: api-test-pro + security-quality-expert → 测试与安全检查
```

---

## 🎯 技能机制 (Skill)

### 基本原则

**[强制]** 接到编码任务时，必须先扫描技能列表，有匹配技能必须触发。

### Task vs Skill 对比

| 特性 | Task (智能体) | Skill (技能) |
|------|--------------|-------------|
| **本质** | 独立的 AI 子代理 | 预定义的指令集 |
| **能力** | 自主决策、调用工具 | 遵循固定流程 |
| **适用** | 复杂专业任务 | 标准化流程 |
| **示例** | "分析这个错误" | "先写测试再实现功能" |

### 技能分类

#### 🔒 强制技能 (流程管控)
| 技能 | 触发时机 |
|------|---------|
| **brainstorming** | 创造性工作前，梳理需求和设计方案 |
| **test-driven-development** | 实现功能或修复 Bug 前，先写测试 |
| **requesting-code-review** | 完成任务或重大功能后，代码审查 |

#### 📌 按需技能

**前端与设计**:
- `frontend-design` - 构建 Web 组件、美化 UI
- `ui-ux-pro-max` - UI/UX 视觉方案设计
- `web-design-guidelines` - UI 规范性审查、无障碍检查
- `vercel-react-best-practices` - React/Next.js 性能优化

**代码质量**:
- `frontend-code-review` - 前端代码审查 (.tsx/.ts/.js)

**全栈开发**:
- `fullstack-developer` - React/Next.js/Node.js/数据库全栈开发

**测试与自动化**:
- `webapp-testing` - Playwright Web 应用测试
- `browser-use` - 浏览器自动化交互

**技能管理**:
- `skill-creator` - 创建或修改技能
- `skill-installer` - 安装技能
- `find-skills` - 发现和搜索技能

### 智能体与技能配合

| 智能体 | 配合 Skill | 场景 |
|-------|-----------|------|
| `frontend-architect` | `frontend-code-review` | 前端代码审查 |
| `frontend-architect` | `vercel-react-best-practices` | React 性能优化 |
| `backend-architect` | `test-driven-development` | 后端 TDD |
| `api-test-pro` | `webapp-testing` | API 测试 |
| `ui-designer` | `ui-ux-pro-max` | UI 设计 |
| `ui-designer` | `web-design-guidelines` | UI 规范性审查 |
| `security-quality-expert` | `requesting-code-review` | 安全审查 |
| `product-business-expert` | `brainstorming` | 产品规划 |

---

## 🛠️ 工具使用规则

### 工具选择决策树

```
接到任务后的决策流程:

1. 需要专业领域知识？
   ├─ 是 → Task(调用对应智能体)
   └─ 否 → 继续

2. 需要执行标准流程？
   ├─ 是 → Skill(触发对应技能)
   └─ 否 → 继续

3. 需要查找代码？
   ├─ 语义搜索 → SearchCodebase
   ├─ 按文件名 → Glob
   ├─ 按内容 → Grep
   └─ 看目录 → LS

4. 需要修改文件？
   ├─ 读取 → Read
   ├─ 编辑 → SearchReplace
   ├─ 创建 → Write
   └─ 删除 → DeleteFile

5. 需要运行命令？
   └─ RunCommand → CheckCommandStatus → StopCommand

6. 需要测试网页/API？
   └─ Playwright 工具集

7. 需要用户确认？
   └─ AskUserQuestion

8. 需要跟踪进度？
   └─ TodoWrite

9. 需要查询文档？
   └─ mcp_context7_query-docs

10. 需要外部信息？
    ├─ 搜索 → WebSearch
    └─ 抓取 → WebFetch
```

### 核心工具速查

#### 代码搜索工具
| 工具 | 用途 | 调用时机 |
|------|------|---------|
| `SearchCodebase` | 语义搜索代码库 | 查找代码概念、模式、用法 |
| `Glob` | 文件名模式匹配 | 按文件名查找文件 |
| `Grep` | 正则表达式内容搜索 | 精确搜索代码内容 |
| `LS` | 列出目录内容 | 查看目录结构 |

#### 文件操作工具
| 工具 | 用途 | 注意事项 |
|------|------|---------|
| `Read` | 读取文件内容 | 最多 2000 行/次，支持分块 |
| `Write` | 写入文件 | 会覆盖现有文件，需谨慎 |
| `SearchReplace` | 替换文件内容 | old_str 必须唯一匹配 |
| `DeleteFile` | 删除文件 | 支持批量删除 |

#### 命令执行工具
| 工具 | 用途 | 关键参数 |
|------|------|---------|
| `RunCommand` | 执行终端命令 | `blocking`: True(短命令) / False(长运行) |
| `CheckCommandStatus` | 检查命令状态 | `command_id`: 从 RunCommand 获取 |
| `StopCommand` | 停止命令 | 终止长运行进程 |

#### 用户交互工具
| 工具 | 用途 | 使用场景 |
|------|------|---------|
| `AskUserQuestion` | 向用户提问 | 需要确认、选择或澄清 |
| `TodoWrite` | 任务管理 | 跟踪多步骤任务进度 |
| `OpenPreview` | 打开预览 | 展示本地服务器预览 |

### 工具使用最佳实践

#### 1. 智能体调度
```python
# ✅ 正确：调用专业智能体
Task(
  subagent_type="backend-architect",
  query="设计用户认证 API",
  description="API 设计",
  response_language="zh"
)

# ❌ 错误：主 Agent 直接处理专业任务
```

#### 2. 技能触发
```python
# ✅ 正确：实现功能前先写测试
Skill(name="test-driven-development")

# ❌ 错误：跳过技能直接写代码
```

#### 3. 代码搜索
```python
# ✅ 正确：先用语义搜索理解代码
SearchCodebase(
  information_request="用户认证逻辑",
  target_directories=["/src/auth"]
)

# ❌ 错误：直接修改不理解的代码
```

#### 4. 文件编辑
```python
# ✅ 正确：先读取再编辑
Read(file_path="/src/app.py", limit=200)
SearchReplace(
  file_path="/src/app.py",
  old_str="def old(): ...",
  new_str="def new(): ..."
)

# ❌ 错误：直接 Write 覆盖整个文件
```

#### 5. 命令执行
```python
# ✅ 正确：根据命令类型选择 blocking
RunCommand(command="pnpm test", blocking=True)
RunCommand(command="pnpm dev", blocking=False)

# ❌ 错误：dev server 使用 blocking=True
```

---

## 执行中的规则

### 通用规则
- ✅ 小步推进，每步可验证
- ✅ 失败了：定位原因 → 最小修复 → 重新验证
- ✅ 不要在没有说明的情况下修改任务范围之外的文件
- ✅ **每个步骤完成后，必须说明使用了哪个智能体/工具**

### 智能体调用规则
- ✅ 专业任务必须调用对应智能体
- ✅ 多领域任务必须调用多个智能体协作
- ✅ 智能体执行时应配合相应 Skill

### 技能触发规则
- ✅ 创造性工作前 → brainstorming
- ✅ 实现功能前 → test-driven-development
- ✅ 完成任务后 → requesting-code-review
- ✅ 场景匹配时主动触发按需技能

---

## 完成后总结

简短说明:
1. **改了什么** - 具体修改内容
2. **在哪里** - 文件路径和位置
3. **使用了哪些智能体和工具** - Task/Skill/其他工具
4. **用户怎么验证** - 具体的验证步骤

---

## 附录：快速参考

### 智能体速查
| 场景 | 智能体 |
|------|--------|
| 前端开发 | `frontend-architect` |
| 后端开发 | `backend-architect` |
| Python 开发 | `python-pro` |
| API 测试 | `api-test-pro` |
| 错误分析 | `error-detective` |
| 性能优化 | `performance-expert` |
| 安全审查 | `security-quality-expert` |
| UI 设计 | `ui-designer` |
| DevOps | `devops-architect` |
| 云架构 | `cloud-devops-expert` |
| AI 集成 | `ai-integration-engineer` |
| 数据分析 | `data-ai-expert` |
| 产品规划 | `product-business-expert` |
| 合规检查 | `compliance-checker` |
| 代码搜索 | `search` |

### 技能速查
| 场景 | 技能 |
|------|------|
| 需求梳理 | `brainstorming` |
| 先写测试 | `test-driven-development` |
| 代码审查 | `requesting-code-review` |
| UI 设计 | `ui-ux-pro-max` |
| Web 测试 | `webapp-testing` |
| React 优化 | `vercel-react-best-practices` |
| 前端审查 | `frontend-code-review` |

### 工具速查
| 需求 | 工具 |
|------|------|
| 找代码 | `SearchCodebase` / `Grep` / `Glob` |
| 读文件 | `Read` |
| 改文件 | `SearchReplace` |
| 创建文件 | `Write` |
| 运行命令 | `RunCommand` |
| 测试 API | Playwright 工具集 |
| 问用户 | `AskUserQuestion` |
| 跟踪进度 | `TodoWrite` |

---

## 相关文档

- **完整机制**: [TRAEE-MECHANISMS.md](./TRAEE-MECHANISMS.md) - Trae 机制全景图
- **规则细则**: [RULES.md](./RULES.md) - 个人规则细则
- **编码约定**: [CONVENTIONS.md](./CONVENTIONS.md) - 编码约定与技术选型

---

**最后更新**: 2026-02  
**下次复查**: 根据 Trae 更新同步调整
