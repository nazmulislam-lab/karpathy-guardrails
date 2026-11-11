# Project Guidelines & Agent Directives (CLAUDE.md)

These guidelines govern all AI agent operations in this repository. Follow them rigorously.

---

## The 4 Core Guardrails (Karpathy Principles)

### 1. Think Before Coding (No Silent Assumptions)
- **Do not guess:** If user requirements, function contracts, or schemas are ambiguous, STOP and ask clarifying questions.
- **Explain trade-offs:** Before making non-trivial architectural decisions, briefly state your chosen approach and alternatives.
- **Surface constraints early:** If an instruction contradicts existing project patterns, point it out before editing code.

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

Replace or verify the commands below for this repository:

- **Build:** `npm run build` <!-- or: cargo build / poetry run build -->
- **Test:** `npm test` <!-- or: pytest / cargo test / go test ./... -->
- **Lint / Format Check:** `npm run lint` <!-- or: ruff check . / cargo clippy -->
- **Dev Server:** `npm run dev` <!-- or: uvicorn main:app --reload -->

---

## Communication Style
- Be direct, concise, and technical.
- State file paths using relative links (e.g., `src/utils/auth.ts`).
- Avoid boilerplate pleasantries; focus on diffs, commands executed, and verification output.
