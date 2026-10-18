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
├── design-system/                 ← replace with your Claude Design export
│   ├── tokens.css                 ← tokens as CSS variables (source of truth)
│   ├── tailwind.config.js         ← optional: Tailwind theme mapped to the tokens
│   └── components.md              ← component specs: props and states
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
    ├── slide-map.md               ← every slide → where it lives here; toolkit; next steps
    ├── prompts.md                 ← every prompt from the talk
    ├── question-worksheet.md      ← the 5-gate, 25-question funnel
    ├── red-team-prompts.md        ← pre-mortem, assumptions, kill criteria, buyer attack
    └── team-and-habits.md         ← roles, git habits, reviewer checklist, 48h plan
```

## How to use it on a new project
1. Click **Use this template** → **Create a new repository**, then clone it.
2. **Think:** open Claude Chat, use the opening prompt in `playbook/prompts.md`, run the question worksheet, then the red-team prompts. Paste the results into `marketing-doc.md`.
3. **Handoff:** have Claude Chat derive `design-plan.md`, `build-plan.md`, and the steering file from `marketing-doc.md`. Replace the template versions. The talk calls the steering file `SteeringFile.md`; save it as `CLAUDE.md` so Claude Code loads it automatically.
4. **Design:** give `design-plan.md` and reference screenshots to Claude Design. Export and replace `design-system/` (tokens, and component specs if you have them).
5. **Build:** open Claude Code in the folder, start in plan mode, build Sprint 0 (walking skeleton), then loop story by story with the `implement-story` skill and check each branch with the `reviewer` subagent.
6. Fill in `README.md`, including the AI-use disclosure.

When anything changes, change `marketing-doc.md` first, then the files derived from it. Every change starts at the source of truth.

Not sure which slide a file came from? See `playbook/slide-map.md`.

## Customize before use
- `CLAUDE.md`, `ci.yml`, and `settings.json` assume a Node/TypeScript project. Change commands and stack to match yours.
- Token values in `tokens.css` are the talk's sample palette (`#12294A` / `#E8612A`). Replace them. If you don't use Tailwind, delete `tailwind.config.js`.
- CI passes on a fresh copy and starts running lint, tests and build once you add a `package.json`.
- Check your course's AI policy before you start.
- If the hook doesn't run, make it executable: `chmod +x .claude/hooks/block-secrets.sh`.
- Hook and permission syntax may change between Claude Code versions; check code.claude.com/docs if something doesn't load.
