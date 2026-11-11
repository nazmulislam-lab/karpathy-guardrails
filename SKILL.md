---
name: karpathy-guardrails
description: |
  Inspects the active codebase and generates or updates disciplined CLAUDE.md, AGENTS.md,
  or Cursor rules based on Andrej Karpathy's agentic engineering principles. Enforces no silent
  assumptions, simplicity first (anti-overengineering), surgical precision, goal-driven
  execution, and 80% ASD-STE100 clear communication. Use when the user asks to "scaffold agent rules",
  "create CLAUDE.md", "create AGENTS.md", "initialize Karpathy rules", "add vibe coding guardrails",
  or "tame coding agents".
license: MIT
metadata:
  author: Md Nazmul Islam (based on Andrej Karpathy's agentic engineering observations)
  version: "1.0.0"
---

# Karpathy Guardrails

Generate and maintain production-ready agent governance files (`CLAUDE.md`, `AGENTS.md`, or `.cursor/rules/`) that keep AI coding agents disciplined, concise, and focused.

## The Core Problem

Frontier AI coding models (Claude 3.7 / Opus, GPT-4.5 / o3, Gemini 2.5 Pro) are extremely capable, but left ungoverned they default to predictable failure modes highlighted by Andrej Karpathy:
1. **Silent guessing:** Inventing architecture or unstated requirements instead of asking for clarification.
2. **Over-engineering:** Writing 500 lines of abstractions, wrappers, and config for a problem requiring 30 lines.
3. **Sloppy, non-surgical edits:** Modifying unrelated files, reformatting working code, and leaving behind orphan imports.
4. **Endless churn:** Looping aimlessly without a clear definition of when a task is finished.

This skill equips the project with hard guardrails that counteract those defaults.

---

## Workflow

Follow these steps in order whenever this skill is invoked:

### Step 1: Detect Workspace Stack & Tooling

Inspect the repository to determine project conventions:
- **Node / JavaScript / TypeScript:** Check `package.json` for test runners (`vitest`, `jest`), linters (`eslint`, `biome`), and package managers (`pnpm`, `bun`, `npm`, `yarn`).
- **Python:** Check `pyproject.toml`, `requirements.txt`, `Pipfile` for test frameworks (`pytest`, `unittest`) and linters (`ruff`, `black`, `flake8`).
- **Rust / Go / Systems:** Check `Cargo.toml`, `go.mod`, `Makefile`.
- **Containers & Infra:** Check `Dockerfile`, `docker-compose.yml`, GitHub Actions.

Extract the exact terminal commands for:
1. Running tests
2. Running linter / type checker
3. Running dev server or build

### Step 2: Determine Target Agent Environment

Identify which agent configuration format is required:
* **Claude Code CLI:** Generate `CLAUDE.md` in repository root.
* **Universal Agents (Antigravity, Gemini CLI, Codex):** Generate `AGENTS.md` (or `GEMINI.md`) in repository root.
* **Cursor / Windsurf:** Generate `.cursor/rules/karpathy-guidelines.mdc` or `.cursorrules`.
* If unspecified, generate `CLAUDE.md` and `AGENTS.md` simultaneously.

### Step 3: Scaffold the Rule File

Inject the four pillars of the Karpathy method along with detected stack commands:

1. **Think Before Coding (No Silent Assumptions):**
   - Mandate that ambiguous requirements trigger clarifying questions, not guesses.
   - Demand explicit statement of tradeoffs before complex changes.
2. **Simplicity First (Anti-Overengineering):**
   - Strictly favor 30–50 lines of clear code over 300 lines of speculative design patterns.
   - Forbid creating new config files, helpers, or packages unless explicitly needed.
3. **Surgical Precision (Scope Control):**
   - Limit file modifications strictly to the files involved in the task.
   - Forbid arbitrary refactoring, file renaming, or whitespace reformatting in untouched files.
   - Clean up orphan imports, dead variables, and temp files.
4. **Goal-Driven Execution (Definition of Done):**
   - Inject the actual commands detected in Step 1.
   - Forbid declaring a task complete until verification commands pass cleanly.
5. **Clear Communication (The 80% ASD-STE100 Rule):**
   - Eliminate filler words, conversational pleasantries, and hedging.
   - Enforce active voice, imperative sentences (under 20 words each), and single-action bullet points.

### Step 4: Verify and Review with User

1. Check that the generated file does not conflict with any existing pre-commit hooks or local workflow.
2. Show the summary of generated directives to the user.
3. Confirm if any custom domain-specific restrictions (e.g., API boundaries, auth constraints) should be appended.
