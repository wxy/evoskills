# Copilot Evolution Skills - 完整技能列表

> 自动生成的技能注册表  
> 最后更新：2026年3月4日  
> 总计：14 个技能（5 个核心必装 + 9 个可选扩展）

---

## 🏢 核心必装技能 (required: true)

这些技能是系统的基础，**必须安装且不可卸载**。

### 1. `_instruction-guard`

| 属性 | 值 |
|------|-----|
| **版本** | 1.0.0 |
| **Tier** | 1 - 强制执行 |
| **类别** | meta |
| **作者** | wxy |
| **说明** | 强制在每次回复前读取项目指令文件，避免遗漏规范 |
| **外部依赖** | 无 |
| **标签** | instruction, guard, meta |

### 2. `_context-ack`

| 属性 | 值 |
|------|-----|
| **版本** | 1.0.0 |
| **Tier** | 1 - 强制执行 |
| **类别** | meta |
| **作者** | wxy |
| **说明** | 在每次回复中使用固定前缀并列出参考的指令/文件，便于校验是否遵循上下文与规则 |
| **外部依赖** | 无 |
| **标签** | context, ack, format, meta |

### 3. `_file-output-guard`

| 属性 | 值 |
|------|-----|
| **版本** | 1.0.0 |
| **Tier** | 1 - 强制执行 |
| **类别** | meta |
| **作者** | wxy |
| **说明** | 修改或创建文件前必须读取并获得确认，防止无意中破坏文件 |
| **外部依赖** | 无 |
| **标签** | file, guard, safety |

### 4. `_execution-precheck`

| 属性 | 值 |
|------|-----|
| **版本** | 1.0.0 |
| **Tier** | 2 - 条件强制 |
| **类别** | meta |
| **作者** | wxy |
| **说明** | 在执行任何修改前验证依赖、检查环境、列出操作，提前发现问题 |
| **外部依赖** | 无 |
| **标签** | precheck, validation, safety |

### 5. `_evolution-core`

| 属性 | 值 |
|------|-----|
| **版本** | 1.3.0 |
| **Tier** | 2 - 条件强制 |
| **类别** | meta |
| **作者** | wxy |
| **说明** | 进化能力元技能。识别重复错误/用户反馈/复杂工作流，提议改进并询问用户确认 |
| **外部依赖** | 无 |
| **标签** | evolution, improvement, meta |

---

## 🎁 可选扩展技能

可通过 `evoskills install <skill>` 添加这些技能，也可以通过 `evoskills remove <skill>` 卸载。

### Git & Version Control

#### 6. `_git-commit`

| 属性 | 值 |
|------|-----|
| **版本** | 1.2.0 |
| **Tier** | 2 - 条件强制 |
| **类别** | git |
| **作者** | wxy |
| **说明** | Git 提交最佳实践。提供规范化提交流程、说明文件模板、Conventional Commits 格式指导 |
| **外部依赖** | git >= 2.0 |
| **标签** | git, commit, workflow, conventional |

#### 7. `_pr-creator`

| 属性 | 值 |
|------|-----|
| **版本** | 1.0.0 |
| **Tier** | 3 - 显式请求 |
| **类别** | git |
| **作者** | wxy |
| **说明** | 创建 Pull Request。协助生成 PR 描述、变更列表、检查清单；用于技能贡献或项目改进 |
| **外部依赖** | git >= 2.0, gh (GitHub CLI) >= 2.0 |
| **标签** | git, pr, pull-request, workflow |

---

### Release & Publishing

#### 8. `_release-process`

| 属性 | 值 |
|------|-----|
| **版本** | 1.1.0 |
| **Tier** | 3 - 显式请求 |
| **类别** | release |
| **作者** | wxy |
| **说明** | 完整的发布流程。包含版本更新、变更日志生成、标签创建、发布公告等 |
| **外部依赖** | git >= 2.0, node >= 16 (可选，用于自动生成 changelog) |
| **标签** | release, version, publishing |

---

### Code Quality

#### 9. `_code-health-check`

| 属性 | 值 |
|------|-----|
| **版本** | 1.0.0 |
| **Tier** | 3 - 显式请求 |
| **类别** | code-quality |
| **作者** | wxy |
| **说明** | 代码质量检查。检查代码风格、注释完整性、潜在问题等，生成健康度报告 |
| **外部依赖** | 无（基础检查），eslint/prettier/pylint 等（可选） |
| **标签** | code, quality, health, lint |

#### 10. `_typescript-type-safety`

| 属性 | 值 |
|------|-----|
| **版本** | 1.0.0 |
| **Tier** | 3 - 显式请求 |
| **类别** | code-quality |
| **作者** | wxy |
| **说明** | TypeScript 类型安全规范。指导如何避免 `any`、使用严格模式、类型设计最佳实践 |
| **外部依赖** | node >= 16, tsc >= 4.0 |
| **标签** | typescript, type-safety, quality |

