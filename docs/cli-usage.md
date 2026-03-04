# evoskills CLI 使用指南

## Installation

Recommended to install globally via npm:

```bash
npm install -g @xingyu.wang/evoskills
```

Or install directly from GitHub:

```bash
npm install -g github:xingyu.wang/copilot-evolution-skills
```

## 初始化项目

```bash
cd /path/to/your/project
evoskills init
```

初始化会创建/维护：
- `.agent/skills/`
- `AGENTS.md`（根目录，技能入口登记）
- `.github/AI_CONSTITUTION.md`
- `.github/copilot-instructions.md`

## 命令

### `evoskills init`
初始化技能环境。

选项：
- `--core-only`：仅安装核心技能
- `--skills a,b,c`：安装指定技能
- `--all`：安装全部技能（默认）

### `evoskills list`
- `evoskills list`：显示可用技能
- `evoskills list --installed`：显示已安装技能

### `evoskills install <skill>`
安装指定技能到 `.agent/skills/<skill>/`。

### `evoskills remove <skill>`
卸载可选技能（核心技能不可卸载）。

### `evoskills update [skill]`
统一更新入口与技能状态。

说明：不再提供 `update --cli` / `update --self`，避免 CLI、宪法、技能出现版本漂移。

### `evoskills contribute <skill>`
对指定技能发起贡献流程。

## openskills 兼容

- 技能入口：项目根目录 `AGENTS.md`
- 技能目录：`.agent/skills/`
- 技能定义：每个技能目录包含 `SKILL.md`
