# CHANGELOG

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/), and this project adheres to [Semantic Versioning](https://semver.org/).

---

## [2.2.0] - 2026-03-05

### Added
- ✨ **Mandatory 4-Skill Initialization Protocol**
  - New `AI_INITIALIZATION.md` defining fail-closed execution sequence
  - Enforces 4 system skills on every AI response with verifiable markers
  - Pre-send gate checklist prevents incomplete responses
- ✅ **Verifiable Output Markers**
  - `✨ 已启用上下文校验` - Indicates protocol is active
  - `尊敬的主人：` - Standalone salutation for professionalism
  - Diff-formatted footer with repository status and skill list
  - Anti-fake-list enforcement prevents hallucinated items
- 📋 **Version Management Scripts**
  - `npm run version:patch|minor|major` - Automated version bumping
  - `postversion` hook auto-pushes commits and tags to origin/main

### Enhanced
- 🔍 **_execution-precheck Skill**
  - 6-step self-check process with truthfulness test (#5)
  - Prevents self-deception by requiring honest assessment
  - Validates all 4 phases complete before response generation
- 📝 **_context-ack Skill**
  - Diff-formatted footer using syntax highlighting
  - Anti-fake-list rules with verification checklist
  - Repository status display (branch, uncommitted, untracked)
- 📚 **AI_CONSTITUTION.md**
  - Binding of initialization protocol as Layer 2 authority
  - Evolution infrastructure documentation
  - Skill modularity principles

### Removed
- 🗑️ **EXECUTION_RULES.md** - Deprecated, replaced by stronger AI_INITIALIZATION.md
  - Old optional guardrails superseded by mandatory protocol

### Impact
**Quality Improvement**: Every AI response now guaranteed to follow 4-phase initialization, with verifiable markers preventing skill hallucination and false lists.

---

## [2.1.0] - 2026-03-04

### Changed
- 🧭 **Skill Path Messaging Simplification**
  - Updated `_evolution-core` to describe the canonical path directly as `.agent/skills/<skill>/SKILL.md`
  - Removed wording that repeatedly referenced legacy path avoidance to reduce ambiguity
- 🧱 **CLI Tier Model Alignment**
  - `evoskills` now explicitly supports three tiers:
    - Core (2): `_evolution-core`, `_skills-manager`
    - Required System (4): `_instruction-guard`, `_context-ack`, `_file-output-guard`, `_execution-precheck`
    - Optional (8): remaining workflow skills
  - Added `init --required-only` (install Core + Required System)
  - Updated `list` output to show all three tiers
  - Updated `remove` guard to block both Core and Required System skills
  - Updated AGENTS section generator to output tiered groups and richer skill descriptions

### Fixed
- ✅ **Config Version Consistency**
  - `evoskills init` now writes project config version as `2.1.0`
- ✅ **CLI Version Sync**
  - Bumped CLI runtime version from `2.0.0` to `2.1.0`

### Release
- 📦 npm package version bumped to `2.1.0` (`@xingyu.wang/evoskills`)

---

## [2.0.0] - 2026-03-04

### Added
- 🏗️ **Three-Layer Architecture Model**
  - Layer 1: AI Constitution - Pure evolution principles (66 lines)
  - Layer 2: Execution Rules - 4 optional safety guardrails (105 lines)
  - Layer 3: Modular Skills - 14 total (5 core + 9 optional)
- 🌐 **Complete Internationalization to English**
  - README.md - Professional English for npm registry
  - AI_CONSTITUTION.md - Core evolution principles
  - EXECUTION_RULES.md - Optional safety rules
  - All technical documentation translated
  - CLI templates and output messages standardized
- 📦 **Official npm Registry Publication**
  - Package: `@xingyu.wang/evoskills`
  - Published to https://registry.npmjs.org/
  - Verified installation and functionality in clean environment
  - v1.1.0 deprecated with upgrade guidance
- 📝 **Enhanced Documentation**
  - docs/ARCHITECTURE_DECISIONS.md - Final architectural decisions
  - docs/QUICK_DECISIONS.md - Quick reference for design choices
  - docs/IMPLEMENTATION_CHECKLIST.md - Complete implementation status
  - Updated docs/cli-usage.md with correct package names
  - SKILLS.md - Comprehensive skill registry (14 skills detailed)

### Changed
- **Major Architecture Refactoring**
  - Simplified AI Constitution from 292 lines → 66 lines (evolved = always active core only)
  - Separated 4 execution rules into optional EXECUTION_RULES.md (users can delete)
  - Project now self-bootstraps using `.agent/skills/` directory structure
  - Smart content protection for user customizations (markers + append)
- **CLI Evolution**
  - Unified `evoskills update` (removed `--cli`, `--self` variants to prevent version drift)
  - Enhanced `evoskills init` to download all three layers
  - Added `create_execution_rules_if_missing()` function
  - Version bumped from 1.1.0 → 2.0.0 in evoskills script
- **NPM Package Configuration**
  - Updated `files` array to include AI_CONSTITUTION.md and EXECUTION_RULES.md
  - Specified `engines.node: >=18`
  - Added `publishConfig.access: public` for transparency
- **Skill Composition**
  - Added 5 new system skills: _execution-precheck, _session-safety, _skills-manager, _traceability-check, _change-summary (previously under different structure)
  - Confirmed all 14 skills functional and tested
  - Updated AGENTS.md with skill registry (marker-protected for user content)

### Fixed
- ✅ **Repository Cleanup**
  - Removed obsolete directories: cli/, constitution/, templates/, scripts/
  - Cleaned up version.txt and other legacy files
  - Consolidated npm configuration into single package.json
- ✅ **npm Registry Issues**
  - Reset registry from npmmirror.com (China mirror) → https://registry.npmjs.org/
  - Fixed package.json `files` array to include essential documentation
  - Verified package contents: 30.0 kB unpacked, 10.2 kB compressed, 6 files correct

### Testing & Verification
- ✅ Installation test passed: `npm install @xingyu.wang/evoskills@latest` in clean environment
- ✅ CLI verification: `evoskills --version` → evoskills version 2.0.0
- ✅ Functionality verification: `evoskills list` → All 14 skills correctly enumerated
- ✅ Deprecation notice: v1.1.0 marked as deprecated with upgrade message

### Breaking Changes
- **Constitution is Mandatory**: `_evolution-core` cannot be disabled (design choice: always-on evolution)
- **Three-Layer Model**: Execution rules are now optional and separate from constitution
- **Package Name**: Changed from `@wxy/evoskills` → `@xingyu.wang/evoskills`
- **CLI Consolidation**: Removed separate `update --cli` and `update --self` commands

### Deprecated
- 🚨 **Version 1.1.0 Deprecated** - Migrate to 2.0.0
  - Old three-layer architecture not implemented
  - English documentation incomplete
  - npm publishing untested
  - Please upgrade: `npm install -g @xingyu.wang/evoskills@latest`

---

## [1.1.0] - 2026-03-02

### Added
- 📦 Initial npm publication of evoskills CLI
- 🎯 14 skills fully registered in AGENTS.md

### Fixed
- Repository structure for npm compatibility
- Package metadata configuration

---

## [1.0.0-beta] - 2026-02-14

### Added
- 🎉 **初始化 copilot-evolution-skills 项目** - 通用 AI 助手技能库
- 📚 **完整的项目文档**
  - README.md - 项目主页和快速指南
  - SETUP.md - 安装和使用说明
  - constitution/ai-evolution-constitution.md - 通用进化宪法
- 🛠️ **12 个自定义技能的迁移**
  - _evolution-core - 进化能力元技能
  - _typescript-type-safety - TypeScript Mock 创建与错误预防
  - _git-commit - Git 提交规范化
  - _pr-creator - PR 创建与版本控制流程
  - _code-health-check - 提交前代码检查
  - _release-process - 完整的发布流程
  - _context-ack - 上下文校验与输出格式
  - _instruction-guard - 强制读取指令文件
  - _file-output-guard - 文件创建安全约束
  - _change-summary - 提交摘要汇总
  - _traceability-check - 说明与变更校验
  - _session-safety - 会话超长防护

### In Progress
- 🔄 **核心文档编写中**
  - .github/INSTALLATION.md - AI 参考指南
  - .github/CONFLICT_RESOLUTION.md - 多项目冲突处理
  - .github/EVOLUTION.md - 技能演进机制
  - docs/AI_INTEGRATION_GUIDE.md - AI 集成指南
  - docs/SKILL_CREATION_GUIDE.md - 新技能创建流程
  - docs/MULTI_PROJECT_GUIDE.md - 多项目共享指南
  - docs/VERSIONING.md - 版本管理策略

- 🛠️ **工具脚本编写中**
  - scripts/setup-interactive.sh - 交互式安装脚本
  - scripts/validate-installation.sh - 安装验证脚本
  - scripts/resolve-conflicts.sh - 冲突解决辅助脚本

- 📋 **模板编写中**
  - templates/SKILL_TEMPLATE.md - 新技能标准模板
  - templates/INSTRUCTION_TEMPLATE.md - 项目指令模板
  - templates/copilot-instructions-base.md - 指令基础模板

### Future Plans
- 与 SilentFeed 项目的 submodule 集成测试
- 在多个项目中验证冲突解决方案
- 完整的 API 文档
- GitHub Actions 持续集成

---

## 版本说明

### 当前版本：1.0.0-beta
- **状态**：设计完成，初始化完成，文档和工具编写进行中
- **预计完成**：2026 年 3 月
- **目标**：v1.0.0（稳定版本，支持多项目集成）

### 版本管理策略

采用 Semantic Versioning：

- **MAJOR** (主版本)：架构变化（文件结构、用法改变）
  - 示例：1.0.0 → 2.0.0（需要项目重新适配）
  
- **MINOR** (次版本)：新技能、主要改进（向后兼容）
  - 示例：1.0.0 → 1.1.0（自动升级安全）
  
- **PATCH** (修订版本)：文档更新、小修复（向后兼容）
  - 示例：1.0.0 → 1.0.1（自动升级推荐）

### 发布流程

1. 创建 release/* 分支
2. 更新版本号（version.txt）
3. 更新 CHANGELOG.md
4. 创建 PR 进行审查
5. 合并到 master
6. 标记 Git tag：`git tag v1.0.0`
7. 发布 GitHub Release
8. 项目通过 `git submodule update --remote` 获取更新

---

## 贡献指南

如果你想为本项目贡献新技能或改进：

1. 阅读 [docs/SKILL_CREATION_GUIDE.md](./docs/SKILL_CREATION_GUIDE.md)
2. 遵循技能模板创建新技能
3. 创建 PR，描述技能的目的和应用场景
4. 获得至少 2 个 Reviewer 的批准
5. 合并并更新版本号和 CHANGELOG

---

## 相关链接

- 📖 [README.md](./README.md) - 项目主页
- 🚀 [SETUP.md](./SETUP.md) - 快速开始
- 🛠️ [docs/](./docs/) - 详细文档
- 📚 [constitution/ai-evolution-constitution.md](./constitution/ai-evolution-constitution.md) - 进化宪法
- 🎯 [skills/](./skills/) - 所有技能库

---

## 许可证

本项目采用 MIT License - 详见 [LICENSE](./LICENSE) 文件
