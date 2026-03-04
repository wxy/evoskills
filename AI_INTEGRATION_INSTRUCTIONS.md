# AI Integration Instructions (Current)

本仓库的当前集成方式基于 `evoskills` CLI，不再使用 submodule 脚本。

## 1) Install CLI

```bash
npm install -g @xingyu.wang/evoskills
# Or from GitHub:
npm install -g github:xingyu.wang/copilot-evolution-skills
```

## 2) 在目标项目初始化

```bash
cd /path/to/your/project
evoskills init
```

初始化将创建/维护：
- `.agent/skills/`
- `AGENTS.md`（项目根目录）
- `.github/AI_CONSTITUTION.md`
- `.github/copilot-instructions.md`

## 3) 日常命令

```bash
evoskills list
evoskills list --installed
evoskills install _git-commit
evoskills remove _git-commit
evoskills update
```

## 4) 兼容性约束（openskills）

- 根目录 `AGENTS.md` 仅做技能入口登记
- 技能安装目录固定为 `.agent/skills/`
- 技能目录命名采用 `_kebab-case`
- 每个技能目录包含 `SKILL.md`

## 5) 不再使用的旧方式

以下方式已废弃：
- `scripts/setup.sh`
- `scripts/update.sh`
- `scripts/contribute.sh`
- `.evolution-skills/` 目录模型
