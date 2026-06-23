---
description: Auto-fix SQL style violations and show a diff before applying changes.
allowed-tools: mcp__mcp-server-sqlfluff__lint_sql, mcp__mcp-server-sqlfluff__fix_sql
---

Fix SQL style violations in: $ARGUMENTS

## Instructions

1. Resolve the SQL source (file path or inline string) from `$ARGUMENTS` the same way as `/sql-lint`.
2. First call `lint_sql` to capture the original violations list.
3. Then call `fix_sql` to get the corrected SQL.
4. Present a unified diff between the original and the fixed SQL:
   - Use `---` for removed lines (original)
   - Use `+++` for added lines (fixed)
   - Wrap the diff in a fenced code block with language tag `diff`
5. After the diff, list which rule codes were resolved.
6. If `$ARGUMENTS` referred to a file, ask the user: "Apply these fixes and overwrite the file? (yes/no)"
   - If yes: write the fixed SQL back to the file.
   - If no: display the fixed SQL in a code block so the user can copy it.
7. If no fixes were needed, output: "No fixes required. SQL is already clean."
