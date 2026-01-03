# Appendix D: Risk Scoring Rubric

## Purpose

This rubric provides a systematic method for assessing code risk and determining appropriate verification depth. It transforms the conceptual framework from Chapter 5 (Graduated Trust) into an actionable decision tool.

**Use this when:**
- Deciding verification depth for AI-generated code
- Calibrating team practices
- Discussing edge cases in code review
- Training new team members on risk assessment

---

## The Four Risk Dimensions

### 1. Impact (I)

**Question:** What's the worst-case outcome if this code has a bug?

| Score | Severity | Description | Examples |
|-------|----------|-------------|----------|
| **1** | Trivial | Cosmetic issue, no functional impact | Log message typo, comment formatting, internal debug output |
| **2** | Minor | Annoyance, easy workaround exists | UI alignment issue, suboptimal sort order, redundant API call |
| **3** | Moderate | User-facing problem, no data loss | Feature doesn't work, incorrect calculation in non-critical context, slow performance |
| **4** | Serious | Data corruption, security issue, or financial impact | Payment calculation error, data loss, authentication bypass, PII exposure |
| **5** | Critical | System-wide failure, safety issue, legal liability | Complete system outage, financial fraud, regulatory violation, safety system failure |

### 2. Reversibility (R)

**Question:** How easily can we recover if this breaks in production?

| Score | Recovery Difficulty | Description | Examples |
|-------|---------------------|-------------|----------|
| **1** | Instant | Fix and redeploy, no persistent effects | Stateless API endpoint, display logic, formatting function |
| **2** | Easy | Redeploy + minor cleanup (< 1 hour) | Cache invalidation needed, restart required, temporary config change |
| **3** | Moderate | Significant manual recovery (hours) | Database migration rollback, batch job rerun, customer notifications |
| **4** | Hard | Complex recovery, possible data loss (days) | Manual data correction, multi-system coordination, partial data unrecoverable |
| **5** | Impossible/Severe | Permanent data loss or irreversible actions | Deleted production data, sent incorrect payments, compliance breach recorded |

### 3. Exposure (E)

**Question:** How many users/systems are affected?

| Score | Reach | Description | Examples |
|-------|-------|-------------|----------|
| **1** | Developer Only | Only affects development environment | Local dev tool, personal script, debug utility |
| **2** | Team Internal | Affects only your immediate team | Team dashboard, internal CI pipeline, developer tooling |
| **3** | Company Internal | Affects internal users across organization | Employee portal, internal API, admin tools |
| **4** | External Limited | Affects external users in controlled way | Beta features, specific customer segment, partner API |
| **5** | Public/Universal | Affects all users or public-facing systems | Public website, main product API, critical service |

### 4. Compliance (C)

**Question:** What regulatory or legal requirements apply?

| Score | Regulatory Burden | Description | Examples |
|-------|-------------------|-------------|----------|
| **0** | None | No special compliance requirements | Internal tooling, general business logic |
| **2** | Basic | Industry best practices apply | Standard web security, data retention policies |
| **4** | Moderate | Specific regulations apply | GDPR (personal data), accessibility requirements, SOC2 controls |
| **6** | Significant | Strict regulatory oversight | HIPAA (healthcare), PCI-DSS (payment cards), SOX (financial reporting) |
| **8** | Critical | Severe penalties for violations | FDA (medical devices), financial trading regulations, safety-critical systems |
| **10** | Existential | Violations could end business | Critical infrastructure, life-safety systems, national security |

---

## Risk Score Calculation

### Formula

```
Risk Score = (I × 3) + (R × 2) + (E × 2) + C
```

**Why weighted?**
- **Impact (3×)**: Most important—severity of what goes wrong
- **Reversibility (2×)**: Affects recovery cost and learning opportunity
- **Exposure (2×)**: Determines blast radius
- **Compliance (1×)**: No multiplier needed (scale is already 0-10 vs. 1-5 for other dimensions)

**Range:** 0 (minimal risk) to 47 (maximum risk)

---

## Trust Level Mapping

| Risk Score | Trust Level | Verification Ritual | Time Investment |
|------------|-------------|-------------------|-----------------|
| **0-10** | **High Trust** | High Trust Ritual | 5-10 minutes |
| **11-20** | **Moderate Trust** | Moderate Trust Ritual | 15-30 minutes |
| **21-30** | **Guarded Trust** | Guarded Trust Ritual | 30-60 minutes |
| **31-47** | **Minimal Trust** | Minimal Trust Ritual | 1-3 hours + peer review |

