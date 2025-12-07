# Verified Intent Development (VID)

## A Methodology for the Age of AI-Augmented Software Development

**First Edition — December 2025**

---

## About This Book

This book introduces Verified Intent Development (VID), a methodology designed for software development in an era where artificial intelligence can generate code faster than humans can verify it.

**The core insight:** Code generation is no longer the bottleneck. Verification is.

VID addresses this new reality by building the judgment, practices, and habits that allow developers to move fast *with confidence*.

---

## Reading Options

### 📖 Complete Book
- **[VID_Methodology_Book.md](VID_Methodology_Book.md)** - The complete book in a single file (3,013 lines)

### 📚 Individual Chapters
Read chapters individually to focus on specific topics or to fit within context windows:

#### Preface
- [Preface](chapters/00-preface.md)

#### Part I: The New Reality
- [Chapter 1: The Inversion](chapters/01-the-inversion.md)
- [Chapter 2: Why Existing Approaches Fall Short](chapters/02-why-existing-approaches-fall-short.md)
- [Chapter 3: The Core Insight](chapters/03-the-core-insight.md)

#### Part II: The Five Principles
- [Chapter 4: Principle One — Intent Before Generation](chapters/04-principle-one-intent-before-generation.md)
- [Chapter 5: Principle Two — Graduated Trust](chapters/05-principle-two-graduated-trust.md)
- [Chapter 6: Principle Three — Understanding Over Acceptance](chapters/06-principle-three-understanding-over-acceptance.md)
- [Chapter 7: Principle Four — Provenance Awareness](chapters/07-principle-four-provenance-awareness.md)
- [Chapter 8: Principle Five — Continuous Calibration](chapters/08-principle-five-continuous-calibration.md)

#### Part III: Core Practices
- [Chapter 9: The Intent Specification Practice](chapters/09-the-intent-specification-practice.md)
- [Chapter 10: The Verification Ritual Practice](chapters/10-the-verification-ritual-practice.md)
- [Chapter 11: The Learning Loop Practice](chapters/11-the-learning-loop-practice.md)
- [Chapter 12: The Provenance Hygiene Practice](chapters/12-the-provenance-hygiene-practice.md)

