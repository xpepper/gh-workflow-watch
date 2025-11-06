# gh-workflow-watch

Watch latest GitHub Actions workflow run by workflow name or file path.

Usage:
  gh workflow-watch [-R owner/repo] [--branch branch-name] [--file workflow-file] [--exit-status] <workflow-name>

Examples:
  gh workflow-watch build
  gh workflow-watch -R cli/cli test
  gh workflow-watch --branch develop build
  gh workflow-watch --file .github/workflows/ci.yml

Installation (local):
  gh extension install /path/to/gh-workflow-watch

License: MIT
