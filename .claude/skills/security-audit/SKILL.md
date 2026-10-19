---
name: security-audit
description: Full security audit of the repository — secrets (including git history), dependencies, access control, injection, data exposure and GitHub security settings — producing a prioritized fix list. Run with /security-audit before a launch, a demo with real users, or periodically.
argument-hint: [optional focus, e.g. "auth" or "uploads"]
disable-model-invocation: true
---

# Security audit

Focus: $ARGUMENTS (default: everything)

## 1. Automated checks (run them, show the output)
```bash
# Dependencies with known vulnerabilities (needs a lockfile)
npm audit --omit=dev

# Tracked env files (should print nothing but .env.example)
git ls-files | grep -E '(^|/)\.env' 

# Likely secrets anywhere in history (review every hit by hand)
git log -p --all | grep -nEi '(api[_-]?key|secret|token|password|BEGIN [A-Z ]*PRIVATE KEY|AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9]{36}|sk-[A-Za-z0-9_-]{20,})' | head -50
```
A secret found in history must be **rotated** with the provider. Deleting it from the latest commit doesn't remove it from history or from anyone who cloned the repo.

## 2. Code review
Use the `security-reviewer` subagent with scope "full audit" (or the focus above). Ask it to cover every route, API handler and server action.

## 3. GitHub settings (tell the user what to check; you can't change these)
- Settings → Code security: **Secret scanning** and **Push protection** on (free for public repos)
- **Dependency graph** and **Dependabot alerts** on; `.github/dependabot.yml` covers the ecosystems in use
- **CodeQL** workflow (`.github/workflows/codeql.yml`) has run on the latest code with no open alerts
- Branch protection on `main` requires the `test` check

## 4. Report
Write the results to `docs/security-audit-<YYYY-MM-DD>.md`:
- **Summary:** overall risk in one line, and counts by severity
- **Findings table:** severity, area, file:line, attack scenario, fix, effort (S/M/L)
- **Fix order:** critical and high first, then quick wins
- **Checked and fine:** what was covered

Then offer to fix the findings one at a time, each on its own branch with a regression test where possible (use the tdd skill). Don't fix anything without the user's go-ahead.
