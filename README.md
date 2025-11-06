# gh-workflow-watch

Watch latest GitHub Actions workflow run by workflow name, file path, or interactively select from running workflows.

Usage:
  gh workflow-watch [-R owner/repo] [--branch branch-name] [--file workflow-file] [--exit-status] [--notify] [<workflow-name>]

Examples:
  gh workflow-watch build
  gh workflow-watch -R cli/cli test
  gh workflow-watch --branch develop build
  gh workflow-watch --file .github/workflows/ci.yml
  gh workflow-watch -R owner/repo # Interactive selection of running workflows
  gh workflow-watch --notify build # Get desktop notification when workflow completes

Installation (local):
  gh extension install /path/to/gh-workflow-watch

License: MIT
