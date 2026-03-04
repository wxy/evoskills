# Copilot Evolution Skills - 技能注册表（v2.1.0）

> 更新时间：2026-03-04  
> 总计：14 个技能（Core 2 + Required System 4 + Optional 8）

---

## Tier 1: Core Skills (2)

这些技能是进化基础设施，必须安装且不可卸载。

1. `_evolution-core`  
   - 识别改进机会与模式，驱动持续进化
2. `_skills-manager`  
   - 管理技能生命周期（init/install/remove/update/contribute）

---

## Tier 2: Required System Skills (4)

这些技能是安全与执行基线，必须安装且不可卸载。

1. `_instruction-guard`  
   - 执行前读取并遵循项目指令
2. `_context-ack`  
   - 输出结构化上下文与引用
3. `_file-output-guard`  
   - 保护文件操作，防止误写与危险输出
4. `_execution-precheck`  
   - 执行前依赖与环境预检查

---

## Tier 3: Optional Skills (8)

按需安装的工作流增强技能：

1. `_git-commit` - Conventional Commits 提交流程
2. `_pr-creator` - PR 创建与描述生成
3. `_release-process` - 发布流程编排
4. `_code-health-check` - 提交前质量检查
5. `_typescript-type-safety` - TypeScript 类型安全实践
6. `_change-summary` - 会话变更总结
7. `_traceability-check` - 决策可追踪性检查
8. `_session-safety` - 会话状态与一致性保护

---

## CLI 对应关系

```bash
# 默认：安装全部三层
evoskills init

# 仅核心层（2）
evoskills init --core-only

# 核心 + 系统必选层（2+4=6）
evoskills init --required-only

# 选择性安装可选技能
evoskills init --skills _git-commit,_pr-creator
```

```bash
# 查看技能
evoskills list
evoskills list --installed
```

```bash
# 可选技能增删
evoskills install <skill>
evoskills remove <skill>
```

> 注意：Core 与 Required System 技能不可卸载。

---

## 路径与兼容性

- 技能安装目录：`.agent/skills/`
- 技能入口注册：`AGENTS.md`（根目录）
- 宪法文件：`.github/AI_CONSTITUTION.md`
- 规则文件：`.github/EXECUTION_RULES.md`

---

## 参考

- `AGENTS.md`：运行时技能入口（由 CLI 维护 EVOSKILLS 区块）
- `README.md`：安装与使用文档
- `AI_INTEGRATION_INSTRUCTIONS.md`：项目集成说明
