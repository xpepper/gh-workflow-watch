# gh-workflow-watch Roadmap

## Potential Features

### High Priority
- [x] Filter by branch: Add option to watch workflows on a specific branch
- [ ] Custom polling interval: Allow users to set how frequently the script polls for updates
- [ ] Notification support: Send desktop notifications when workflow completes

### Medium Priority
- [ ] Watch by workflow file path: Allow watching workflows by file path (e.g., `.github/workflows/ci.yml`) instead of just by name
- [ ] Filter by event type: Filter to watch only workflows triggered by specific events (push, pull_request, etc.)
- [ ] Watch multiple workflows: Allow watching multiple workflows simultaneously
- [ ] Progress summary: Show more detailed progress information during watching

### Low Priority
- [ ] Workflow run history: Show recent run history before watching
- [ ] JSON output mode: Add a flag for machine-readable output
- [ ] Watch by workflow ID: Allow specifying workflow by numeric ID instead of name
- [ ] Auto-refresh on failure: Option to automatically restart watching if a workflow fails
- [ ] Cancel watching: Allow users to cancel watching with a specific key combination