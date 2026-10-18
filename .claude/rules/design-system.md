---
paths:
  - "src/**/*.{ts,tsx,js,jsx,css,scss,html}"
---

# Design system rules

- Use tokens from `design-system/tokens.css` (CSS variables) for every colour, font size, spacing, radius, shadow, and duration.
- Do not hard-code hex values, pixel spacing, or font stacks in components.
- Use the components specified in `design-system/components.md`, with the props and states listed there, before creating a new one. If a needed component or variant is missing, stop and propose it; do not invent a one-off style.
- Every interactive component must have default, hover, focus-visible, disabled, and error/loading states where relevant.
- Empty states and error messages use the real copy from `design-plan.md`. No lorem ipsum.
- Do not edit `design-system/` as part of a feature story. Token or component changes are a separate, reviewed proposal.
- Meet WCAG AA contrast and keep everything keyboard-reachable.