#### Part IV: Building VID Skills
- [Chapter 13: The Junior Engineer's Path to Verification Mastery](chapters/13-for-junior-engineers.md) ⭐ *Expanded 12-week curriculum*
- [Chapter 14: For Senior Engineers](chapters/14-for-senior-engineers.md)
- [Chapter 15: For Teams and Organizations](chapters/15-for-teams-and-organizations.md)

#### Part V: Moving Forward
- [Chapter 16: Adopting VID](chapters/16-adopting-vid.md)
- [Chapter 17: The Continuing Evolution](chapters/17-the-continuing-evolution.md)
- [Chapter 18: Summary](chapters/18-summary.md)

#### Advanced Topics
- [Chapter 19: Patterns and Anti-Patterns](chapters/19-patterns-and-anti-patterns.md) 🔍 *Real-world scenarios*
- [Chapter 20: The Verification Toolkit](chapters/20-the-verification-toolkit.md) 🛠️ *Comprehensive techniques*

#### Appendices
- [Appendix A: Quick Reference](chapters/appendix-a-quick-reference.md)
- [Appendix B: Discussion Questions](chapters/appendix-b-discussion-questions.md)
- [Appendix C: Glossary](chapters/appendix-c-glossary.md)

---

## Quick Start

### For Junior Engineers
Start with:
1. [Chapter 1: The Inversion](chapters/01-the-inversion.md) - Understand the paradigm shift
2. [Chapter 4: Intent Before Generation](chapters/04-principle-one-intent-before-generation.md) - Learn the most important principle
3. [Chapter 13: The Junior Engineer's Path](chapters/13-for-junior-engineers.md) - Follow the 12-week curriculum

### For Senior Engineers
Start with:
1. [Chapter 1: The Inversion](chapters/01-the-inversion.md) - Understand the paradigm shift
2. [Chapter 5: Graduated Trust](chapters/05-principle-two-graduated-trust.md) - Learn to calibrate verification
3. [Chapter 14: For Senior Engineers](chapters/14-for-senior-engineers.md) - Apply your experience effectively

### For Teams
Start with:
1. [Chapter 2: Why Existing Approaches Fall Short](chapters/02-why-existing-approaches-fall-short.md) - Understand what's changing
2. [Chapter 15: For Teams and Organizations](chapters/15-for-teams-and-organizations.md) - Build a verification culture
3. [Chapter 16: Adopting VID](chapters/16-adopting-vid.md) - Practical adoption guide

### For Hands-On Learning
Start with:
1. [Chapter 19: Patterns and Anti-Patterns](chapters/19-patterns-and-anti-patterns.md) - See VID in practice
2. [Chapter 20: The Verification Toolkit](chapters/20-the-verification-toolkit.md) - Learn concrete techniques
3. [Appendix A: Quick Reference](chapters/appendix-a-quick-reference.md) - Keep this handy

---

## The Five Principles

1. **Intent Before Generation** - Never generate code without first articulating what you intend to build and how you will verify correctness
2. **Graduated Trust** - The level of verification should match the level of risk
3. **Understanding Over Acceptance** - Never accept code you don't understand at an appropriate level of depth
4. **Provenance Awareness** - Always know where code came from and what that origin implies
5. **Continuous Calibration** - Regularly assess whether your verification practices match actual risk and adjust accordingly

---

## The Core Practices

1. **Intent Specification** - Articulate functional requirements, boundaries, and success criteria before generating
2. **Verification Rituals** - Apply consistent verification practices after every generation, scaled to risk
3. **Learning Loop** - Track outcomes and adjust practices based on what you learn
4. **Provenance Hygiene** - Document and maintain awareness of code origins

---

## For AI Assistants

This book is designed to be accessible to AI coding assistants:

- **Full context**: Use [VID_Methodology_Book.md](VID_Methodology_Book.md) when you have sufficient context window
- **Targeted guidance**: Reference individual chapters for specific situations:
  - When generating code → [Chapter 4: Intent Before Generation](chapters/04-principle-one-intent-before-generation.md)
  - When assessing risk → [Chapter 5: Graduated Trust](chapters/05-principle-two-graduated-trust.md)
  - When reviewing code → [Chapter 20: The Verification Toolkit](chapters/20-the-verification-toolkit.md)
  - When learning from failures → [Chapter 19: Patterns and Anti-Patterns](chapters/19-patterns-and-anti-patterns.md)

---

## Structure

```
VID/
├── README.md                        # This index file
├── VID_Methodology_Book.md          # Complete book (single file)
└── chapters/                        # Individual chapters
    ├── 00-preface.md
    ├── 01-the-inversion.md
    ├── 02-why-existing-approaches-fall-short.md
    ├── 03-the-core-insight.md
    ├── 04-principle-one-intent-before-generation.md
    ├── 05-principle-two-graduated-trust.md
    ├── 06-principle-three-understanding-over-acceptance.md
    ├── 07-principle-four-provenance-awareness.md
    ├── 08-principle-five-continuous-calibration.md
    ├── 09-the-intent-specification-practice.md
    ├── 10-the-verification-ritual-practice.md
    ├── 11-the-learning-loop-practice.md
    ├── 12-the-provenance-hygiene-practice.md
    ├── 13-for-junior-engineers.md           # ⭐ Expanded curriculum
    ├── 14-for-senior-engineers.md
    ├── 15-for-teams-and-organizations.md
    ├── 16-adopting-vid.md
    ├── 17-the-continuing-evolution.md
    ├── 18-summary.md
    ├── 19-patterns-and-anti-patterns.md     # 🔍 Real scenarios
    ├── 20-the-verification-toolkit.md       # 🛠️ Techniques
    ├── appendix-a-quick-reference.md
    ├── appendix-b-discussion-questions.md
    └── appendix-c-glossary.md
```

---

## Contributing

This is a living methodology. As AI capabilities evolve and teams gain experience with VID, the practices will evolve.

Share your experiences, patterns, and adaptations to help the community learn together.

---

## License

Copyright © 2025. All rights reserved.

---

*"The developers who thrive in the AI-augmented future will be those who master verification, not just generation."*
