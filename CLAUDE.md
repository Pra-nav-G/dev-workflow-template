<!--
Steering file: the slides call it SteeringFile.md. Keep it named CLAUDE.md at the repo root so Claude Code reads it automatically.
Keep it short, specific, and about HOW, not what (epics say what).
Anti-patterns: pasting the whole spec in here · vague virtues ("write clean code") · rules nobody enforces.
-->
# Project: [Project Name]

## Purpose
[One paragraph, lifted from marketing-doc.md.]
Plan: see `build-plan.md`. Spec: see `marketing-doc.md`. Design system: see `design-system/`.

## Stack & conventions
- [Next.js 15, TypeScript strict, Tailwind] — tokens come from `/design-system/tokens.css` (Tailwind theme: `/design-system/tailwind.config.js`); component props and states in `/design-system/components.md`
- Never add a dependency without asking
- Prefer small, pure functions; no dead code
- File and branch naming: `s14-filter-by-tag`, components in PascalCase

## Commands
- Install: `npm ci`
- Dev: `npm run dev`
- Test: `npm test`
- Lint: `npm run lint`
- Design-token check: `bash scripts/check-design-tokens.sh`

## Definition of done
- Acceptance criteria in the story pass
- Uses design-system tokens; no bespoke styles
- Tests written and passing; lint clean
- Docs updated in the same PR

## Workflow
- One branch per story; story id in branch name and commit message ("S-14: filter list by tag")
- Never commit directly to `main`
- Start non-trivial work in plan mode and propose before building
- Record hard-to-reverse technical decisions in `docs/decisions/` (copy `0000-template.md`)
- New environment variables go in `.env.example` with a placeholder, never in code

## Before assuming, ask
- Anything touching auth, payments, or personal data
- Any story with an open question in `build-plan.md`
- Any change to the design system or shared data shapes

## Never
- Commit secrets or `.env` files
- Edit generated files
- Skip a gate (tests, lint, acceptance criteria)
- Add features that are not in `build-plan.md`

## Lessons learned (each correction becomes a rule; use /add-rule)
- [date] [what the agent got wrong] → [rule that prevents it]