---

## Master Calibration Table

This table consolidates the risk scoring (from above), verification rituals (from Chapter 10), and mandatory requirements into a single reference.

| Trust Level | Risk Score | Ritual Name | Mandatory Requirements | Time |
|-------------|------------|-------------|----------------------|------|
| **High Trust** | 0-10 | High Trust Ritual | Read code (no skimming), verify against intent, run automated tests, spot-check 1 edge case | 5-10 min |
| **Moderate Trust** | 11-20 | Moderate Trust Ritual | All High Trust, plus: Input partitioning, check error handling, review integration points | 15-30 min |
| **Guarded Trust** | 21-30 | Guarded Trust Ritual | All Moderate Trust, plus: STRIDE threat analysis, adversarial testing, performance check, peer review recommended | 30-60 min |
| **Minimal Trust** | 31-47 | Minimal Trust Ritual | All Guarded Trust, plus: Mandatory 2+ peer reviewers, security specialist, mutation testing (>90%), tech lead sign-off | 1-3+ hours |

### Universal Escalation Rules

**Regardless of the total score, escalate to the next highest Trust Level if:**

- **High Single Dimension:** Impact, Reversibility, or Exposure ≥ 4
- **Regulatory Sensitivity:** Compliance score ≥ 6 (e.g., HIPAA, PCI-DSS, SOX)
- **Critical Impact:** Impact = 5 defaults immediately to Minimal Trust

**Rationale:** A single high-risk dimension can cause catastrophic failure, even if the total score is low.

---

## Verification Requirements by Trust Level

### High Trust (Score 0-10)
- Read and understand the code
- Verify against intent specification
- Run automated tests (linting, type checking)
- Spot-check one edge case
- Brief documentation of what code does

**Skip:** Deep security analysis, extensive edge case testing, peer review

### Moderate Trust (Score 11-20)
**Everything in High Trust, plus:**
- Systematic edge case testing (input partitioning)
- Security review for user inputs
- Check error handling
- Review integration points
- Document edge cases and assumptions

**Skip:** Formal verification, multiple reviewers, extensive security testing

### Guarded Trust (Score 21-30)
**Everything in Moderate Trust, plus:**
- Comprehensive security review (STRIDE analysis)
- Adversarial testing (try to break it)
- Performance/scalability consideration
- Maintainability refactoring if needed
- Peer review recommended
- Document security considerations and trade-offs

**Skip:** Formal methods, external audit (unless compliance requires)

### Minimal Trust (Score 31-47)
**Everything in Guarded Trust, plus:**
- **Mandatory** peer review (minimum 1, prefer 2+ reviewers)
- Security specialist review if available
- Formal threat modeling
- Comprehensive test coverage with mutation testing
- Consider formal verification for critical logic
- Document thoroughly (architecture decisions, security model, failure modes)
- Sign-off from tech lead or senior engineer
- Incident response plan consideration

---

## Worked Examples

### Example 1: Log Message Formatter

**Code:** Formats timestamps in application logs

