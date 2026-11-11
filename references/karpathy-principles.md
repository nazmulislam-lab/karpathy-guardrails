# The Karpathy Principles of Agentic Engineering

In early 2025, AI researcher Andrej Karpathy published a series of viral reflections on using frontier AI coding agents (specifically Claude Code, Cursor, and related LLMs). He observed that software engineering was undergoing an inverted phase change—from writing 80% of code manually with 20% AI autocomplete, to **80% agent-driven development** and 20% high-level steering.

However, leaving frontier models unsupervised exposes four chronic failure modes:

---

## The 4 Chronic Failure Modes

### 1. Hallucinated Assumptions (The Guessing Trap)
* **The Failure:** When presented with incomplete user prompts, an agent instinctively fills in gaps by inventing architectural boundaries, guessing database schemas, or writing mock data that diverges from the user's intent.
* **The Antidote:** **Think Before Coding.** The agent is instructed to stop, identify what it does not know, surface trade-offs, and ask clarifying questions *before* touching code.

### 2. Over-Engineering (The Enterprise Slop Trap)
* **The Failure:** Agents tend to produce verbose, hyper-abstracted boilerplate: creating singletons, factories, redundant types, and separate utility modules when a 25-line inline function would solve the problem cleanly.
* **The Antidote:** **Simplicity First.** Enforce an aggressive bias toward simplicity. A 30-line solution is strictly favored over a 200-line architecture. Speculative features and premature abstraction layers are explicitly forbidden.

### 3. Non-Surgical Scope Creep (The Collateral Damage Trap)
* **The Failure:** While fixing a single function, the agent reformats surrounding whitespace, renames unrelated variables, updates unrequested lint configs, or leaves orphan variables and leftover imports.
* **The Antidote:** **Surgical Precision.** The agent must constrain its diff strictly to the files and lines requested. It is forbidden from modifying orthogonal code or changing project formatting styles unprompted.

### 4. Infinite Churn (The "Make It Work" Trap)
* **The Failure:** Without verifiable criteria, the agent either claims success prematurely without testing, or enters an endless modification loop making random tweaks until it breaks surrounding code.
* **The Antidote:** **Goal-Driven Execution.** Mandate that "done" is defined by automated test runs, linting checks, or observable criteria. The agent must run tests, inspect exit codes, and fix failures itself before declaring completion.
