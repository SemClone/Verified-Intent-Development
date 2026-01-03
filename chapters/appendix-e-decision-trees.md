# Appendix E: Decision Trees

## Purpose

These decision trees guide you through common VID scenarios. Use them when you're uncertain about the right approach.

### Quick Index

1. **Should I Use AI for This Task?** — Decide when AI generation is appropriate.
2. **What Trust Level Should I Apply?** — Map risk scores to verification depth.
3. **How Do I Verify AI-Generated Tests?** — Ritual for accepting automated tests.
4. **Should I Accept This AI-Generated Code?** — Go/no-go check before merging.
5. **What Do I Do When Production Breaks?** — Recovery playbook when verification misses something.

---

## Decision Tree 1: Should I Use AI for This Task?

```
START: Need to write code
│
├─→ Is this security-critical code?
│   (authentication, authorization, crypto, payment, PII handling)
│   │
│   ├─→ YES → Use AI for reference only
│   │         Write code yourself
│   │         Apply Minimal Trust verification
│   │         Peer review mandatory
│   │
│   └─→ NO → Continue
│           │
│           ├─→ Do I have clear intent specification?
│               │
│               ├─→ YES → Safe to use AI
│               │         Generate code
│               │         Apply appropriate verification
│               │
│               └─→ NO → Stop!
│                       Write intent specification first
│                       Then use AI
```

**Key insight:** AI is a tool, not a shortcut. Intent first, generation second.

---

## Decision Tree 2: What Trust Level Should I Apply?

```
START: Code generated (by AI or human)
│
├─→ Calculate Risk Score:
│   Risk = (Impact × 3) + (Reversibility × 2) + (Exposure × 2) + Compliance
│   │
│   ├─→ Score 0-10
│   │   └─→ HIGH TRUST
│   │       Verification: 5-10 minutes
│   │       - Read and understand
│   │       - Verify against intent
│   │       - Run automated tests
│   │       - Spot-check one edge case
│   │
│   ├─→ Score 11-20
│   │   └─→ MODERATE TRUST
│   │       Verification: 15-30 minutes
│   │       - All High Trust checks
│   │       - Systematic edge case testing
│   │       - Security review for inputs
│   │       - Check error handling
│   │       - Review integration points
│   │
│   ├─→ Score 21-30
│   │   └─→ GUARDED TRUST
│   │       Verification: 30-60 minutes
│   │       - All Moderate Trust checks
│   │       - Comprehensive security review
│   │       - Adversarial testing
│   │       - Performance consideration
│   │       - Peer review recommended
│   │
│   └─→ Score 31-47
│       └─→ MINIMAL TRUST
│           Verification: 1-3 hours + peer review
│           - All Guarded Trust checks
│           - Mandatory peer review (2+ people)
│           - Security specialist if available
│           - Formal threat modeling
│           - Comprehensive test coverage
│           - Tech lead sign-off
│
│
├─→ ESCALATION CHECK:
│   │
│   └─→ Is ANY dimension ≥ 4?
│       OR Is Compliance ≥ 6?
│       │
│       ├─→ YES → Escalate to next trust level
│       │         Even if total score is low
│       │
│       └─→ NO → Use calculated trust level
```

**Key insight:** A single high-risk dimension can be catastrophic. Escalate accordingly.

---

## Decision Tree 3: How Do I Verify AI-Generated Tests?

