# Quick Decisions - v2.0.0

## Architecture

- `AGENTS.md` - Root directory, lists skills (openskills compatible)
- `.github/AI_CONSTITUTION.md` - Core evolution principles (66 lines)
- `.github/EXECUTION_RULES.md` - Optional safety rules (105 lines, can be deleted)
- `.github/copilot-instructions.md` - Entry point, references all three layers

## Installation & Skills

- **Package Name**: `@xingyu.wang/evoskills` (npm registry)
- **Skills Installation Directory**: `.agent/skills/`
- **CLI Entry Point**: Root directory `evoskills`
- **Install Command**: `npm install -g @xingyu.wang/evoskills`
- **Update Command**: `evoskills update` (unified, no `--cli` or `--self`)
- **Skill Count**: 14 total (5 core required + 9 optional)

## Compatibility

- openskills compliant (skill discovery via AGENTS.md)
- Kebab-case skill naming (`_skill-name`)
- Each skill contains SKILL.md descriptor
- Node.js >= 18 required

## Design Principles

1. **Lean Constitution** - Only evolution principles, no rules or skill details
2. **Mandatory Evolution** - `_evolution-core` always enabled, cannot be disabled
3. **Optional Rules** - Execution rules can be deleted if not needed
4. **User Content Protected** - Marker-based (AGENTS.md) and smart append (copilot-instructions.md)
5. **Self-Hosting** - Project structure mirrors user projects
