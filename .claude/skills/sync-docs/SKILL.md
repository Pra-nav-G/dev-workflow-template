---
name: sync-docs
description: Propagate a scope or product change from marketing-doc.md (the source of truth) to design-plan.md, build-plan.md and CLAUDE.md, so every file tells the same story. Run with /sync-docs and a description of the change.
argument-hint: [the change, e.g. "drop the team plan; focus on solo students"]
disable-model-invocation: true
---

# Sync the docs from the source of truth

The change: $ARGUMENTS
(If empty, compare `marketing-doc.md` against the other docs and find where they disagree.)

Every change starts at the source of truth and flows downstream. Never change a downstream file in a way `marketing-doc.md` doesn't support.

## Steps

1. **Branch:** `git switch -c docs-<short-name>`.
2. **Source first.** Update `marketing-doc.md`:
   - the affected sections (positioning, gates, non-goals, Lean Canvas)
   - a row in §9 Decision log: date, decision, why, which files change
   - if the change touches a ranked assumption or kill criterion, update §7
3. **Find the ripple.** For each downstream file, list what's now out of date:
   - `design-plan.md`: narrative, tone, screen inventory, real copy, out-of-scope list
   - `build-plan.md`: non-goals, epics, stories, acceptance criteria, build order, traceability matrix, roadmap
   - `CLAUDE.md`: purpose paragraph, "before assuming, ask", "never"
   - `design-system/`: only if the change affects the system. Propose it; don't edit it (it's a governed package).
4. **Show the list** to the user before editing. Flag any story already built or in progress that the change affects.
5. **Edit** the downstream files. Keep traceability intact: every story still references screens and every screen still maps to a story. Mark removed stories as `Cut — see decision log [date]` rather than deleting them silently.
6. **Check consistency:** non-goals match across all three files; no story contradicts the marketing doc; no screen is orphaned.
7. **Commit** all doc changes together, e.g. `docs: narrow scope to solo students`, and open a PR that summarises the change and lists affected stories.
