# Start Here: Think → Design → Build Template

From the talk "Think First, Then Build". Every step produces a file the next step consumes. The files are the method.

## The flow
```
Claude Chat   → marketing-doc.md ──┬→ design-plan.md → Claude Design → design-system/tokens.css
(question funnel + red-team)       └→ build-plan.md + CLAUDE.md ─────→ Claude Code → repo
```

## What's in this repo
```
├── START-HERE.md                  ← you are here (delete in your project if you like)
├── README.md                      ← project README template (fill in)
├── marketing-doc.md               ← source of truth
├── design-plan.md                 ← feed to Claude Design
├── build-plan.md                  ← epics, stories, acceptance criteria
├── CLAUDE.md                      ← steering file for Claude Code
├── .gitignore                     ← .env excluded from day one
├── design-system/tokens.css       ← replace with your Claude Design export
├── .github/
│   ├── pull_request_template.md
│   └── workflows/ci.yml
├── .claude/
│   ├── settings.json              ← permissions + hook wiring
│   ├── rules/                     ← git-workflow.md, design-system.md
│   ├── skills/implement-story/SKILL.md
│   ├── agents/reviewer.md
│   └── hooks/block-secrets.sh
└── playbook/                      ← reusable guides (delete in your project if you like)
    ├── prompts.md                 ← every prompt from the talk
    ├── question-worksheet.md      ← the 5-gate, 25-question funnel
    ├── red-team-prompts.md        ← pre-mortem, assumptions, kill criteria, buyer attack
    └── team-and-habits.md         ← roles, git habits, reviewer checklist, 48h plan
```

## How to use it on a new project
1. Click **Use this template** → **Create a new repository**, then clone it.
2. **Think:** open Claude Chat, use the opening prompt in `playbook/prompts.md`, run the question worksheet, then the red-team prompts. Paste the results into `marketing-doc.md`.
3. **Handoff:** have Claude Chat derive `design-plan.md`, `build-plan.md`, and `CLAUDE.md` from `marketing-doc.md`. Replace the template versions.
4. **Design:** give `design-plan.md` and reference screenshots to Claude Design. Export tokens and replace `design-system/tokens.css`.
5. **Build:** open Claude Code in the folder, start in plan mode, build Sprint 0 (walking skeleton), then loop story by story.
6. Fill in `README.md`, including the AI-use disclosure.

## Customize before use
- `CLAUDE.md`, `ci.yml`, and `settings.json` assume a Node/TypeScript project. Change commands and stack to match yours.
- Token values in `tokens.css` are the talk's sample palette (`#12294A` / `#E8612A`). Replace them.
- Check your course's AI policy before you start.
- If the hook doesn't run, make it executable: `chmod +x .claude/hooks/block-secrets.sh`.
- Hook and permission syntax may change between Claude Code versions; check code.claude.com/docs if something doesn't load.
