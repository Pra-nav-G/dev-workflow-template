# Start Here: Think → Design → Build Template

From the talk "Think First, Then Build". Every step produces a file the next step consumes. The files are the method.

## The flow
```
Claude Chat   → marketing-doc.md ──┬→ design-plan.md → Claude Design → design-system/
(question funnel, red-team,        │
 real user interviews)             └→ build-plan.md + CLAUDE.md ─────→ Claude Code → repo
                     ↑                                                     │
                     └──────── every change starts at the source of truth ─┘
```

## What's in this repo
```
├── START-HERE.md                  ← you are here (delete in your project if you like)
├── README.md                      ← project README template (fill in)
├── LICENSE                        ← MIT; init.sh puts your name on it
├── marketing-doc.md               ← source of truth (Lean Canvas, gates, red-team, interview log)
├── design-plan.md                 ← feed to Claude Design
├── build-plan.md                  ← epics, stories, acceptance criteria
├── CLAUDE.md                      ← steering file for Claude Code
├── .gitignore                     ← .env and CLAUDE.local.md excluded from day one
├── .env.example                   ← list env vars here; never commit .env
├── design-system/                 ← replace with your Claude Design export
│   ├── tokens.css                 ← tokens as CSS variables (source of truth)
│   ├── tailwind.config.js         ← optional: Tailwind theme mapped to the tokens
│   └── components.md              ← component specs: props and states
├── docs/decisions/                ← one short file per technical decision
├── scripts/
│   ├── init.sh                    ← run once: fills in names, owners, badge, permissions
│   └── check-design-tokens.sh     ← fails on hard-coded colours/sizes (runs in CI)
├── .github/
│   ├── CODEOWNERS                 ← named owner per file (spec, system, build)
│   ├── ISSUE_TEMPLATE/story.md    ← a story as a GitHub issue
│   ├── pull_request_template.md   ← PRs carry the acceptance criteria
│   └── workflows/ci.yml           ← .env guard, token check, lint/test/build, docs-drift warning
├── .claude/
│   ├── settings.json              ← permissions + hook wiring
│   ├── rules/                     ← git-workflow.md, design-system.md (path-scoped)
│   ├── skills/                    ← slash commands:
│   │   ├── sprint-0/              ←   /sprint-0         walking skeleton
│   │   ├── implement-story/       ←   /implement-story  one story end to end
│   │   ├── add-rule/              ←   /add-rule         correction → CLAUDE.md rule
│   │   ├── sync-docs/             ←   /sync-docs        propagate a scope change
│   │   └── prep-review/           ←   /prep-review      answers for reviewers, from your history
│   ├── agents/reviewer.md         ← independent reviewer subagent
│   └── hooks/
│       ├── block-secrets.sh       ← blocks commits containing secrets or .env
│       └── format-file.sh         ← runs your Prettier after each edit (once installed)
└── playbook/                      ← reusable guides (delete in your project if you like)
    ├── slide-map.md               ← every slide → where it lives here; toolkit; next steps
    ├── prompts.md                 ← every prompt from the talk, plus extras
    ├── question-worksheet.md      ← the 5-gate, 25-question funnel
    ├── red-team-prompts.md        ← pre-mortem, assumptions, kill criteria, buyer attack
    ├── user-interview-guide.md    ← how to test assumptions with real people
    └── team-and-habits.md         ← roles, git habits, branch protection, reviewer checklist
```

## How to use it on a new project
1. **Create and set up:** click **Use this template** → **Create a new repository**, clone it, then run:
   ```bash
   bash scripts/init.sh "Your Project Name"
   ```
   It fills in the project name, CI badge, CODEOWNERS and LICENSE, and prints how to protect `main`.
2. **Think:** open Claude Chat, use the opening prompt in `playbook/prompts.md`, run the question worksheet, then the red-team prompts. Paste the results into `marketing-doc.md`.
3. **Talk to real users:** use `playbook/user-interview-guide.md` to test your top three assumptions with about five people. Log them in `marketing-doc.md` §7b. If a kill criterion is hit, say so out loud.
4. **Handoff:** have Claude Chat derive `design-plan.md`, `build-plan.md`, and the steering file from `marketing-doc.md`. Replace the template versions. The talk calls the steering file `SteeringFile.md`; save it as `CLAUDE.md` so Claude Code loads it automatically.
5. **Design:** give `design-plan.md` and reference screenshots to Claude Design. Export and replace `design-system/` (tokens, and component specs if you have them).
6. **Build:** open Claude Code in the folder, start in plan mode, run `/sprint-0`, then `/implement-story S-01` and onward. Check each branch with the `reviewer` subagent. When you correct the agent, run `/add-rule`.
7. **Keep it honest:** when scope changes, run `/sync-docs`. Before a demo, grading or interview, run `/prep-review`. Fill in `README.md` as you go, including the AI-use disclosure.

Not sure which slide a file came from? See `playbook/slide-map.md`.

## Customize before use
- `CLAUDE.md`, `ci.yml`, and `settings.json` assume a Node/TypeScript project. Change commands and stack to match yours.
- Token values in `tokens.css` are the talk's sample palette (`#12294A` / `#E8612A`). Replace them. If you don't use Tailwind, delete `tailwind.config.js`.
- CI passes on a fresh copy and starts running lint, tests and build once you add a `package.json`. The token check starts once you have a `src/` folder.
- The format hook does nothing until you install Prettier in the project (`npm install --save-dev prettier`).
- On a team, edit the roles in `.github/CODEOWNERS` after running `init.sh`.
- Check your course's AI policy before you start.
- If a hook doesn't run, make it executable: `chmod +x .claude/hooks/*.sh` (`init.sh` does this).
- Hook and permission syntax may change between Claude Code versions; check code.claude.com/docs if something doesn't load.
