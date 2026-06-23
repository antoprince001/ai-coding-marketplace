#!/usr/bin/env bash
# PostToolUse hook: fires after Write, Edit, or MultiEdit tool calls.
# If the written file is a .sql file, outputs a directive for Claude to auto-lint it.

set -euo pipefail

INPUT="$(cat)"

FILE_PATH="$(printf '%s' "$INPUT" | jq -r '.tool_input.path // empty' 2>/dev/null)"

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

if [[ "${FILE_PATH,,}" == *.sql ]]; then
  printf 'The file "%s" is a SQL file. Please automatically call the mcp-server-sqlfluff lint_sql tool on its contents and report any violations (line, column, rule code, and description). If there are no violations, confirm the file is clean. Use the ansi dialect unless the file or project context specifies otherwise.' "$FILE_PATH"
fi

exit 0
