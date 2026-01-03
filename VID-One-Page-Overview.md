# Verified Intent Development (VID) — One-Page Overview

## Why VID Exists

Modern AI assistants generate production-grade code in seconds, but they cannot guarantee that code is correct, secure, or maintainable. The bottleneck has inverted: generation is easy, verification is hard. Verified Intent Development (VID) is a methodology built for this reality. It teaches teams how to specify intent up front, calibrate how much to trust AI output, and verify results with rigor matched to risk.

## Core Insight

**Verification is the professional skill.** In an AI-augmented workflow, value comes from judgment—deciding what to build, how to validate it, and when to accept or reject generated artifacts.

## Five Principles

1. **Intent Before Generation** – Never prompt without knowing what you need and how you will check it.
2. **Graduated Trust** – Align verification depth with impact, reversibility, exposure, and compliance risk.
3. **Understanding Over Acceptance** – Accept only code you understand at the depth its risk demands.
4. **Provenance Awareness** – Track where code came from, who reviewed it, and what that implies.
5. **Continuous Calibration** – Adjust practices as outcomes reveal gaps or unnecessary overhead.

## Core Practices

| Practice | Purpose | Where to Learn |
|----------|---------|----------------|
| **Intent Specification** | Capture requirements, boundaries, and success criteria before generating | Chapter 9 |
| **Verification Rituals** | Apply consistent post-generation checks scaled by trust level | Chapter 10 |
| **Learning Loop** | Track outcomes and recalibrate verification | Chapter 11 |
| **Provenance Hygiene** | Document origins, prompts, and reviews | Chapter 12 |

## Adoption Snapshot

1. **Start small** – Use intent specs + basic verification on personal work for two weeks.
2. **Introduce trust levels** – Apply the rubric from Appendix D to size verification effort.
3. **Instrument verification** – Adopt the checklists (Appendix F) and templates in `/templates` for commits, PRs, and audits.
4. **Retrospect** – Weekly, ask what escaped verification and what felt excessive; adjust.

## How to Engage Roles Quickly

- **Junior Engineers (Chapter 13):** Follow the 12-week curriculum emphasizing code reading, specification, and risk calibration.
- **Senior Engineers (Chapter 14):** Focus on mentorship, trust calibration, and architectural judgment.
- **Teams & Organizations (Chapters 15–16):** Build cultural norms (time for verification, provenance visibility, metrics focused on verified outputs).

## Business Outcomes

- **Reduced incidents:** Verification rituals catch logical, security, and provenance issues before production.
- **Faster onboarding:** Checklists + provenance make AI-heavy codebases maintainable.
- **Better predictability:** Graduated trust prevents “verify everything” slowdowns and “verify nothing” fire drills.

## Fast Path Through the Book

1. Preface + Chapter 1 for context.
2. Chapters 4–8 for principles.
3. Chapters 9–12 for practices.
4. Appendices D–F for tooling and checklists.

*Need a deeper dive? Continue with the real-world scenarios in Chapter 19 and the Verification Toolkit in Chapter 20. Use Appendix E’s decision trees for daily guidance.*
