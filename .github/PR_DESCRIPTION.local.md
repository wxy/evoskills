# v2.0.0 Release Preparation: Three-Layer Architecture & Documentation Updates

## Summary

This PR completes v2.0.0 development with major architectural refactoring and comprehensive documentation updates. The release implements a three-layer model (Constitution → Execution Rules → Skills) for improved clarity and flexibility.

## Changes

### Documentation Updates
- **CHANGELOG.md**: Comprehensive changelog for v2.0.0 with breaking changes, features, and testing results
- **docs/ARCHITECTURE_DECISIONS.md**: 9 Architecture Decision Records (ADRs) documenting key design decisions
- **docs/QUICK_DECISIONS.md**: Quick reference guide for v2.0.0 design choices
- **docs/IMPLEMENTATION_CHECKLIST.md**: Complete implementation status (all phases complete)
- **docs/cli-usage.md**: Updated with correct package name (@xingyu.wang/evoskills)
- **AI_INTEGRATION_INSTRUCTIONS.md**: Updated package references

### Architecture Refactoring
- **Three-Layer Model Implementation**:
  - Layer 1: `.github/AI_CONSTITUTION.md` (66 lines, evolution principles)
  - Layer 2: `.github/EXECUTION_RULES.md` (105 lines, 4 optional safety rules)
  - Layer 3: `.agent/skills/` (14 skills: 5 core + 9 optional)

- **Project Structure**: 
  - Move skills from `skills/` → `.agent/skills/` (self-bootstrapping)
  - Add `package.json` for npm distribution
  - Create `AGENTS.md` (openskills compatible skill registry)
  - Create `evoskills` CLI v2.0.0 with unified update/init commands

- **Cleanup**:
  - Remove deprecated directories: `constitution/`, `scripts/`, `templates/`
  - Remove `version.txt` (consolidated into package.json)

### Package Publishing
- **npm Registry**: `@xingyu.wang/evoskills` v2.0.0
- **Documentation**: All core files translated to English
- **Compatibility**: openskills compatible, Node.js >=18 required

## Testing & Verification

✅ **Installation Test**: Verified in clean environment
- Command: `npm install @xingyu.wang/evoskills@latest`
- Result: Successfully installed v2.0.0

✅ **CLI Functionality**: All commands tested
- `evoskills --version` → eVO skills version 2.0.0
- `evoskills list` → All 14 skills enumerated

✅ **Deprecation**: v1.1.0 marked deprecated on npm

## Breaking Changes

This is a **MAJOR version** release with breaking changes from v1.1.0:

1. **Three-Layer Architecture**: Constitution now separate from optional execution rules
2. **Skills Location**: Moved to `.agent/skills/` with self-hosting structure
3. **Mandatory Evolution**: `_evolution-core` cannot be disabled (by design)
4. **Optional Rules**: Execution rules can be deleted if not needed

**Migration Guide**: Users upgrading from v1.1.0 should:
1. `npm install -g @xingyu.wang/evoskills@2.0.0 --force`
2. Run `evoskills init` in projects to re-initialize with new structure

## Recommended Review Checklist

- [ ] CHANGELOG.md captures all major changes
- [ ] ARCHITECTURE_DECISIONS.md clearly explains the three-layer model
- [ ] docs/ are comprehensive and accurate
- [ ] No references to old package name (@wxy/evoskills) remain
- [ ] evoskills CLI works as described
- [ ] AGENTS.md properly lists all 14 skills

## Commit Summary

- `docs(v2.0.0)`: Comprehensive documentation update
- `refactor: three-layer architecture v2.0.0`: Major architecture refactoring

---

**Reviewed by**: _pr-creator skill v1.0.0
**Generated**: 2026-03-04
