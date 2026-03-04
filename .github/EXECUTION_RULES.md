# Execution Rules

> Optional rules that enforce safe and predictable AI behavior. Install with evoskills; can be deleted if not needed for your use case.

---

## Overview

These 4 rules form the guardrails for reliable AI execution. They are **auto-enforced by the core system** when enabled, but can be selectively disabled or removed if your workflow doesn't require them.

**Install Status**: These rules are auto-installed by `evoskills init`. To disable, remove this file's entry from `.github/copilot-instructions.md`.

---

## Rule 1: Instruction Guard (_instruction-guard)

**Purpose**: Ensure project context is always loaded before responding.

**When Active**: Before each response, if project instruction file (`.github/copilot-instructions.md`) is not in current context, read it immediately.

**Why**: Prevents deviations due to missing project-specific requirements.

---

## Rule 2: Context Acknowledgment (_context-ack)

**Purpose**: Enable users to quickly verify the AI is following correct rules.

**When Active**: Each response must follow specified output format:
- Fixed prefix at start
- Polite address line
- Main content
- Reference list at end (showing which files/rules were consulted)

**Why**: Makes compliance transparent and auditable.

---

## Rule 3: File Output Guard (_file-output-guard)

**Purpose**: Prevent accidental file overwrites and unsafe operations.

**When Active**:
- **Forbidden**: Using HERE documents for file creation (`cat > file << 'EOF'`)
- **Required**: Use `create_file` or `replace_string_in_file` tools only
- **Large Files**: Files >5KB must be segmented to same file to avoid session limits

**Why**: Ensures file operations are safe, traceable, and controllable.

---

## Rule 4: Session Safety (_session-safety)

**Purpose**: Prevent session failure due to excessive output.

**When Active**: When estimated output length exceeds 5KB:
- Segment processing or write to file instead
- Don't output overly long content in single response

**Why**: Protects conversation session from breaking.

---

## How These Rules Work Together

```
Rule 1 (_instruction-guard)
    ↓ [load context]
Rule 2 (_context-ack)
    ↓ [format response]
Rule 3 (_file-output-guard)
    ↓ [file operations safe]
Rule 4 (_session-safety)
    ↓ [output within limits]
✅ Safe, predictable, auditable execution
```

---

## When to Disable

You can safely remove this file's reference from `.github/copilot-instructions.md` if:

1. You're using the AI in personal projects with low risk tolerance
2. Your workflow doesn't need output format enforcement
3. You want maximum flexibility without guardrails

However, we recommend keeping at least **Rule 1** (_instruction-guard) enabled for project-based work.

---

## Relationship to Evolution

These rules are **separate from evolution**. Evolution (in AI_CONSTITUTION.md) happens automatically when triggers fire. These rules ensure safe execution during evolution and regular tasks.

Think of it this way:
- **Constitution** = "How the AI learns"
- **Execution Rules** = "How the AI operates safely"
- **Skills** = "What the AI does"

---

> **Version**: 1.0  
> **Install Source**: evoskills (auto-installed with `evoskills init`)  
> **Customization**: Can be extended in project-specific instruction files
