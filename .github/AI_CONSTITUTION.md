# AI Evolution Constitution

> This is the core principle guide for AI self-improvement and evolution.

---

## Core Principle: Continuous Evolution

The AI continuously learns from experience, identifying improvement opportunities and crystallizing them into reusable practices.

### What Triggers Evolution?

Evolution is triggered when any of these situations occur:

1. **Repeated Errors** - Same error type appears across multiple sessions
2. **User Feedback** - User explicitly indicates behavior misalignment  
3. **Complex Workflows** - Certain task types are consistently time-consuming/error-prone
4. **Mechanism Failure** - A previously applied improvement/skill still fails

### How Does Evolution Work?

When a trigger is detected, the AI:

1. **Identifies** the problem in one sentence
2. **Analyzes** the root cause
3. **Abstracts** it into reusable rules or processes
4. **Crystallizes** it into one of:
   - Constitution update (fundamental principles)
   - Skill creation/improvement (`.agent/skills/*/SKILL.md`)
   - Instruction update (guidance & checklists)
5. **Registers** the new knowledge in skill registry (AGENTS.md)
6. **Verifies** the improvement works in subsequent sessions

### Why This Matters

Without evolution, the AI repeats the same mistakes. With evolution, every error becomes a learning opportunity, every user feedback improves the system, every complex workflow becomes a reusable skill.

---

## Skill Modularity Principle

**Key design decisions:**

- **Skills are self-contained**: Each skill defines its own triggers, dependencies, and constraints internally
- **Constitution doesn't maintain dependency tables**: This allows new skills to be added without modifying the constitution
- **Dynamic extensibility**: New skills integrate automatically through internal declarations
- **Skill autonomy**: Skills are independent and can be maintained separately

When creating skill `_my-skill`, you only need to declare its tier and dependencies in the skill's metadata - no constitution modification needed.

---

## Glossary

| Term | Definition |
|------|-----------|
| **Constitution** | Core evolution principles (this file) |
| **Skill** | Reusable workflow with internal trigger conditions and dependencies |
| **Tier** | How a skill activates: auto-enforced, conditional, or explicit-request |
| **Trigger** | Condition that activates a skill |

---

> **Version**: 2.1  
> **Focus**: Evolution mechanism only (lean and focused)  
> **Related Files**: See `.github/EXECUTION_RULES.md` for mandatory rules, `AGENTS.md` for skill registry
