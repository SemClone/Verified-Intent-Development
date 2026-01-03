## Chapter 8: Principle Five — Continuous Calibration

### The Principle

**Regularly assess whether your verification practices match actual risk and adjust accordingly.**

This principle prevents VID from becoming rigid. No methodology gets calibration right initially. Continuous calibration adapts to reality.

### The Feedback Loop

VID requires feedback from outcomes:

**Positive feedback:** Code that passed verification performs well in production. This validates the verification approach.

**Negative feedback:** Code that passed verification fails in production. This indicates verification was insufficient.

Both are valuable. The goal is verification that catches problems without excessive overhead — this requires empirical calibration.

### Calibration Questions

Regularly ask:

**Are we catching problems?**
- How often does verification reject code?
- What kinds of problems are caught?
- If verification rarely rejects anything, it might be too lenient.

**Are we missing problems?**
- What problems escape to production?
- Were they the kind verification should catch?
- If problems consistently escape, verification needs strengthening.

**Is verification effort appropriate?**
- Are we spending appropriate time on high-risk code?
- Are we spending excessive time on low-risk code?
- Adjust risk calibration if effort is misallocated.

**Are our risk assessments accurate?**
- When problems occur, were they in code we classified as high-risk?
- If high-risk problems come from "low-risk" code, our classification is wrong.

### Calibration Triggers

Recalibrate when:

- Production incidents occur
- New types of problems appear
- AI capabilities change (new models, new tools)
- Team composition changes
- Regulatory requirements change
- Project characteristics change

### The Anti-Pattern: Frozen Methodology

Some teams adopt VID (or any methodology) and never adjust. They follow practices that made sense initially but no longer fit.

Warning signs:
- "We've always done it this way"
- Verification levels that haven't changed in months
- No discussion of whether practices are working
- No adaptation to new AI capabilities

VID is a living methodology. It should evolve with your team and the technology.

---

