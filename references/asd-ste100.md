# ASD-STE100 & The Karpathy "80% Rule"

## What is ASD-STE100?

**ASD-STE100 (Simplified Technical English)** is an international controlled-language specification developed by the aerospace industry in the 1980s (maintained by ASD). Originally designed for maintenance manuals of commercial and military aircraft, its purpose was to eliminate ambiguity for international technicians under high-stress conditions.

The standard enforces:
- **Controlled vocabulary:** Words have restricted definitions and parts of speech (e.g., preventing interchangeable use of *engine*, *motor*, and *powerplant*).
- **Short sentences:** Maximum of 20 words for procedural instructions and 25 words for descriptive statements.
- **Direct voice:** Mandatory active voice and imperative verbs.
- **One action per sentence:** Eliminates compound instructions with hidden assumptions.
- **No decorative modifiers:** Banned filler, unnecessary adjectives, and vague adverbs (*very*, *basically*, *potentially*).

---

## Why Karpathy Uses It with LLMs

In late 2024 and 2025, Andrej Karpathy highlighted a key insight regarding frontier models: 

> As AI coding agents automate generation, the bottleneck shifts to **human review and supervision**. Standard LLM outputs are cluttered with polite conversational fluff, hedging, and compound sentences that obscure what the model actually did.

Prompting the model to follow ASD-STE100 mechanically eliminates:
1. **Throat-clearing openers:** ("Certainly! I would be delighted to refactor this function for you...")
2. **Hedging & evasiveness:** ("This could potentially help fix the bug under certain edge cases...")
3. **Compound obfuscation:** Long paragraphs that bury the single file that was modified.

---

## The "80% Rule" Sweet Spot

Strict 100% ASD-STE100 compliance requires a rigid, certified dictionary of ~900 words, which can flatten programming nuances (such as subtle language-specific type systems or concurrent execution paradigms).

Karpathy and agent practitioners therefore advocate for **"80% of the way to ASD-STE100"**:

* **Keep:**
  * Active voice only (*"Update `auth.ts`"* instead of *"The authentication file was updated by the agent"*).
  * 15–20 words per sentence max.
  * Direct imperative verbs (*"Run `npm test`"*, *"Fix the null pointer in line 42"*).
  * Bullet points with one action per item.
  * Zero polite pleasantries, filler, or summary regurgitation.
* **Relax (the 20%):**
  * Allow standard software engineering terminology (e.g., *closure*, *mutex*, *generics*, *middleware*) even if absent from the 1980s aerospace dictionary.
