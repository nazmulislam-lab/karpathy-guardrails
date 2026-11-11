# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2026-11-11

### Added
- **ASD-STE100 Support**: Added Karpathy's "80% ASD-STE100 (Simplified Technical English)" communication rule.
- Added `references/asd-ste100.md` explaining why aerospace controlled language cures LLM conversational fluff, hedging, and compound sentence ambiguity.
- Updated `SKILL.md`, `templates/CLAUDE.md`, `templates/AGENTS.md`, `templates/karpathy-guidelines.mdc`, and `scripts/scaffold-rules.sh` with ASD-STE100 rules.

## [1.0.0] - 2026-11-11

### Added
- Initial release of `karpathy-guardrails`.
- Core Agent Skill (`SKILL.md`) for automated project rule generation.
- Production-ready templates:
  - `templates/CLAUDE.md` for Claude Code CLI.
  - `templates/AGENTS.md` for Antigravity, Gemini CLI, and universal agents.
  - `templates/karpathy-guidelines.mdc` for Cursor & Windsurf.
- Zero-dependency stack-aware bash generator (`scripts/scaffold-rules.sh`).
- Deep-dive reference documentation:
  - `references/karpathy-principles.md` (The 4 core failure modes and antidotes).
  - `references/vibe-coding-guide.md` (Practical hands-off workflow).