**Assessment:**
- **Impact (I):** 1 (cosmetic, doesn't affect functionality)
- **Reversibility (R):** 1 (instant fix if needed)
- **Exposure (E):** 2 (internal team uses logs)
- **Compliance (C):** 0 (no special requirements)

**Calculation:** (1×3) + (1×2) + (2×2) + 0 = **9**

**Result:** **High Trust** — 5-10 minute verification
- Read code, verify format makes sense
- Test with a few timestamps
- Check it handles null/undefined
- Ship it

---

### Example 2: User Profile Update Endpoint

**Code:** API endpoint that updates user profile information

**Assessment:**
- **Impact (I):** 3 (user-facing, could break profiles)
- **Reversibility (R):** 3 (need to identify and fix affected users)
- **Exposure (E):** 4 (all external users)
- **Compliance (C):** 4 (GDPR applies to personal data)

**Calculation:** (3×3) + (3×2) + (4×2) + 4 = **27**

**Result:** **Guarded Trust** — 45-60 minute verification
- Comprehensive input validation review
- Check authorization (can user update this profile?)
- SQL injection / XSS vulnerability testing
- Verify GDPR consent and audit logging
- Test edge cases (empty fields, special characters, unicode)
- Get peer review
- Document security model

---

### Example 3: Payment Processing Function

**Code:** Calculates and processes customer refunds

**Assessment:**
- **Impact (I):** 5 (financial loss if wrong)
- **Reversibility (R):** 4 (money already sent, hard to recover)
- **Exposure (E):** 4 (affects all customers who request refunds)
- **Compliance (C):** 6 (PCI-DSS, financial regulations)

**Calculation:** (5×3) + (4×2) + (4×2) + 6 = **37**

**Result:** **Minimal Trust** — 2-3 hours + multiple reviewers
- **Do NOT accept AI output without deep understanding**
- Verify refund calculation logic step by step
- Test idempotency (refund not processed twice)
- Verify amount limits and fraud checks
- Check audit trail and logging
- Test with real scenarios from finance team
- Security review for manipulation attempts
- Peer review from 2+ engineers
- Tech lead sign-off required
- Document refund policy, edge cases, rollback procedures

---

### Example 4: Cache Implementation

**Code:** LRU cache with TTL support for API responses

**Assessment:**
- **Impact (I):** 3 (incorrect caching could serve stale data)
- **Reversibility (R):** 2 (clear cache and redeploy)
- **Exposure (E):** 4 (affects all API users)
- **Compliance (C):** 2 (standard data handling)

**Calculation:** (3×3) + (2×2) + (4×2) + 2 = **24**

**Result:** **Guarded Trust** — 45-60 minutes
- Understand cache eviction algorithm deeply
- Test TTL expiration works correctly
- Test cache hit/miss scenarios
- Check for memory leaks (cache grows unbounded?)
- Verify thread-safety if concurrent access
- Performance test with realistic load
- Document cache size limits and behavior

---

## Special Cases & Escalation

### When Scores Disagree

**Scenario:** Low overall score but ONE dimension is very high

**Example:** Internal tool (E=2) with potential data loss (R=5)

**Rule:** **Escalate to next trust level** when:
- Impact, Reversibility, or Exposure ≥ 4, regardless of total score
- Compliance ≥ 6
- Impact = 5 (always Minimal Trust)

**Rationale:** A single high-risk dimension can cause catastrophic failure.

---

### When in Doubt

**If you're uncertain about scoring:**

1. **Score conservatively** (round up, not down)
2. **Discuss with team** — calibration improves with practice
3. **Document the edge case** for future reference
4. **Default to higher verification** — overconfidence is riskier than over-verification

**Red flags that suggest higher score:**
- "This is just a quick fix"
- "We can patch it later if there's a problem"
- "No one will probably use this edge case"
- "The AI seems confident"

---

## Team Calibration Exercise

**Purpose:** Align team understanding of risk levels

**Process:**

1. **Select 10 code scenarios** from recent work
2. **Individually score** each scenario using this rubric
3. **Compare scores** — Where do you disagree?
4. **Discuss discrepancies:**
   - Why did you score Impact as 3 vs. 4?
   - What assumptions led to different Exposure scores?
5. **Agree on team norms:**
   - Are we consistently conservative or aggressive?
   - Which dimension do we struggle with most?
6. **Repeat quarterly** — Keep calibration fresh

**Sample Scenarios for Calibration:**

| Scenario | I | R | E | C | Score | Trust Level |
|----------|---|---|---|---|-------|-------------|
| Sort algorithm for internal admin list | ? | ? | ? | ? | ? | ? |
| Password reset token generation | ? | ? | ? | ? | ? | ? |
| CSS styling for marketing page | ? | ? | ? | ? | ? | ? |
| Database migration to add column | ? | ? | ? | ? | ? | ? |
| API rate limiting implementation | ? | ? | ? | ? | ? | ? |

---

## Integration with Development Workflow

### In Code Review

**PR Template Addition:**
```markdown
## VID Risk Assessment
- Impact: [1-5]
- Reversibility: [1-5]
- Exposure: [1-5]
- Compliance: [0-10]
- **Total Risk Score:** [calculated]
- **Trust Level:** [High/Moderate/Guarded/Minimal]

**Verification performed:**
- [ ] [List specific verification steps for this trust level]
```

### In Task Planning

**Before starting work, assess:**
1. What trust level will this require?
2. Do I have time/expertise for that level of verification?
3. Do I need to involve others (peer review, security team)?
4. Should this be broken into smaller, lower-risk pieces?

### In Incident Retrospectives

**After production incidents:**
1. What was the original risk score?
2. Was it accurate?
3. If inaccurate, which dimension was misjudged?
4. How can we improve risk assessment?

---

## Customization Guidelines

> **⚠️ Advanced Topic:** The standard rubric (0-10, 11-20, 21-30, 31-47) is the recommended starting point for all teams. Only customize after using the standard rubric for at least 3 months and gathering data about your specific context.

**This rubric is a starting point.** Adapt it to your context only if data shows systematic miscalibration:

### Adjust Weights (Advanced)
If compliance is critical for your domain (healthcare, finance) and you find compliance issues consistently underweighted:
```
Risk Score = (I × 3) + (R × 2) + (E × 2) + (C × 1.5)
```

**Caution:** Changing weights affects all scores. Recalibrate thresholds accordingly.

### Adjust Thresholds (Advanced)
**Do not adjust thresholds without data.** If your retrospectives show consistent miscalibration (e.g., "High Trust" items frequently cause incidents), consider:

- **More conservative:** Shift thresholds down by 2 points across all levels
- **Less conservative:** Shift thresholds up by 2 points across all levels

**Example conservative adjustment:**
```
0-8:   High Trust      (instead of 0-10)
9-18:  Moderate Trust  (instead of 11-20)
19-28: Guarded Trust   (instead of 21-30)
29+:   Minimal Trust   (instead of 31-47)
```

**Never use different thresholds across team members.** Team-wide consistency is more important than individual calibration preferences.

### Add Dimensions (Advanced)
Some teams add context-specific dimensions:
- **Complexity (Co):** How hard is this code to understand? (1-5)
- **Novelty (N):** How unfamiliar is this domain/technology? (1-5)

If adding dimensions, update the formula and recalibrate thresholds completely.

### Document Your Modifications
If you customize:
- Document why (with retrospective data)
- Get team-wide agreement
- Share with new hires
- Revisit quarterly
- Keep the core concept: objective risk → appropriate verification

---

## Common Pitfalls

**Scoring to justify desired verification level**
- "I want to ship quickly, so I'll call this Impact=2"
- Fix: Have someone else review your risk assessment

**Forgetting about compliance**
- "It's just a feature" (but touches PII = GDPR)
- Fix: Always ask "What data does this touch?"

**Averaging away risk**
- "Most dimensions are low, so overall it's low risk" (but Reversibility=5)
- Fix: Use the escalation rules for high single dimensions

**Analysis paralysis**
- Spending 20 minutes scoring a 5-line function
- Fix: For obviously trivial code, intuitive assessment is fine

**Never re-scoring**
- Initial assessment was wrong, but never revisited
- Fix: Re-assess during retrospectives

---

## Quick Reference Card

Print this for your desk:

```
┌─────────────────────────────────────────────────┐
│         VID RISK SCORING QUICK REFERENCE        │
├─────────────────────────────────────────────────┤
│ IMPACT (I): 1=trivial → 5=critical              │
│ REVERSIBILITY (R): 1=instant → 5=impossible     │
│ EXPOSURE (E): 1=dev only → 5=public             │
│ COMPLIANCE (C): 0=none → 10=existential         │
│                                                 │
│ SCORE = (I×3) + (R×2) + (E×2) + C               │
│                                                 │
│  0-10: High Trust      (5-10 min)               │
│ 11-20: Moderate Trust  (15-30 min)              │
│ 21-30: Guarded Trust   (30-60 min)              │
│ 31-47: Minimal Trust   (1-3 hr + review)        │
│                                                 │
│ ESCALATE if I/R/E ≥ 4 OR Compliance ≥ 6        │
│ WHEN UNSURE: Round up, ask team, verify more   │
└─────────────────────────────────────────────────┘
```

---

## Conclusion

This rubric transforms "graduated trust" from a concept into a practice. Use it to:
- Make consistent risk decisions
- Communicate verification rationale
- Calibrate team expectations
- Improve over time through retrospectives

**Remember:** The rubric is a tool for judgment, not a replacement for it. When the score doesn't match your intuition, investigate why. That's where learning happens.

---

*Return to [Appendix A: Quick Reference](appendix-a-quick-reference.md) | [Table of Contents](../README.md)*
