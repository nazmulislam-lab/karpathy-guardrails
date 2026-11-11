# Practical Guide to Vibe Coding & Agent Workflows

## What is "Vibe Coding"?
Coined by Andrej Karpathy, **vibe coding** refers to a workflow where a human programmer acts as an architect or technical director, directing autonomous AI agents using natural language while the model manages code synthesis, terminal operations, file systems, and debugging.

---

## 5 Practical Rules for Vibe Coding

### 1. Keep Prompts Short and Intent-Focused
Avoid writing massive prompts with dozens of nested constraints. LLMs frequently get tangled in contradictory constraints. Keep prompts short, focus on the user-facing outcome, and let the model's reasoning engine figure out implementation details within your guardrails.

### 2. Don't Micromanage Diffs
Resist reading every single line of diff during rapid exploration. Instead, evaluate the software by its **observable output**:
- Does the dev server boot?
- Do the tests pass?
- Does the UI function as expected?

### 3. Let the Agent Use the Terminal
Give the agent direct access to terminal commands (`pytest`, `npm test`, `git diff`, `curl`). When a command fails, don't write the fix yourself—let the agent read the stack trace and self-correct.

### 4. Optimize Model Reasoning Effort
- **High-stakes architectural design:** Use flagship reasoning models (e.g., Claude 3.7 Sonnet / Opus or Gemini 2.5 Pro) with extended thinking.
- **Routine implementation & debugging:** Medium reasoning effort is usually the sweet spot; max reasoning often causes excessive latency and token burn without tangible quality improvements.

### 5. Dictation Beats Typing
Karpathy and many practitioner vibe coders use system-wide speech-to-text tools (such as SuperWhisper on macOS or local Whisper models) to speak commands and goals into the terminal or IDE prompt at speaking speed (150 words/min).
