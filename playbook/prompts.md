# Prompt Library — Think → Design → Build

Copy, fill in the brackets, paste.

---

## 1. THINK (Claude Chat)

### Opening prompt
```
I want to build [your idea]. Act as a market analyst: who is this for,
who already does it, and what would make mine worth using? Push back
where the idea is weak. When we are done, write everything we agreed
into a single file called marketing-doc.md.
```
Tips: ask for pushback explicitly; name the output file in the first prompt; if you have a brief or pitch, paste it in first.

### Question funnel
```
Now interrogate marketing-doc.md using the five gates in question-worksheet.md
(Problem, Market, Position, Money, Feasibility). Ask one gate at a time, wait for my
answers, then give me a go / sharpen / stop recommendation with reasons.
```

### Red-team
Same conversation, about half an hour. See `red-team-prompts.md`.

### Handoff — derive the three files
As on the slide:
```
Now act as my product owner. From marketing-doc.md,
write design-plan.md, build-plan.md (epics, user stories,
tasks, acceptance criteria), and a first SteeringFile.md.
```
Optional additions that enforce the rules from the same slide:
```
Include non-goals in build-plan.md. Derive everything from marketing-doc.md,
not from memory. Every story must reference screens and every screen must
map to a story. Use the templates in this repo as the structure.
```
**SteeringFile.md = CLAUDE.md.** The slide calls the steering file `SteeringFile.md`. Claude Code reads it automatically only when it's named `CLAUDE.md` at the repo root, so save it as `CLAUDE.md`.

---

## 2. DESIGN (claude.ai/design)

Upload `design-plan.md` and screenshots of your references (including anti-references).

```
Here is design-plan.md and screenshots of my references. Build me a design
system from it: colour, type scale, spacing, radii and states first, then
components with variants, then the screens in the inventory. Export the
tokens as CSS variables.
```
Order: colour, type scale, spacing, radii, elevation, states → components with variants and states → patterns → pages. Never pages first. Tweak until it feels right, then stop fiddling.
Export: Share → download a zip (tokens, components, pages), or copy the link. Save tokens to `design-system/tokens.css` (or a Tailwind config) and component specs to `design-system/components.md`.

---

## 3. BUILD (Claude Code)

Open Claude Code in the project folder with `build-plan.md`, the design-system export, and `CLAUDE.md` at the root. Start in plan mode: have the agent read the epics and tokens and propose a build order before it writes a line. Review the order, approve it, then go.

### Build order
```
Here is build-plan.md and my design system. Plan the build order off the
epics, and tell me where to start.
```

### Walking skeleton
```
Build Sprint 0 as a walking skeleton: one thin vertical slice through the
whole stack using real tokens from design-system/. Set up CI, .gitignore
(with .env), and commit the docs. Stop and show me before moving on.
```

### Roadmap
```
Build a roadmap and backlog from the epics in build-plan.md, in dependency
order, and write it into build-plan.md.
```

### Story loop
```
Implement S-[id] using the implement-story skill.
```

### Review
```
Use the reviewer subagent to review this branch against the acceptance
criteria for S-[id].
```

### Turn a correction into a rule
```
You got [X] wrong. Add a one-line rule to CLAUDE.md under "Lessons learned"
so it doesn't happen again.
```

### Explain before I merge
```
Explain the block in [file] lines [a–b] in plain language, and tell me
what would break if I removed it.
```