```
START: AI generated tests
│
├─→ Step 1: Check Test Provenance
│   │
│   ├─→ How were tests generated?
│       │
│       ├─→ From specification
│       │   └─→ Moderate confidence
│       │       Apply standard verification
│       │
│       ├─→ From code
│       │   └─→ Low confidence
│       │       Tests may duplicate code bugs
│       │       Apply intensive verification
│       │
│       └─→ From examples
│           └─→ Medium confidence
│               May miss edge cases
│               Apply thorough verification
│
├─→ Step 2: Review Test Quality
│   │
│   ├─→ Read test names and assertions
│   ├─→ Do they test behavior or implementation?
│   │   │
│   │   ├─→ Implementation → RED FLAG
│   │   │   Tests are brittle
│   │   │   Rewrite to test behavior
│   │   │
│   │   └─→ Behavior → GOOD
│   │       Continue verification
│   │
│   └─→ Are assertions correct?
│       │
│       ├─→ Uncertain → Manually verify expected values
│       └─→ Confident → Continue
│
├─→ Step 3: Check Coverage
│   │
│   ├─→ What's NOT tested?
│   │   - Edge cases (empty, null, max, min)
│   │   - Error conditions
│   │   - Security scenarios
│   │   - Integration points
│   │
│   └─→ Add missing tests
│
├─→ Step 4: Meta-Verification
│   │
│   ├─→ For Important+ code:
│   │   Run mutation testing
│   │   │
│   │   ├─→ Mutation score < 80%
│   │   │   └─→ Tests are weak
│   │   │       Add stronger tests
│   │   │
│   │   └─→ Mutation score ≥ 80%
│   │       └─→ Tests are adequate
│   │           Proceed
│   │
│   └─→ For Critical code:
│       Add property-based tests
│       Independent test review
│       Mutation score ≥ 90%
│
└─→ ACCEPT or REJECT
    │
    ├─→ ACCEPT if:
    │   - Tests are behavioral
    │   - Assertions are correct
    │   - Coverage is appropriate
    │   - Mutation score is adequate
    │
    └─→ REJECT if:
        - Tests test implementation
        - Assertions are wrong/unknown
        - Major gaps in coverage
        - Low mutation score
```

**Key insight:** Tests need verification just like production code.

---

## Decision Tree 4: Should I Accept This AI-Generated Code?

```
START: AI generated code
│
├─→ Question 1: Do I understand what this code does?
│   │
│   ├─→ NO → STOP
│   │       │
│   │       ├─→ Can I learn enough to understand?
│   │       │   │
│   │       │   ├─→ YES → Spend time learning
│   │       │   │         Then re-evaluate
│   │       │   │
│   │       │   └─→ NO → Options:
│   │       │             A) Simplify the code
│   │       │             B) Get help from expert
│   │       │             C) Reject and write manually
│   │       │
│   │       └─→ DON'T ACCEPT CODE YOU DON'T UNDERSTAND
│   │
│   └─→ YES → Continue to Question 2
│
├─→ Question 2: Does it match my intent specification?
│   │
│   ├─→ NO → Reject or modify
│   │        AI solved a different problem
│   │
│   └─→ YES → Continue to Question 3
│
├─→ Question 3: Did verification pass?
│   │
│   ├─→ NO → What failed?
│   │        │
│   │        ├─→ Tests failed → Fix or regenerate
│   │        ├─→ Edge cases wrong → Fix or regenerate
│   │        ├─→ Security issue → Fix or regenerate
│   │        └─→ Can't be fixed → Reject, write manually
│   │
│   └─→ YES → Continue to Question 4
│
├─→ Question 4: Is verification depth appropriate for risk?
│   │
│   ├─→ NO → Do I need deeper verification?
│   │        │
│   │        ├─→ YES → Perform additional verification
│   │        │         Then re-evaluate
│   │        │
│   │        └─→ Verification was too shallow
│   │            Return to Decision Tree 2
│   │
│   └─→ YES → Continue to Question 5
│
├─→ Question 5: Can I maintain this code in 6 months?
│   │
│   ├─→ NO → Issues:
│   │        - Poor naming?
│   │        - Too complex?
│   │        - Unclear logic?
│   │        │
│   │        └─→ Refactor for maintainability
│   │            Then re-evaluate
│   │
│   └─→ YES → Continue to Final Check
│
└─→ FINAL CHECK: All conditions met?
    │
    ├─→ I understand the code
    ├─→ It matches my intent
    ├─→ It passed appropriate verification
    ├─→ Risk-appropriate verification depth
    └─→ I can maintain it
    │
    ├─→ ALL YES → ACCEPT
    │              Document provenance
    │              Commit with verification notes
    │
    └─→ ANY NO → REJECT or FIX
                 Don't compromise on quality
```

