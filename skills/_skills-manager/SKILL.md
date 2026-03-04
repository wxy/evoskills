# 技能：可进化技能库管理器

## 概述

用于管理 copilot-evolution-skills 的初始化、安装、更新与贡献流程。
当用户请求“初始化技能库”“更新技能”“贡献技能”或“检查技能状态”时使用。

## 触发条件

- "初始化技能库" / "init skills"
- "更新技能" / "update skills"
- "贡献技能改进" / "contribute skills"
- "检查技能状态" / "check skills status"

## 执行流程

### 1. 初始化技能库

当用户首次集成技能时：

```bash
evoskills init
```

可选模式：

```bash
evoskills init --core-only
evoskills init --skills _git-commit,_pr-creator
```

初始化后会创建/维护：
- `.agent/skills/`（用户项目中的安装目录）
- `AGENTS.md`（项目根目录技能入口登记）
- `.github/AI_CONSTITUTION.md`
- `.github/copilot-instructions.md`

### 2. 更新技能状态

当用户要求更新时：

```bash
evoskills update
```

更新单个技能：

```bash
evoskills update _git-commit
```

说明：不再使用 `setup.sh` / `update.sh` 脚本，也不使用 submodule。

### 3. 安装或卸载技能

```bash
evoskills install _git-commit
evoskills remove _git-commit
evoskills list --installed
```

约束：
- 核心技能不可卸载
- 安装来源为仓库 `skills/`，安装目标为用户项目 `.agent/skills/`

### 4. 贡献技能改进

当用户希望贡献本地改进时：

```bash
# 1) 先在仓库中修改 skills/<skill>/SKILL.md
git checkout -b feat/update-skill-manager

# 2) 提交改动
git add .
git commit -m "docs(skills): migrate _skills-manager to evoskills workflow"

# 3) 推送并创建 PR
git push -u origin feat/update-skill-manager
```

如果已安装 GitHub CLI：

```bash
gh pr create --fill
```

## 常见问题处理

### Q: 旧文档里还在引用 setup.sh / update.sh / contribute.sh 怎么办？

A: 全部替换为 `evoskills init` / `evoskills update` / `evoskills contribute <skill>`。

### Q: 为什么仓库里是 `skills/`，用户项目里是 `.agent/skills/`？

A: `skills/` 是发布源目录，`.agent/skills/` 是安装目录。两者分离可以同时满足：
- npm 发包结构稳定
- 用户项目隔离安装
- openskills 入口发现（根 `AGENTS.md`）

### Q: 如何检查当前技能安装状态？

```bash
evoskills list --installed
cat AGENTS.md
```

## 最佳实践

- 发布源统一维护在仓库 `skills/`
- 用户项目只读写 `.agent/skills/`
- 技能入口固定在项目根 `AGENTS.md`
- 宪法固定在 `.github/AI_CONSTITUTION.md`

## 技术说明

- CLI 入口：仓库根 `evoskills`（英文脚本，适合 npm 发布）
- npm install: `npm install -g @xingyu.wang/evoskills`
- Alternate: `npm install -g github:xingyu.wang/copilot-evolution-skills`

## 快速参考

- 初始化：`evoskills init`
- 更新：`evoskills update`
- 安装技能：`evoskills install <skill>`
- 卸载技能：`evoskills remove <skill>`
- 查看已装：`evoskills list --installed`