---

### Workflow & Automation

#### 11. `_change-summary`

| 属性 | 值 |
|------|-----|
| **版本** | 1.0.0 |
| **Tier** | 2 - 条件强制 |
| **类别** | workflow |
| **作者** | wxy |
| **说明** | 变更总结。在长时间工作后生成结构化的总结，便于后续回顾和文档更新 |
| **外部依赖** | 无 |
| **标签** | summary, change, workflow |

#### 12. `_traceability-check`

| 属性 | 值 |
|------|-----|
| **版本** | 1.0.0 |
| **Tier** | 2 - 条件强制 |
| **类别** | workflow |
| **作者** | wxy |
| **说明** | 可追踪性检查。确保重要决策、改动、风险都有明确的文档记录和链接 |
| **外部依赖** | 无 |
| **标签** | traceability, documentation, audit |

#### 13. `_session-safety`

| 属性 | 值 |
|------|-----|
| **版本** | 1.0.0 |
| **Tier** | 2 - 条件强制 |
| **类别** | workflow |
| **作者** | wxy |
| **说明** | 会话安全。定期检查是否违反了规范、遗漏了重要验证、或处于不安全状态 |
| **外部依赖** | 无 |
| **标签** | safety, session, validation |

---

### Skills Management

#### 14. `_skills-manager`

| 属性 | 值 |
|------|-----|
| **版本** | 1.0.0 |
| **Tier** | 3 - 显式请求 |
| **类别** | meta |
| **作者** | wxy |
| **说明** | 技能管理助手。帮助创建、验证、发布新技能；协助技能库维护者进行版本/质量管理 |
| **外部依赖** | 无 |
| **标签** | skill, management, meta |

---

## 📊 统计信息

### 按类别分布

| 类别 | 核心 | 可选 | 合计 |
|------|------|------|------|
| **meta** | 5 | 1 | 6 |
| **git** | 0 | 2 | 2 |
| **code-quality** | 0 | 2 | 2 |
| **workflow** | 0 | 3 | 3 |
| **release** | 0 | 1 | 1 |
| **合计** | **5** | **9** | **14** |

### 按 Tier 分布

| Tier | 说明 | 数量 | 示例 |
|------|------|------|------|
| **1** | 强制执行（每次回复必须） | 3 | _instruction-guard, _context-ack, _file-output-guard |
| **2** | 条件强制（自动触发） | 6 | _execution-precheck, _evolution-core, _git-commit, ... |
| **3** | 显式请求（用户明确要求） | 5 | _pr-creator, _release-process, _code-health-check, ... |

### 外部依赖汇总

| 依赖程序 | 最低版本 | 相关技能 |
|---------|---------|---------|
| **git** | >= 2.0 | _git-commit, _pr-creator, _release-process |
| **gh** (GitHub CLI) | >= 2.0 | _pr-creator |
| **node** | >= 16 | _release-process (可选), _typescript-type-safety |
| **tsc** (TypeScript Compiler) | >= 4.0 | _typescript-type-safety |

---

## 🔍 快速查询

### 按用途查找技能

**我想要 Git 工作流规范**
→ `_git-commit`, `_pr-creator`

**我想要代码质量检查**
→ `_code-health-check`, `_typescript-type-safety`

**我想要发布管理**
→ `_release-process`

**我想要创建和贡献技能**
→ `_skills-manager`, `_pr-creator`

**我想要工作总结和可追踪性**
→ `_change-summary`, `_traceability-check`

### 按语言查找技能

**TypeScript/Node.js 项目**
→ `_typescript-type-safety`, `_code-health-check`, `_release-process`

**通用项目**
→ `_git-commit`, `_pr-creator`, `_change-summary`

---

## 📦 安装指南

### 查看可用技能

```bash
evoskills list
```

### 安装单个技能

```bash
evoskills install _git-commit
```

### 安装多个技能

```bash
evoskills install _git-commit,_pr-creator
```

### 卸载技能

```bash
evoskills remove _git-commit
```

### 更新所有技能

```bash
evoskills update
```

---

## 🤝 贡献新技能

若你想贡献一个新技能：

1. **参考模板**：参见 [技能定义规范](SKILL_DEFINITION_SPECIFICATION.md)
2. **创建技能**：`evoskills new-skill _my-new-skill`
3. **验证**：`evoskills validate _my-new-skill`
4. **贡献**：`evoskills contribute _my-new-skill`

---

**查看详细文档**：  
- [AI 进化宪法](AGENTS.md)
- [技能定义规范](SKILL_DEFINITION_SPECIFICATION.md)
- [evoskills 使用指南](docs/cli-usage.md)
- [贡献指南](docs/contribution-guide.md)
