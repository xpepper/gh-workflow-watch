# gh-workflow-watch

Watch latest GitHub Actions workflow run by workflow name.

Usage:
  gh workflow-watch [-R owner/repo] [--branch branch-name] [--exit-status] <workflow-name>

Examples:
  gh workflow-watch build
  gh workflow-watch -R cli/cli test
  gh workflow-watch --branch develop build

Installation (local):
  gh extension install /path/to/gh-workflow-watch

License: MIT
