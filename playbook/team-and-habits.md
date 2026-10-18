# Team Roles, Git Habits, and Reviewer Checklist

## Rules for building with other people
1. **The spec lives in the repo and is versioned.** Changes go through pull requests. A diff replaces an alignment meeting.
2. **Every gate has a named owner.** "A human approves" scales to "this human approves."
3. **Epics declare their boundaries** (APIs, data shapes, events) so parallel agent sessions cannot collide.
4. **CI is the neutral referee.** A story passes acceptance criteria or it doesn't.
5. **The design system is a governed package.** Token changes are proposals with review.
6. **Steering files are shared assets.** `CLAUDE.md`, rules, skills, and the question funnel are maintained like code.
7. **Onboarding = clone the golden path.** A new contributor loads the same files and is aligned on day one.

## Hackathon / capstone roles — split the gates, not the repo
| Role | Owns | Rule |
|---|---|---|
| Spec owner | `marketing-doc.md`, story list | Approves scope changes |
| System owner | Tokens and components | No one else edits them mid-build |
| Build lead | `CLAUDE.md`, branch strategy, merge order | |
| Reviewer | Acceptance criteria, reading diffs | Rotates — everyone takes a turn |

Names: Spec ______ · System ______ · Build ______ · Reviewer (this week) ______

**Merge on green:** tests pass, criteria met, design system used.

## 48-hour budget
| Time | Activity |
|---|---|
| 60 min | Think — funnel, spec, story list |
| 45 min | Design — tokens and three components |
| 90 min | Walking skeleton, committed |
| Rest | Story loops, docs updated as you go |

## Git habits
```bash
git switch -c s14-filter-by-tag          # one branch per story, id in the name
git add src/ build-plan.md               # docs travel with the code
git commit -m "S-14: filter list by tag" # small commits, plain messages
git push -u origin s14-filter-by-tag     # agents work on branches too; never straight to main
```
- Pull requests carry acceptance criteria as a checklist.
- Secrets never enter the repo: `.env` in `.gitignore` on day one, plus the block-secrets hook.

## If you can't explain it, don't merge it
- Read the whole diff before accepting it. Every line, especially the first few weeks.
- Ask the agent to explain any block you don't follow, then check the explanation against the code.
- Write or review the tests yourself. Tests are where your judgment lives.
- Delete what you didn't ask for.

## For coursework
- Read your course's AI policy **before** you start. Policies differ by instructor, not just by school.
- Where tool use is allowed, disclose it plainly: what you used it for and what you wrote yourself.
- Your commit history is your evidence of process.

## What a reviewer opens
- [ ] README — what it does and who for, in five lines
- [ ] `marketing-doc.md` — the thinking, including what you decided not to build
- [ ] `CLAUDE.md` — your rules
- [ ] Commit history and PRs — small, described, reviewed
- [ ] Tests and a green CI badge

## Answers worth having ready
- What did you cut, and why?
- Where was the agent wrong, and how did you catch it?
- Show me one correction that became a rule.
- Which part would you rewrite now?
