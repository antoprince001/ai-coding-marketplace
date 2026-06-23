---
description: Lint a SQL file or snippet and report violations with line, column, rule code, and description.
allowed-tools: mcp__mcp-server-sqlfluff__lint_sql
---

Lint the following SQL for style and correctness violations: $ARGUMENTS

## Instructions

1. If `$ARGUMENTS` is a file path ending in `.sql`, read the file contents first, then lint them.
2. If `$ARGUMENTS` is an inline SQL string, lint it directly.
3. If `$ARGUMENTS` is empty, ask the user to either paste a SQL snippet or provide a file path.
4. Call the `mcp-server-sqlfluff` `lint_sql` tool with the SQL content.
   - Default dialect: `ansi`
   - If the user specifies a dialect (e.g. "using postgres"), pass it as the `dialect` argument.
5. Present results as a formatted table:

| Line | Col | Code | Severity | Description |
|------|-----|------|----------|-------------|

6. If there are zero violations, output: "No violations found. SQL is clean."
7. After the results, give a one-sentence summary: total violation count and the most frequent rule code.
