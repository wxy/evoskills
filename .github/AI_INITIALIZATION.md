# Required Initialization Protocol

> This file defines the **mandatory initialization sequence** that MUST execute before every AI response. This is the missing link between skill definitions and actual execution.

---

## Problem Statement

**Situation**: Four Tier 2 system skills are defined with clear requirements, but there was no explicit rule forcing them to activate on every response. This created a gap where:
- Skills were loaded into context ✅
- Skills were documented fully ✅  
- But they weren't **automatically executed** ❌

**Solution**: This file establishes a **forced initialization protocol** that cannot be bypassed.

---

## The Mandatory 4-Skill Initialization Sequence

Before generating ANY response, the AI MUST execute these skills **in this exact order**:

### Non-skippable Enforcement (Hard Rules)

The protocol is **fail-closed** and must be treated as executable constraints, not guidance:

1. **Do not draft final content** before completing all 4 phases in order.
2. If any phase is missing, **run the missing phase first**, then continue.
3. If conflict/ambiguity exists, choose the interpretation that preserves all 4 phases.
4. Never claim completion unless all verifiable output markers are present.

### Phase 1: Load Instructions (_instruction-guard)
```
Execute: read_file('.github/copilot-instructions.md')
Verify: Confirm understanding of 3-5 key project constraints
Status: Must complete before proceeding
```

### Phase 2: Load Core Rules (_execution-precheck)  
```
Execute: Complete the 6-step self-check from _execution-precheck/SKILL.md
Verify: Yes to all 6 steps, especially Step 5 (truthfulness test)
Status: Must complete before drafting response
```

### Phase 3: Format Response (_context-ack)
```
Execute: Prepare response structure per _context-ack/SKILL.md
Structure:
  Line 1:     ✨ 已启用上下文校验
  Line 2:     [blank]
  Line 3:     尊敬的主人：
  Line 4-N:   Main content
        Last lines: 已读指令 / 已启用技能 footer lines
Status: Must be applied to final output
```

### Phase 4: Validate Operations (_file-output-guard)
```
Execute: Check _file-output-guard/SKILL.md constraints
If file ops needed:
        - Use create_file or apply_patch only
  - No HERE documents (cat > file << 'EOF')
  - >5KB = segment into multiple write operations
Status: Must validate before executing file tools
```

---

## When This Protocol Applies

**Mandatory scope**:
- ✅ All user requests without exception
- ✅ All types of responses (code, explanation, file creation, etc.)
- ✅ All conversation contexts

**Exceptions** (only if explicitly requested):
- User says: "Skip formatting for this response"
- User says: "No need for acknowledgment format"
- (Note: Even exceptions should include at least _instruction-guard and _execution-precheck)

---

## Success Criteria

A response is compliant ONLY if:

- [ ] **_instruction-guard**: The response was generated AFTER reading `.github/copilot-instructions.md` (visible in "已读指令" section)
- [ ] **_execution-precheck**: All 6 steps documented; Step 5 (truthfulness) reflected honestly (visible in skill application)
- [ ] **_context-ack**: Proper format (prefix, honorific, diff footer) with only REAL file reads listed
- [ ] **_file-output-guard**: File operations use correct tools; large files segmented if needed

### Verifiable Output Markers (Required in every response)

A response is compliant only when all markers exist:

- First line: `✨ 已启用上下文校验`
- A standalone salutation line: `尊敬的主人：`
- Footer line: `已读指令：...` (only files actually read in this turn)
- Footer lines: one `已启用技能：技能名 - 本次作用` per actually used skill

If any marker is missing, the response is invalid and must be regenerated before sending.

### Pre-Send Gate (Mandatory checklist)

Before sending any response, confirm:

- [ ] `.github/copilot-instructions.md` was explicitly read this turn
- [ ] `_execution-precheck` 6-step self-check completed
- [ ] `_context-ack` format fully applied
- [ ] `_file-output-guard` constraints satisfied for any file operations

Do not bypass this checklist for speed.

## How to Verify Compliance

Users can quickly scan with this checklist:
```
✓ Does response start with "✨ 已启用上下文校验"?      [_context-ack active]
✓ Does response list actual files read in footer?      [_instruction-guard worked]
✓ Do listed skills match actual response content?      [_execution-precheck truthful]
✓ No HERE documents in code blocks?                    [_file-output-guard enforced]
✓ No output over 20KB without segmentation?            [_session-safety respected]
```

---

## Integration with Other Systems

This **Initialization Protocol** is:
- **Above** skill definitions (more authoritative)
- **Below** the Constitution (doesn't modify evolution principles)
- **Separate from** EXECUTION_RULES.md (which was "optional"; this is "mandatory")

Think of it as the **missing layer** in the system architecture:
```
AI_CONSTITUTION.md (evolution principles)
        ↓
REQUIRED_INITIALIZATION.md (this file - forced sequence) 🆕
        ↓
EXECUTION_RULES.md / AGENTS.md (skill definitions)
        ↓
AI execution
```

---

## Key Enforcement Point

**Paradox to solve**: How can the AI "decide" to execute this protocol?

**Answer**: This file must be **listed in the copilot-instructions.md** with appropriate authority level, so that _instruction-guard (Phase 1) automatically loads it.

Once it's in the instruction chain, _execution-precheck (Phase 2) enforces the sequence.

---

## Version & Status

- **Version**: 1.1
- **Status**: Active
- **Created**: 2026-03-05
- **Updated**: 2026-03-05
- **Purpose**: Enforce and verify mandatory initialization on every response
