# Architecture Decisions - v2.0.0

**Date**: 2026-03-04 | **Version**: 2.0.0

---

## ADR-1: Three-Layer Model

### Decision
Implement a three-layer architecture for clarity and flexibility:

1. **Layer 1 - AI Constitution** (`.github/AI_CONSTITUTION.md`)
   - Pure evolution principles and mechanisms
   - 66 lines, focused on how the system learns and improves
   - Cannot be disabled (mandatory core)
   - Documented in `_evolution-core` skill

2. **Layer 2 - Execution Rules** (`.github/EXECUTION_RULES.md`)
   - 4 optional safety guardrails (separate from constitution)
   - Rule 1: Instruction Guard
   - Rule 2: Context Acknowledgment
   - Rule 3: File Output Guard  
   - Rule 4: Session Safety
   - Users can delete this file entirely if not needed

3. **Layer 3 - Modular Skills** (`.agent/skills/`)
   - 14 total skills: 5 core + 9 optional
   - Each skill self-contained, independently versioned
   - openskills compatible format

### Rationale
- **Clarity**: Clear separation between mandatory evolution and optional safety rules
- **Flexibility**: Users understand what can and cannot be disabled
- **Simplicity**: Constitution remains lean (66 vs 292 lines)
- **User Control**: Users can disable rules, customize execution

---

## ADR-2: Entry Point Structure

### Decision
- **Root**: `AGENTS.md` - Skill registry only (openskills discovery)
- **`.github/`**: Three core files
  - `AI_CONSTITUTION.md` - Evolution principles
  - `EXECUTION_RULES.md` - Optional safety rules
  - `copilot-instructions.md` - Entry point that references both
- **Rationale**: Matches standard `.github/` convention for project docs, clear organization

---

## ADR-3: Skills Installation Directory

### Decision
- **User Project Installation**: `.agent/skills/` (where users install downloaded skills)
- **Source Repository**: `skills/` (where skills are authored for publication)
- **openskills Compatibility**: Maintained through AGENTS.md

### Rationale
- User projects use `.agent/` structure mirroring how evoskills itself works
- Separate source directory doesn't clutter user projects
- Clear distinction between authored and installed skills

---

## ADR-4: Package Name & Distribution

### Decision
- **npm Package**: `@xingyu.wang/evoskills`
- **Registry**: https://registry.npmjs.org/ (official npm, not mirrors)
- **Installation**: `npm install -g @xingyu.wang/evoskills`
- **CLI Entry**: Bash script at root as npm bin

### Rationale
- Scoped package name prevents conflicts
- Official registry ensures reliability and compliance
- Global install provides worldwide availability
- Bash CLI is lightweight and portable

---

## ADR-5: Update Command Unification

### Decision
Single `evoskills update` command replaces `update --cli`, `update --self`

**Unified Workflow**:
- `evoskills update` refreshes:
  1. evoskills CLI script
  2. AI_CONSTITUTION.md
  3. EXECUTION_RULES.md
  4. All installed skills

### Rationale
- Prevents version drift between CLI, constitution, and skills
- Simpler mental model (one command = complete sync)
- Reduces user confusion about partial updates
- Transactional safety (all-or-nothing)

---

## ADR-6: Core Skills & Tier System

### Decision
- **Tier 1 (Enforcement)**: `_instruction-guard`, `_context-ack`, `_file-output-guard`
  - Called every response, cannot be disabled
- **Tier 2 (Conditional)**: `_execution-precheck`, `_evolution-core`, `_git-commit`, `_change-summary`, `_traceability-check`, `_session-safety`
  - Auto-triggered by conditions, can be disabled
- **Tier 3 (Explicit)**: `_pr-creator`, `_release-process`, `_code-health-check`, `_typescript-type-safety`, `_skills-manager`
  - User must explicitly request

**Evolution Core Special Status**: `_evolution-core` is Tier 2 (conditional trigger) but cannot be disabled entirely - it's the mechanism by which the system learns and evolves.

---

## ADR-7: Content Protection

### Decision
Use two protection mechanisms:

1. **Marker-Based** (for AGENTS.md):
   - `<!-- EVOSKILLS_START -->` and `<!-- EVOSKILLS_END -->`
   - Contents within markers auto-regenerate
   - User content outside markers preserved

2. **Smart Append** (for copilot-instructions.md):
   - Create if missing
   - Append new sections without overwriting existing content
   - User customizations in `# Project-Specific Customizations` preserved

### Rationale
- Users can safely customize without breaking tool updates
- Clear markers indicate what's auto-managed
- append-only reduces accidental data loss
- Works across repeated init/update cycles

---

## ADR-8: Version Management

### Decision
- **Semantic Versioning**: MAJOR.MINOR.PATCH
- **Current**: 2.0.0 (major architectural refactoring)
- **Breaking Change**: Moved from single constitution to three-layer model
- **Deprecation**: v1.1.0 marked deprecated, users directed to 2.0.0

### Rationale
- Clear signaling of breaking changes
- Users understand upgrade implications
- Version number reflects scope of changes

---

## ADR-9: Internationalization

### Decision
- **Primary Language**: English (for international npm audiences)
- **Documentation**: All primary docs in English
- **Templates**: CLI templates in English
- **Skill Descriptions**: English in AGENTS.md

### Rationale
- npm ecosystem is English-first
- Easier for GitHub Copilot integration
- Broader international audience
- Can support localized docs in future without breaking core

---

## Related Documents

- [IMPLEMENTATION_CHECKLIST.md](IMPLEMENTATION_CHECKLIST.md) - Status of decisions
- [QUICK_DECISIONS.md](QUICK_DECISIONS.md) - Quick reference
- [AI_CONSTITUTION.md](../../.github/AI_CONSTITUTION.md) - Core principles
- [EXECUTION_RULES.md](../../.github/EXECUTION_RULES.md) - Optional rules
