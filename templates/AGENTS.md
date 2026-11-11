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
  1. A check for compile / syntax errors.
  2. Execution of the corresponding unit or integration test.
  3. Clean linter and type-checker runs.

### 5. Communication Standard (80% ASD-STE100)
- Deliver responses following the **80% ASD-STE100 (Simplified Technical English)** standard.
- Use active voice and imperative mood.
- Keep sentences short (under 20 words) with one action or assertion per sentence.
- Eliminate conversational pleasantries, apology loops, throat-clearing openers, and ambiguous qualifiers (*basically*, *essentially*, *potentially*).

---

## Verification Commands Reference

```bash
# Compile / Type Check
# [Insert typecheck command, e.g., tsc --noEmit / mypy .]

# Test Suite
# [Insert test command, e.g., pytest / npm test]

# Lint / Code Quality
# [Insert lint command, e.g., ruff check . / npm run lint]
```
