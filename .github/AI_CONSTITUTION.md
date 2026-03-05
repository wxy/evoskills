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

## Core Evolution Infrastructure

The AI evolution mechanism relies on **two core skills** that are always active and non-negotiable:

### 1. **_evolution-core** (Tier 1)
- **Purpose**: Identifies improvement opportunities in code, processes, and workflows
- **Responsibility**: Pattern recognition, root cause analysis, and improvement proposal
- **Activation**: Triggered by errors, user feedback, or complex workflows
- **Output**: Constitutional updates, new skills, or instruction refinements
- **Critical**: This is the system's learning mechanism - without it, evolution cannot happen

### 2. **_skills-manager** (Tier 1)
- **Purpose**: Manages the complete skill lifecycle (init, install, remove, update)
- **Responsibility**: Skill registry maintenance, dependency tracking, skill contributions
- **Activation**: Triggered when new skills are created, modified, or removed
- **Output**: Updated AGENTS.md, skill documentation, registry consistency
- **Critical**: This is the system's knowledge infrastructure - without it, skills cannot be discovered or maintained

### How They Work Together

**Evolution Loop** in the AI system:

```
Error/Feedback → _evolution-core detects pattern
                       ↓
                Creates/improves skill
                       ↓
              _skills-manager registers it
                       ↓
         Skill becomes available for AI use
                       ↓
            Subsequent sessions benefit
```

These two skills form the **evolutionary backbone** of the system. All other skills exist to enhance specific workflows, but these two core skills enable the entire evolution mechanism itself.

---

## Skill Modularity Principle

**Key design decisions:**

- **Skills are self-contained**: Each skill defines its own triggers, dependencies, and constraints internally
- **Constitution doesn't maintain dependency tables**: This allows new skills to be added without modifying the constitution
- **Dynamic extensibility**: New skills integrate automatically through internal declarations
- **Skill autonomy**: Skills are independent and can be maintained separately

When creating skill `_my-skill`, you only need to declare its tier and dependencies in the skill's metadata - no constitution modification needed.

---

## Mandatory Initialization Binding

The constitution defines **why** evolution and discipline are required.
The initialization protocol defines **how** every response is enforced.

### Authority and layering

1. **Constitution** (`.github/AI_CONSTITUTION.md`): immutable evolution principles
2. **Initialization protocol** (`.github/AI_INITIALIZATION.md`): mandatory 4-phase execution contract
3. **Instruction entrypoint** (`.github/copilot-instructions.md`): active loading and per-response gate
4. **Skill definitions** (`.agent/skills/*/SKILL.md`): implementation details

### Compliance contract

- A response is valid only when it satisfies all required initialization markers and checks.
- If any required phase is missing, execution must stop and resume from the missing phase.
- Evolution outputs (new rules/skills) must remain compatible with this enforcement chain.

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
> **Related Files**: `.github/AI_INITIALIZATION.md`, `.github/copilot-instructions.md`, `AGENTS.md`
