# Appendix A: Quick Reference

## The Five Principles

| Principle | Core Question |
|-----------|---------------|
| Intent Before Generation | What do I need and how will I verify it? |
| Graduated Trust | What's the risk and how much verification does that warrant? |
| Understanding Over Acceptance | Do I understand this well enough for its importance? |
| Provenance Awareness | Where did this come from and what does that imply? |
| Continuous Calibration | Are my verification practices working based on outcomes? |

## Verification Depth Quick Guide

| Risk Level | Characteristics | Verification |
|------------|-----------------|--------------|
| Low | Trivial impact, easily reversible, internal | Basic: Read, check intent, run automated tests |
| Medium | Moderate impact, standard production code | Standard: + trace logic, test edges, check integration |
| High | Significant impact, important systems | Deep: + adversarial testing, security review, peer review |
| Critical | Severe impact, security/financial/safety | Intensive: + formal verification, multiple reviewers, documentation |

## Intent Specification Template

```
What: [Functional requirement - what should this code do?]
Inputs: [Valid inputs and their types/constraints]
Outputs: [Expected outputs]
Edges: [Edge cases and how they should be handled]
Verify: [How I will verify correctness]
Risk: [Low/Medium/High/Critical and why]
```

---

