# Verified Intent Development (VID) — One-Page Overview

**A methodology for AI-augmented software development**

---

## The Problem

**AI has inverted the software development bottleneck.**

For 50 years, writing code was hard and verifying it was easy. Every methodology (Waterfall, Agile, Scrum, XP) optimized for expensive code production.

In 2023-2025, AI changed this:
- Code generation: seconds
- Code verification: still requires human judgment

**The new bottleneck: Verification, not generation.**

Without systematic verification, teams ship code faster—with more bugs, security vulnerabilities, and technical debt.

---

## The Solution: VID

VID builds verification into AI-augmented development through **five principles** and **four practices**.

---

## The Five Principles

### 1. Intent Before Generation
Never generate code without first specifying what you need and how you'll verify it.

### 2. Graduated Trust
Match verification depth to risk. Critical code gets intensive verification. Trivial code gets basic checks.

### 3. Understanding Over Acceptance
Never accept code you don't understand at an appropriate level. Understanding debt compounds.

### 4. Provenance Awareness
Track where code comes from (AI vs. human) and what verification it received.

### 5. Continuous Calibration
Adjust verification practices based on what problems escape to production.

---

## The Four Practices

### 1. Intent Specification
Before generating code:
- Define functional requirements
- Identify edge cases
- Specify success criteria
- Assess risk level

### 2. Verification Rituals
After generating code, verify systematically:
- **High Trust** (low-risk): 5-10 min basic checks
- **Moderate Trust**: 15-30 min standard review
- **Guarded Trust**: 30-60 min thorough verification
- **Minimal Trust** (critical): 1-3 hours + peer review

### 3. Learning Loop
- Track verification outcomes
- Note what escapes to production
- Adjust practices accordingly
- Improve risk calibration

### 4. Provenance Hygiene
- Mark AI-generated code in commits
- Document verification performed
- Maintain team awareness of code origins

---

## Risk Assessment Quick Formula

**Risk Score = (Impact × 3) + (Reversibility × 2) + (Exposure × 2) + Compliance**

Each factor rated 1-5 (Compliance 0-10), yields total 0-47:
- **0-10:** High Trust
- **11-20:** Moderate Trust
- **21-30:** Guarded Trust
- **31-47:** Minimal Trust

**Impact:** What if this is wrong? (1=trivial, 5=critical)
**Reversibility:** How easy to fix? (1=instant, 5=impossible)
**Exposure:** Who's affected? (1=dev only, 5=public)
**Compliance:** Regulatory requirements? (0=none, 10=existential)

---

## When to Use VID

**VID is essential when:**
- Using AI coding assistants (GitHub Copilot, ChatGPT, Claude)
- Code is generated faster than traditional development
- Team lacks confidence in AI output quality
- Security or compliance requirements exist

**VID is complementary to:**
- Agile, Scrum, Kanban
- Test-Driven Development
- Existing code review practices

**VID is NOT:**
- A replacement for Agile/Scrum
- A prompt engineering guide
- A productivity framework
- Test-Driven Development

---

## Getting Started (10 Minutes)

**Week 1:** Practice Intent Specification
- Before every AI generation, write down: what you need, edge cases, how you'll verify
- Spend 2 minutes planning, save hours debugging

**Week 2:** Add Verification Rituals
- After every generation, apply basic ritual: read code, verify against intent, run tests, check one edge case
- Build the habit

**Week 3:** Calibrate Risk
- Assess risk for each task using the formula above
- Match verification depth to risk level

**Week 4+:** Track and Improve
- Note what verification catches vs. what escapes
- Adjust your practices

---

## Key Metrics

Track these to measure VID effectiveness:

1. **Defects caught in verification** (before production)
2. **Defects escaped to production** (after verification)
3. **Time spent verifying** vs. **time spent debugging production issues**
4. **Mean time to understand code** (6 months after generation)

**Success looks like:**
- More bugs caught during verification
- Fewer production incidents
- Higher confidence in AI-generated code
- Faster debugging when issues occur

---

## Common Objections & Responses

**"VID slows us down"**
Verification takes time upfront. But debugging production incidents, rewriting code you don't understand, and recovering from security breaches takes more time. VID front-loads small costs to avoid large costs.

**"AI will get better, making VID obsolete"**
AI will improve at generation. Verification will remain necessary because it's not mechanical—it's about aligning software behavior with human intent. Even perfect code generation requires intent verification.

**"We already do code review"**
Traditional code review assumes the author understands what they wrote. VID addresses AI-generated code where the developer may not fully understand the output. VID provides systematic verification beyond "does it look okay?"

---

## Resources

**Full Methodology:** https://github.com/SemClone/Verified-Intent-Development

**Start with these chapters:**
- Chapter 1: The Inversion (understand the paradigm shift)
- Chapter 4: Intent Before Generation (most important principle)
- Appendix D: Risk Scoring Rubric (actionable risk assessment)

**For specific needs:**
- Junior engineers: Chapter 13 (12-week curriculum)
- Senior engineers: Chapter 14
- Teams: Chapter 15
- Test verification: Chapter 21
- Real-world examples: Chapter 19

---

## Attribution

**Verified Intent Development (VID) Methodology**
Created by SEMCL.ONE Community
Licensed under CC BY-SA 4.0

https://github.com/SemClone/Verified-Intent-Development

---

**The Bottom Line**

In the AI era, writing code is easy. Verifying code is hard.

VID makes verification systematic, not optional.

Developers who master verification will thrive. VID provides the framework.

---

*One page. Five principles. Four practices. Better code.*