**Key insight:** Acceptance is not a yes/no decision. It's a series of quality gates.

---

## Decision Tree 5: What Do I Do When Production Breaks?

```
START: Production incident
│
├─→ Question 1: Is this code AI-generated?
│   │
│   ├─→ Don't know → PROBLEM
│   │                Provenance tracking failure
│   │                (Fix this for future)
│   │
│   ├─→ NO (human-written) → Standard incident response
│   │
│   └─→ YES (AI-generated) → Continue to Question 2
│
├─→ Question 2: What verification was performed?
│   │
│   ├─→ Check commit message / PR notes
│   │   What trust level?
│   │   What checks were done?
│   │
│   ├─→ Unknown → PROBLEM
│   │             Verification documentation failure
│   │             (Fix this for future)
│   │
│   └─→ Known → Continue to Question 3
│
├─→ Question 3: Should verification have caught this?
│   │
│   ├─→ YES → Verification failure
│   │        │
│   │        └─→ Root cause analysis:
│   │            - Was risk score too low?
│   │            - Was verification incomplete?
│   │            - Was verification technique wrong?
│   │            │
│   │            └─→ Update verification practices
│   │                Prevent similar failures
│   │
│   └─→ NO → Acceptable miss
│                (edge case beyond reasonable verification)
│                │
│                └─→ Add regression test
│                    Update risk calibration if needed
│
├─→ Question 4: Can the original developer fix it?
│   │
│   ├─→ YES → Have them fix it
│   │         (they understand the code)
│   │
│   └─→ NO → Understanding gap
│              │
│              ├─→ Code was not understood when accepted
│              │   └─→ PROBLEM: Violated Understanding principle
│              │       (Fix this for future)
│              │
│              └─→ Developer is unavailable
│                  └─→ Hope someone can figure it out
│                      (This is why understanding matters)
│
└─→ RESOLUTION PATH:
    │
    ├─→ Immediate: Fix the bug
    │
    ├─→ Short-term: Add regression test
    │               Update documentation
    │
    └─→ Long-term: Calibrate verification practices
                   If verification should have caught it:
                   - Update risk scoring
                   - Update verification rituals
                   - Share learning with team
```

**Key insight:** Production incidents are learning opportunities. Update practices accordingly.

---

## Decision Tree 6: How Do I Onboard a New Developer to VID?

```
START: New developer joins team
│
├─→ Week 1: Foundation
│   │
│   ├─→ Assign reading:
│   │   - VID One-Page Overview
│   │   - Chapter 1: The Inversion
│   │   - Chapter 4: Intent Before Generation
│   │
│   ├─→ 1-hour 1-on-1 discussion:
│   │   - Why does VID matter?
│   │   - How does it work?
│   │   - What are our team norms?
│   │
│   └─→ Shadow experienced developer:
│       Watch full VID cycle:
│       - Intent specification
│       - Generation
│       - Verification
│       - Documentation
│
├─→ Week 2: Supervised Practice
│   │
│   ├─→ Pair program with mentor
│   │   New dev drives, mentor guides
│   │   Focus on intent specification
│   │
│   ├─→ Low-risk task
│   │   New dev applies VID
│   │   Mentor reviews every step
│   │
│   └─→ Debrief:
│       - What went well?
│       - What was confusing?
│       - Clarify principles
│
├─→ Week 3: Guided Independence
│   │
│   ├─→ Medium-risk task
│   │   New dev works independently
│   │   Mentor reviews verification notes
│   │
│   ├─→ Join team calibration session
│   │   Participate in risk scoring
│   │   Learn team norms
│   │
│   └─→ Check understanding:
│       Can they explain:
│       - The 5 principles?
│       - How to score risk?
│       - When to escalate verification?
│
└─→ Week 4: Independent with Oversight
    │
    ├─→ Full VID cycle independently
    │   Mentor spot-checks
    │
    ├─→ Can take on any risk level
    │   With appropriate oversight
    │
    └─→ Ready to mentor others
        After 3 months of practice
```

