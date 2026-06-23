---
description: Parse SQL and explain the AST structure — tables, joins, filters, aggregations, and CTEs — in plain English.
allowed-tools: mcp__mcp-server-sqlfluff__parse_sql
---

Parse and explain the SQL structure for: $ARGUMENTS

## Instructions

1. Resolve the SQL source (file path or inline string) from `$ARGUMENTS`.
2. If `$ARGUMENTS` is empty, ask the user to paste SQL or provide a file path.
3. Call the `mcp-server-sqlfluff` `parse_sql` tool.
   - Infer the dialect from context if possible; otherwise default to `ansi`.
4. From the parse result, produce a plain-English explanation structured as follows:

### SQL Structure Report

**Statement type**: (SELECT / INSERT / UPDATE / DELETE / CREATE TABLE / WITH CTE / etc.)

**CTEs (if any)**:
- List each CTE by name with a one-sentence description of what it computes.

**Source tables**:
- List every table and alias referenced in FROM / JOIN clauses.

**Joins**:
- For each join: type (INNER / LEFT / RIGHT / FULL), tables involved, and join condition.

**Filter conditions** (WHERE / HAVING):
- Summarize each predicate in plain English.

**Aggregations**:
- List aggregate functions used (COUNT, SUM, AVG, MAX, MIN) and the columns they operate on.

**Output columns**:
- List the columns or expressions that appear in the SELECT list.

**Ordering / Limiting**:
- Note any ORDER BY, LIMIT, or OFFSET clauses.

5. End with a one-paragraph "What this query does" plain-English summary suitable for a non-technical stakeholder.
