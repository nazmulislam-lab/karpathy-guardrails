#!/usr/bin/env bash
# scaffold-rules.sh
# Zero-dependency stack-aware generator for Karpathy-inspired agent rules.

set -euo pipefail

TARGET_DIR="${1:-.}"
RULE_TYPE="${2:-all}" # claude, agents, cursor, or all

mkdir -p "${TARGET_DIR}"

echo "🔍 Detecting workspace stack in: ${TARGET_DIR}..."

TEST_CMD="npm test"
LINT_CMD="npm run lint"
BUILD_CMD="npm run build"
DEV_CMD="npm run dev"

if [ -f "${TARGET_DIR}/package.json" ]; then
    echo "  → Detected Node.js / TypeScript workspace"
    if grep -q '"vitest"' "${TARGET_DIR}/package.json"; then
        TEST_CMD="npx vitest run"
    elif grep -q '"jest"' "${TARGET_DIR}/package.json"; then
        TEST_CMD="npm test"
    fi
    if grep -q '"biome"' "${TARGET_DIR}/package.json"; then
        LINT_CMD="npx biome check ."
    elif grep -q '"eslint"' "${TARGET_DIR}/package.json"; then
        LINT_CMD="npm run lint"
    fi
elif [ -f "${TARGET_DIR}/pyproject.toml" ] || [ -f "${TARGET_DIR}/requirements.txt" ]; then
    echo "  → Detected Python workspace"
    TEST_CMD="pytest"
    LINT_CMD="ruff check ."
    BUILD_CMD="python -m build"
    DEV_CMD="python main.py"
elif [ -f "${TARGET_DIR}/Cargo.toml" ]; then
    echo "  → Detected Rust workspace"
    TEST_CMD="cargo test"
    LINT_CMD="cargo clippy -- -D warnings"
    BUILD_CMD="cargo build"
    DEV_CMD="cargo run"
elif [ -f "${TARGET_DIR}/go.mod" ]; then
    echo "  → Detected Go workspace"
    TEST_CMD="go test ./..."
    LINT_CMD="golangci-lint run"
    BUILD_CMD="go build ./..."
    DEV_CMD="go run ."
fi

generate_claude_md() {
    cat <<EOF > "${TARGET_DIR}/CLAUDE.md"
# Project Guidelines & Agent Directives (CLAUDE.md)

These guidelines govern all AI agent operations in this repository. Follow them rigorously.

---

## The 4 Core Guardrails (Karpathy Principles)

### 1. Think Before Coding (No Silent Assumptions)
- **Do not guess:** If user requirements, function contracts, or schemas are ambiguous, STOP and ask clarifying questions.
- **Explain trade-offs:** Before making non-trivial architectural decisions, briefly state your chosen approach and alternatives.
- **Surface constraints early:** If an instruction contradicts existing patterns, point it out before editing code.

### 2. Simplicity First (Anti-Overengineering)
- **Write minimal code:** Solve the immediate problem directly. A concise 30-line solution is strictly preferred over 200 lines of abstractions.
- **No speculative features:** Do not add helper utilities, wrapper classes, or configurations for hypothetical future use cases.
- **Borrow, don't invent:** Use standard libraries and existing utilities in this codebase before introducing new external dependencies.

### 3. Surgical Precision (Scope Control)
- **Touch only what is requested:** Restrict edits strictly to the files necessary to complete the task.
- **No unsolicited refactoring:** Do not reformat untouched code, change variable names in unrelated files, or modify linting styles outside your diff.
- **Clean up after yourself:** Remove any dead variables, obsolete imports, scratch scripts, or temporary test files created during development.

### 4. Goal-Driven Execution (Definition of Done)
- **A task is not done until verified:** Never declare a task complete based on assumptions. Always run verification commands.
- **Test-first mindset:** Whenever possible, write or update a test that reproduces the bug or asserts the new behavior before writing implementation code.
- **Green checks required:** Verify that the build, tests, and linter pass before submitting work.

---

## Workspace Commands

- **Build:** \`${BUILD_CMD}\`
- **Test:** \`${TEST_CMD}\`
- **Lint / Format Check:** \`${LINT_CMD}\`
- **Dev Server:** \`${DEV_CMD}\`

---

## Communication Style
- Be direct, concise, and technical.
- State file paths using relative links (e.g., \`src/utils/auth.ts\`).
- Avoid boilerplate pleasantries; focus on diffs, commands executed, and verification output.
EOF
    echo "  ✓ Generated ${TARGET_DIR}/CLAUDE.md"
}

generate_agents_md() {
    cat <<EOF > "${TARGET_DIR}/AGENTS.md"
# AGENTS.md — Universal Agent Governance

This repository adheres to disciplined agentic engineering principles inspired by Andrej Karpathy. All autonomous agents, paired assistants, and LLM subagents operating in this workspace must strictly comply with these directives.

---

## Non-Negotiable Directives

### 1. Zero Hallucinated Assumptions
- **Ask over assuming:** Never make assumptions about API schemas, environment variables, authentication secrets, or intended behavior. When specifications are incomplete, pause and prompt the user.
- **Fail fast on ambiguity:** If two interpretations exist, present both briefly and ask for confirmation before writing files.

### 2. Simplicity & Anti-Overengineering
- Implement the simplest thing that could possibly work.
- Ban premature design patterns: no unrequested factories, singletons, intermediate interfaces, or generic adapters.
- Keep dependencies lean. Avoid pulling in new packages when built-in runtime modules suffice.

### 3. Surgical Scope Discipline
- Restrict your diffs strictly to the target scope.
- Do not reformat indentation, adjust whitespace, or rename variables in code blocks you were not asked to touch.
- Preserve all existing comments and documentation unless they are directly invalidated by your code change.

### 4. Verified Completion Criteria
- You may NOT conclude an interaction or mark a task done until you have executed verification commands and observed green output.
- Every code change must be accompanied by:
  1. A check for compile / syntax errors (\`${BUILD_CMD}\`).
  2. Execution of the corresponding test (\`${TEST_CMD}\`).
  3. Clean linter and type-checker runs (\`${LINT_CMD}\`).

---

## Verification Commands Reference

\`\`\`bash
# Build
${BUILD_CMD}

# Test Suite
${TEST_CMD}

# Lint / Code Quality
${LINT_CMD}
\`\`\`
EOF
    echo "  ✓ Generated ${TARGET_DIR}/AGENTS.md"
}

case "${RULE_TYPE}" in
    claude)
        generate_claude_md
        ;;
    agents)
        generate_agents_md
        ;;
    all|*)
        generate_claude_md
        generate_agents_md
        ;;
esac

echo "✨ Done! Karpathy Guardrails initialized successfully."
