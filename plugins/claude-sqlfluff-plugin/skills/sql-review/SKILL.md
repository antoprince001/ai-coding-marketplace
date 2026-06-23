---
description: Comprehensive SQL review — parse structure, lint violations, auto-fix, and explain every change with a summary table.
allowed-tools: mcp__mcp-server-sqlfluff__parse_sql, mcp__mcp-server-sqlfluff__lint_sql, mcp__mcp-server-sqlfluff__fix_sql
---

Perform a comprehensive review of the SQL in: $ARGUMENTS

## Instructions

Execute the following four phases in order. Do not skip a phase even if the previous phase finds no issues.

### Phase 1 — Parse

Call `parse_sql` on the SQL content. Produce a condensed structural report:
- Statement type
- Tables referenced
- Join types and conditions
- Filter predicates
- Aggregate functions
- Output columns

### Phase 2 — Lint

Call `lint_sql` on the SQL content. Present violations as a table (Line / Col / Code / Severity / Description).
Classify violations by category:
- **Formatting**: indentation, spacing, capitalisation (L0xx series)
- **Structure**: aliasing, quoting, references
- **Best practices**: ambiguous columns, trailing commas, etc.

### Phase 3 — Fix

Call `fix_sql` on the SQL content. Show the unified diff (original vs. fixed) in a `diff` code block.
List which rule codes were automatically resolved.

### Phase 4 — Explanation

Write a plain-English explanation of every change made:
- For each diff hunk, explain *why* the change improves the SQL (which convention or best practice it satisfies).
- Note any violations found in Phase 2 that could NOT be auto-fixed, and explain what manual action is required.

### Final Summary

| Metric | Value |
|--------|-------|
| Total violations found | N |
| Violations auto-fixed | N |
| Violations requiring manual fix | N |
| Statement type | ... |
| Tables referenced | ... |

If `$ARGUMENTS` is a file path, ask whether to apply the fixes to the file.
