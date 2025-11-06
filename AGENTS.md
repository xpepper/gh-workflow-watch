# AGENTS.md

## Project Overview
This is a GitHub CLI extension (written in Bash) that watches GitHub Actions workflow runs by name, file path, or interactive selection from running workflows. The entire extension is a single executable script `gh-workflow-watch` (no file extension) that acts as a wrapper around `gh run list` and `gh run watch`.

## Architecture & Key Files
- **Extension naming convention**: File is named `gh-workflow-watch` (with hyphen). When installed, it's invoked as `gh workflow-watch` (space replaces hyphen per GitHub CLI convention).

## Development Workflow
### Testing locally
```bash
# Install extension from local directory
gh extension install /path/to/gh-workflow-watch

# Or upgrade if already installed
gh extension upgrade workflow-watch

# Test it
gh workflow-watch --help
gh workflow-watch <workflow-name>
```

### Development Rules
- Before committing, run `make test` to ensure all tests pass.
- Use conventional commit messages (e.g., `feat:`, `refactor:`, `fix:`, `docs:`) to categorize changes.
  - Use `refactor:` for structural changes that do not add features or fix bugs.
  - Use `feat:` for behavioral changes or new features.
  - Use `style:` for formatting changes.
  - Use `test:` for adding or modifying tests.
  - Use `fix:` for bug fixes.
  - Use `docs:` for documentation updates.
  - Use `chore:` for changes to configuration files and scripts.
- Try to not mix in the same commit two different types of changes (e.g., refactorings and feats), as this makes it harder to review and understand the changes, and to assess the risk related to releasing them.
- Prefer creating a focused pull request (PR) instead of pushing directly to the main branch.
- Always update the README and this file when adding features or changing behavior.
- Don't forget to update the version in the script header when releasing a new version.

### Script execution requirements
- Depends on `gh` CLI being installed and authenticated
- Uses `jq` for JSON parsing (via `--jq` flag in `gh` commands)

## Code Patterns & Conventions
### Environment variable support
- Respects `GH_REPO` environment variable as default repository
- Command-line `-R` flag overrides `GH_REPO`

### GitHub CLI integration
Key `gh` commands used:
```bash
# Fetch latest run ID for a workflow
gh run list -w "$workflow_name" -L 1 --json databaseId --jq '.[0].databaseId'

# Watch a specific run
gh run watch "$run_id" --exit-status

# Resolve workflow file path to workflow name
gh workflow list --json id,name,path --jq ".[] | select(.path == \"$workflow_file\") | .name"
```

## Implementation Guidelines
- **Shell quoting**: Always quote variables (`"$var"`) except when intentionally word-splitting
- **Array expansion**: Use `"${array[@]}"` for proper handling of optional flags
- **Error messages**: Write to stderr with helpful context about what went wrong
- **Exit codes**: Use `--exit-status` flag pattern to propagate workflow failure status
- **JSON handling**: Prefer `--json` + `--jq` over fragile text parsing when calling `gh`

## Feature Development Notes
See `TODO.md` for planned features. When adding features:
- Maintain backward compatibility with existing flag interface
- Follow existing pattern of optional array-based flags
- Add new options to help text in `print_usage()` function
- Keep the single-file architecture (don't split into modules)
