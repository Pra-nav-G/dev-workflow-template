---
name: implement-story
description: Implement one story from build-plan.md end to end — branch, build against acceptance criteria test-first using the design system, verify, review, update docs, and prepare the PR. Use when asked to "implement S-xx" or "build the next story".
argument-hint: [story id, e.g. S-14]
---

# Implement a story

Input: a story id (e.g. `S-14`): $ARGUMENTS. If none is given, pick the next unfinished story in dependency order from `build-plan.md` and confirm it with the user.

## Steps

1. **Read** the story in `build-plan.md`: acceptance criteria, screens, dependencies, open questions. Read the matching screens in `design-plan.md`.
2. **Resolve ambiguity first.** If the story has open questions or vague acceptance criteria, run the grill-me approach (one question at a time, with a recommended answer) and update the story before coding. Stop and ask if it touches auth, payments, or personal data.
3. **Plan** briefly: files to touch, tokens/components to use, and the test for each AC. Share the plan before coding.
4. **Branch:** `git switch -c s<id>-<short-name>`.
5. **Build test-first** with the tdd skill: for each AC, a failing test, then the minimum code, then refactor. Use tokens from `design-system/tokens.css` and the components (with all their states) specified in `design-system/components.md`. No new dependencies without asking.
6. **If something breaks** in a way that isn't obvious, use the debug skill: root cause before any fix.
7. **Security:** if the story touches auth, payments, personal data, file uploads or user-generated content, have the `security-reviewer` subagent review the branch and fix what it finds.
8. **Update docs** in the same change: tick tasks and status in `build-plan.md`; record hard-to-reverse technical choices in `docs/decisions/`; if you were corrected during the story, turn it into a rule with the add-rule skill.
9. **Verify** with the verify skill: lint, tests, token check and build run fresh, each AC mapped to a passing test, diff checked. Don't skip this.
10. **Commit** in small steps: `S-<id>: <plain description>`.
11. **Prepare the PR** using `.github/pull_request_template.md`, with the acceptance criteria as a checked list, the AC-to-test mapping, and a note of anything uncertain. Suggest running the `reviewer` subagent before merging.
12. **Report:** one short summary: what was built, the verification evidence, what was cut or deferred, what to review first.

## Done means
All acceptance criteria pass with tests written first, design system used, lint/tests/token check green with output shown, security reviewed where needed, docs updated, no code that wasn't asked for.
