# Git workflow rules

- Work on a branch named after the story: `s14-filter-by-tag`. Never commit to `main`.
- Commit small and often. Message format: `S-14: filter list by tag` (story id + plain description). Never "fixes" or "wip".
- Include doc updates (`build-plan.md`, `CLAUDE.md`, `marketing-doc.md`) in the same commit/PR as the code change they describe.
- Before opening a PR, run lint and tests and show the results.
- PR description must carry the story's acceptance criteria as a checklist (use `.github/pull_request_template.md`).
- Never stage `.env`, keys, or credentials. If one is found, stop and tell the user.
- Do not force-push. Do not rewrite shared history.
- Summarize what changed and what you were unsure about at the end of every story.
