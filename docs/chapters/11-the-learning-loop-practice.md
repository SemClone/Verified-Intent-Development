## Chapter 11: The Learning Loop Practice

### The Practice

Track what happens to your verified code. Use outcomes to improve verification.

### The Tracking

Record:

- **What was generated and when**
- **What risk level was assigned**
- **What verification was performed**
- **What happened in production** (if problems occurred)

This doesn't require elaborate tooling. A simple log or notes suffice.

### The Review

Periodically (weekly or monthly) review:

- **Problems that escaped verification:** What problems made it to production? Should verification have caught them? Why didn't it?

- **Verification that seems excessive:** Are you spending significant time verifying code that never has problems? Can that verification be reduced?

- **Risk calibration accuracy:** Do your "high risk" and "low risk" assessments match reality?

### The Adjustment

Based on review, adjust:

- **Verification depth:** Increase for areas with escaping problems, decrease for areas with no problems
- **Risk calibration:** Update risk assessment criteria based on actual outcomes
- **Practices:** Add or remove verification steps based on what's working

### The Anti-Pattern: No Feedback

Teams that don't track outcomes can't calibrate. They might:
- Over-verify some areas while under-verifying others
- Miss entire categories of problems
- Stick with practices that don't work

The learning loop prevents methodology ossification.

---

