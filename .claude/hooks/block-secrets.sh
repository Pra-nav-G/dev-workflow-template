#!/usr/bin/env bash
# .claude/hooks/block-secrets.sh
# PreToolUse hook for Bash. Blocks `git commit` if staged changes look like they contain secrets
# or a .env file. Exit code 2 = block the tool call and show stderr to the agent.

set -u

input="$(cat)"

# Only act on git commit commands
if ! printf '%s' "$input" | grep -q 'git commit'; then
  exit 0
fi

# 1. Block staged .env files (allow .env.example)
if git diff --cached --name-only 2>/dev/null | grep -E '(^|/)\.env($|\.)' | grep -qv '\.env\.example$'; then
  echo "BLOCKED: a .env file is staged. Unstage it (git restore --staged <file>) and make sure .env is in .gitignore." >&2
  exit 2
fi

# 2. Block common secret patterns in staged additions
patterns='(AKIA[0-9A-Z]{16}|-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----|sk-[A-Za-z0-9]{20,}|ghp_[A-Za-z0-9]{36}|xox[baprs]-[A-Za-z0-9-]{10,}|(api[_-]?key|secret|token|password)[[:space:]]*[:=][[:space:]]*["'"'"'][^"'"'"']{8,}["'"'"'])'

if git diff --cached -U0 2>/dev/null | grep -E '^\+' | grep -Ev '^\+\+\+' | grep -Eiq "$patterns"; then
  echo "BLOCKED: staged changes look like they contain a secret. Remove it, rotate it if it was ever pushed, and use environment variables instead." >&2
  exit 2
fi

exit 0