**Key insight:** VID is learned by doing, not just reading. Pair learning accelerates adoption.

---

## Decision Tree 7: When Should I Update Our VID Practices?

```
START: Considering practice changes
│
├─→ Trigger: Why are we considering changes?
│   │
│   ├─→ Problems escaping to production
│   │   │
│   │   └─→ Root cause analysis:
│   │       │
│   │       ├─→ Risk scores too low?
│   │       │   └─→ Recalibrate risk scoring
│   │       │       Update team norms
│   │       │
│   │       ├─→ Verification incomplete?
│   │       │   └─→ Update verification rituals
│   │       │       Add missing checks
│   │       │
│   │       └─→ Verification technique ineffective?
│   │           └─→ Adopt better techniques
│   │               Train team
│   │
│   ├─→ Verification too time-consuming
│   │   │
│   │   └─→ Analysis:
│   │       │
│   │       ├─→ Verifying low-risk code too deeply?
│   │       │   └─→ Recalibrate downward
│   │       │       Trust level adjustments
│   │       │
│   │       ├─→ Inefficient verification workflow?
│   │       │   └─→ Streamline process
│   │       │       Remove redundant steps
│   │       │
│   │       └─→ Team inexperienced?
│   │           └─→ More training
│   │               Practice builds speed
│   │
│   ├─→ New technology or AI capability
│   │   │
│   │   └─→ Evaluate impact:
│   │       │
│   │       ├─→ AI generates better code?
│   │       │   └─→ Don't reduce verification yet
│   │       │       Wait for data
│   │       │       Recalibrate after 3 months
│   │       │
│   │       ├─→ AI can assist verification?
│   │       │   └─→ Experiment carefully
│   │       │       Human still arbitrates
│   │       │
│   │       └─→ New code patterns?
│   │           └─→ Assess new risks
│   │               Update risk framework
│   │
│   └─→ Team growth or composition change
│       │
│       └─→ Ensure consistency:
│           - Onboard new members
│           - Recalibrate as team
│           - Document team norms
│
├─→ Decision: Should we change practices?
│   │
│   ├─→ YES → Process:
│   │        │
│   │        ├─→ Propose changes
│   │        ├─→ Discuss with team
│   │        ├─→ Try for 2 weeks
│   │        ├─→ Measure impact
│   │        └─→ Keep, modify, or revert
│   │
│   └─→ NO → Continue current practices
│            Next review in 1 month
│
└─→ WHEN TO REVIEW:
    │
    ├─→ Monthly retrospectives (lightweight)
    ├─→ Quarterly deep reviews (comprehensive)
    ├─→ After major incidents (root cause)
    └─→ When team composition changes (recalibrate)
```

**Key insight:** VID is continuous calibration. Adjust based on evidence, not opinion.

---

## How to Use These Decision Trees

### In Daily Work

**Before generating code:** Use Decision Tree 1 (Should I use AI?)

**After generating code:** Use Decision Tree 2 (What trust level?) and Tree 4 (Should I accept?)

**When verifying tests:** Use Decision Tree 3 (How to verify tests?)

### In Incident Response

**After production issues:** Use Decision Tree 5 (What went wrong?)

### In Team Development

**Onboarding:** Use Decision Tree 6 (How to onboard?)

**Process improvement:** Use Decision Tree 7 (When to update?)

### Customization

These decision trees are starting points. Your team should:
- Adapt them to your context
- Add team-specific branches
- Document your variations
- Share improvements

---

## Quick Reference

Print these and keep at your desk:

**Pre-Generation:** Intent first, always
**Post-Generation:** Verify appropriately
**In Incidents:** Learn and calibrate
**In Onboarding:** Pair and practice
**In Retrospectives:** Measure and adjust

---

*Return to [Table of Contents](../README.md)*
