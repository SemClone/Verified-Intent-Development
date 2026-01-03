## Chapter 5: Principle Two — Graduated Trust

### The Principle

**The level of verification should match the level of risk. Not all code deserves equal scrutiny.**

This principle provides efficiency. Verifying everything deeply is impractical. Verifying nothing is dangerous. VID graduates verification based on risk.

### Understanding Risk

Risk in software has multiple dimensions:

**Impact if wrong:** What happens if this code has a bug?
- A typo in a log message: minimal impact
- A bug in payment processing: financial loss, customer trust damage
- A security flaw in authentication: potential breach

**Reversibility:** How easily can we recover from problems?
- A bug in a stateless API: fix and redeploy
- Data corruption: may require complex recovery
- Deleted customer data: potentially unrecoverable

**Exposure:** How widely is this code used?
- Internal tool for one team: limited exposure
- Core library used everywhere: bugs affect everything
- Public API: bugs affect external parties

**Regulatory sensitivity:** What compliance requirements apply?
- Internal tooling: minimal regulatory concern
- Healthcare data: HIPAA requirements
- Financial transactions: PCI-DSS requirements

### The Trust Spectrum

VID defines a spectrum of trust levels:

**High Trust (minimal verification):** AI output accepted with automated checks only. Appropriate for low-risk, easily reversible code.

**Moderate Trust (standard verification):** AI output reviewed for functional correctness. Appropriate for typical production code.

**Guarded Trust (thorough verification):** AI output reviewed in depth for correctness, security, and maintainability. Appropriate for important code.

**Minimal Trust (intensive verification):** AI used only for suggestions. Human writes or extensively rewrites all code. Multiple reviewers. Appropriate for high-risk code.

### Scoring Before Trusting

Before selecting a trust level, score the work using the VID risk formula (detailed rubric in Appendix D):

```
Risk Score = (Impact × 3) + (Reversibility × 2) + (Exposure × 2) + Compliance
```

| Dimension      | Scale | Max Contribution |
|----------------|-------|------------------|
| Impact         | 1-5   | 15               |
| Reversibility  | 1-5   | 10               |
| Exposure       | 1-5   | 10               |
| Compliance     | 0-10  | 10               |

Trust levels map to total scores:
- **0-10:** High Trust
- **11-20:** Moderate Trust
- **21-30:** Guarded Trust
- **31-47:** Minimal Trust

Escalate to the next level if Impact, Reversibility, or Exposure scores 4 or higher, OR if Compliance is 6+ (regulated domains). The quick calculation keeps risk discussions objective in the moment while Appendix D provides the deeper rubric.

### Calibrating Trust

For any code generation, ask:

1. What's the worst case if this code is wrong?
2. How easily can we recover from problems?
3. How widely is this code exposed?
4. What compliance requirements apply?

The highest-risk answer determines your trust level.

Example calibrations:

**Utility function for formatting dates:**
- Worst case: Dates display incorrectly
- Recovery: Easy redeploy
- Exposure: Internal dashboard
- Compliance: None
- **Calibration: High Trust**

**Input validation for a public API:**
- Worst case: Security vulnerability
- Recovery: Depends on exploitation
- Exposure: Internet-facing
- Compliance: Potential
- **Calibration: Minimal Trust**

### The Trap of Uniform Treatment

Teams often fall into treating all code the same:

**Uniform high scrutiny:** Every function gets intensive review. This is unsustainable. Reviews become cursory because there's too much to review carefully.

**Uniform low scrutiny:** Everything gets quick acceptance. Risk accumulates invisibly until it manifests as incidents.

VID's graduated approach focuses human attention where it matters. It's not about less verification overall — it's about appropriate verification everywhere.

---
