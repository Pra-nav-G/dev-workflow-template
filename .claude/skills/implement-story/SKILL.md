---
name: implement-story
description: Implement one story from build-plan.md end to end — branch, build against acceptance criteria using the design system, test, update docs, and prepare the PR. Use when asked to "implement S-xx" or "build the next story".
---

# Implement a story

Input: a story id (e.g. `S-14`). If none is given, pick the next unfinished story in dependency order from `build-plan.md` and confirm it with the user.

## Steps

1. **Read** the story in `build-plan.md`: acceptance criteria, screens, dependencies, open questions. Read the matching screens in `design-plan.md`.
2. **Stop and ask** if the story has an open question or touches auth, payments, or personal data.
3. **Plan** briefly: files to touch, tokens/components to use, tests to write. Share the plan before coding.
4. **Branch:** `git switch -c s<id>-<short-name>`.
5. **Build** only what the acceptance criteria require. Use tokens from `design-system/tokens.css` and existing components. No new dependencies without asking.
6. **Test:** write tests for each acceptance criterion. Run lint and tests until clean.
7. **Update docs** in the same change: tick tasks and status in `build-plan.md`, add any new rule to `CLAUDE.md` (lessons learned).
8. **Commit** in small steps: `S-<id>: <plain description>`.
9. **Prepare the PR** using `.github/pull_request_template.md`, with the acceptance criteria as a checked list and a note of anything uncertain.
10. **Report:** one short summary — what was built, what was cut or deferred, what to review first.

## Done means
All acceptance criteria pass, design system used, tests and lint green, docs updated, no code that wasn't asked for.
