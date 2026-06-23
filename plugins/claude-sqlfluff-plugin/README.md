# SQL Plugin for Claude Code

A Claude Code plugin that integrates [mcp-server-sqlfluff](https://github.com/antoprince001/mcp-server-sqlfluff) to give Claude SQL linting, fixing, and parsing capabilities via slash-command skills and an auto-lint hook.

## Prerequisites

- [Claude Code](https://claude.ai/code) installed
- [`uvx`](https://docs.astral.sh/uv/) available on your PATH (`brew install uv` or `pip install uv`)
- [`jq`](https://jqlang.github.io/jq/) available (`brew install jq`)

## Skills

| Command | What it does |
|---------|-------------|
| `/sql-lint <file or SQL>` | Lint SQL and report violations with line, column, rule code, and description |
| `/sql-fix <file or SQL>` | Auto-fix violations and show a unified diff before applying |
| `/sql-parse <file or SQL>` | Explain the SQL AST: CTEs, joins, filters, aggregations — in plain English |
| `/sql-review <file or SQL>` | Full report: parse → lint → fix → explain every change |

### Dialect support

All skills default to `ansi`. Append `using <dialect>` to override:

```
/sql-lint examples/multi_dialect.sql using bigquery
/sql-review examples/violations.sql using postgres
```

Supported dialects include: `ansi`, `postgres`, `bigquery`, `snowflake`, `mysql`, `tsql`, `sqlite`, `redshift`, `spark`, and [25 more](https://github.com/antoprince001/mcp-server-sqlfluff).

### Auto-lint hook

Whenever Claude writes or edits a `.sql` file, the `PostToolUse` hook automatically triggers and instructs Claude to lint the file and report any violations — no manual `/sql-lint` needed.

## Demo files

| File | Purpose |
|------|---------|
| `examples/clean.sql` | Zero-violation query — tests the "SQL is clean" path |
| `examples/violations.sql` | Deliberately broken SQL — exercises capitalisation, spacing, and comma rules |
| `examples/complex_cte.sql` | Multi-CTE query with RANK() window function — tests deep parse |
| `examples/multi_dialect.sql` | BigQuery-flavoured SQL — tests dialect parameter |

## Using this plugin in another project

Copy the `.claude/` directory and `.mcp.json` into your project root:

```bash
cp -r /path/to/Plugins_demo/.claude  /your/project/.claude
cp /path/to/Plugins_demo/.mcp.json   /your/project/.mcp.json
```

Then update the absolute path in `.claude/settings.json` to point to the hook script in your project:

```json
"command": "bash /your/project/.claude/hooks/post-sql-write.sh"
```

Open Claude Code in your project — the MCP server starts automatically and the skills are immediately available.

### Tip: global installation

To make the skills available in every project without copying files, add the MCP server to your user-level Claude Code config (`~/.claude/settings.json`) and place the skill files under `~/.claude/skills/`.

## File structure

```
.
├── .mcp.json                        # Registers mcp-server-sqlfluff via uvx
├── .claude/
│   ├── settings.json                # Enables MCP server + PostToolUse hook
│   ├── skills/
│   │   ├── sql-lint/SKILL.md        # /sql-lint
│   │   ├── sql-fix/SKILL.md         # /sql-fix
│   │   ├── sql-parse/SKILL.md       # /sql-parse
│   │   └── sql-review/SKILL.md      # /sql-review
│   └── hooks/
│       └── post-sql-write.sh        # Auto-lint on .sql file write
└── examples/
    ├── clean.sql
    ├── violations.sql
    ├── complex_cte.sql
    └── multi_dialect.sql
```
