# AGENTS

<!-- EVOSKILLS_START -->
<skills_system priority="1">

## Available Skills (evoskills)

<!--
SKILLS_TABLE_START -->
<usage>
When users ask you to perform tasks, check if any of the
available skills below can help complete the task more effectively. Skills provide
specialized capabilities and domain knowledge.

How to use skills:
- Invoke: Bash("npx openskills read <skill-name>")
- The skill content will load with detailed instructions on how to complete the task
- Base directory provided in output for resolving bundled resources (references/, scripts/, assets/)

Usage notes:
- Only use skills listed in <available_skills> below
- Do not invoke a skill that is already loaded in your context
- Each skill invocation is stateless
</usage>

<available_skills>

<!-- Core Skills (6) -->
<skill>
<name>_instruction-guard</name>
<description>Read and apply directives before processing each request. Enforces instruction hierarchy and prevents instruction conflicts.</description>
<location>project</location>
</skill>

<skill>
<name>_context-ack</name>
<description>Format responses with clear headers, footers, and reference lists. Ensures proper context acknowledgment and response structure.</description>
<location>project</location>
</skill>

<skill>
<name>_file-output-guard</name>
<description>Validate and safeguard all file creation operations. Prevents unsafe file creation patterns, HERE documents, and unauthorized modifications.</description>
<location>project</location>
</skill>

<skill>
<name>_execution-precheck</name>
<description>Validate dependencies and runtime requirements before executing commands. Ensures all prerequisites are met before task execution.</description>
<location>project</location>
</skill>

<skill>
<name>_evolution-core</name>
<description>Identify improvement opportunities and patterns in code and processes. Proposes enhancements based on architectural patterns and best practices.</description>
<location>project</location>
</skill>

<skill>
<name>_skills-manager</name>
<description>Core skill manager for evoskills. Handles skill lifecycle (init, install, remove, update) and skill contributions.</description>
<location>project</location>
</skill>

<!-- Optional Skills (8) -->
<skill>
<name>_git-commit</name>
<description>Implement conventional commits workflow. Ensures proper commit message formatting and semantic versioning compliance.</description>
<location>project</location>
</skill>

<skill>
<name>_pr-creator</name>
<description>Automate PR generation with version detection and release notes. Streamlines contributions and version management.</description>
<location>project</location>
</skill>

<skill>
<name>_release-process</name>
<description>Execute complete release workflow. Coordinates versioning, tagging, and publication of releases.</description>
<location>project</location>
</skill>

<skill>
<name>_code-health-check</name>
<description>Perform quality checks before commit. Validates code standards, security, and architectural consistency.</description>
<location>project</location>
</skill>

<skill>
<name>_typescript-type-safety</name>
<description>Enforce TypeScript type safety guidelines. Ensures proper typing and prevents type-related runtime errors.</description>
<location>project</location>
</skill>

<skill>
<name>_change-summary</name>
<description>Summarize completed work sessions. Provides concise summaries of changes and progress made.</description>
<location>project</location>
</skill>

<skill>
<name>_traceability-check</name>
<description>Ensure all decisions are properly documented. Validates decision traceability and documentation completeness.</description>
<location>project</location>
</skill>

<skill>
<name>_session-safety</name>
<description>Prevent state violations and session inconsistencies. Maintains context integrity and prevents conflicting actions.</description>
<location>project</location>
</skill>

</available_skills>
<!--
SKILLS_TABLE_END -->

</skills_system>
<!-- EVOSKILLS_END -->
