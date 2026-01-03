# VID Template Toolkit

**Practical templates for immediate VID adoption**

Copy, adapt, and use these templates in your daily workflow. Available in both quick and comprehensive formats.

---

## Template 1: Intent Specification

### Quick Template (2-3 minutes)

Use this before generating any code:

```markdown
## Intent Specification

**Goal:** [One sentence: what you need to build]

**Requirements:**
- [ ] [Functional requirement 1]
- [ ] [Functional requirement 2]
- [ ] [Functional requirement 3]

**Edge Cases to Handle:**
- [Edge case 1]
- [Edge case 2]

**Success Criteria:**
- [How I'll know it works]

**Risk Level:** [High Trust / Moderate / Guarded / Minimal] (Score: ___)

**Verification Plan:**
- [How I'll verify this code]
```

**Example:**

```markdown
## Intent Specification

**Goal:** Create a function to validate email addresses for user registration

**Requirements:**
- [ ] Accept string input
- [ ] Return boolean (valid/invalid)
- [ ] Follow RFC 5322 standard
- [ ] Block disposable email domains

**Edge Cases to Handle:**
- Empty string
- Very long emails (>254 chars)
- International characters
- Multiple @ symbols

**Success Criteria:**
- Rejects invalid@
- Rejects @invalid.com
- Accepts valid@example.com
- Handles unicode correctly

**Risk Level:** Moderate Trust (Score: 15)
- Impact: 3 (affects registration)
- Reversibility: 2 (easy to fix)
- Exposure: 2 (all users)
- Compliance: 0

**Verification Plan:**
- Test with 20+ edge cases
- Verify against RFC 5322
- Check disposable domain list coverage
- Review code for logic errors
```

### Extended Template (5-10 minutes)

Use for moderate-to-high risk tasks:

```markdown
## Intent Specification (Extended)

**Task ID:** [Reference number if applicable]

**Goal:** [Detailed description of what needs to be built]

**Context:**
- **Why this is needed:** [Business/technical justification]
- **Current state:** [What exists now]
- **Desired state:** [What should exist after]
- **Related systems:** [What this integrates with]

**Functional Requirements:**
- [ ] [Requirement 1]
- [ ] [Requirement 2]
- [ ] [Requirement 3]
- [ ] [etc.]

**Non-Functional Requirements:**
- **Performance:** [Response time, throughput, etc.]
- **Security:** [Authentication, authorization, data protection]
- **Compliance:** [Regulatory requirements]
- **Scalability:** [Expected load, growth]
- **Reliability:** [Uptime requirements, error handling]

**Edge Cases & Error Conditions:**
- [Edge case 1]: [Expected behavior]
- [Edge case 2]: [Expected behavior]
- [Error condition 1]: [How to handle]
- [Error condition 2]: [How to handle]

**Success Criteria:**
- **Functional:** [Observable behaviors that must work]
- **Performance:** [Measurable targets]
- **Quality:** [Code quality expectations]

**Risk Assessment:**
| Factor | Score | Rationale |
|--------|-------|-----------|
| Impact | _ / 5 | [What happens if this is wrong?] |
| Reversibility | _ / 5 | [How easy to fix?] |
| Exposure | _ / 5 | [Who's affected?] |
| Compliance | _ / 10 | [Regulatory implications?] |
| **Total** | **__** | **Trust Level: _______** |

**Verification Plan:**
- [ ] [Verification step 1]
- [ ] [Verification step 2]
- [ ] [Verification step 3]
- [ ] [Additional verification for high-risk]

**Time Estimates:**
- Generation: [Expected AI generation time]
- Verification: [Allocated verification time based on risk]
- Total: [Combined estimate]

**Notes:**
[Any additional context, concerns, or considerations]
```

---

## Template 2: Verification Ritual Checklist

### By Trust Level

#### High Trust (5-10 minutes)

```markdown
## Verification Ritual — High Trust

**Code Location:** [File/function/module]
**Generated:** [Date/time]
**Risk Score:** [0-10]

### Basic Checks
- [ ] Code reads clearly
- [ ] Matches intent specification
- [ ] No obvious syntax errors
- [ ] No hardcoded secrets/credentials
- [ ] Appropriate error handling present

### Functional Check
- [ ] Run code (manually or via test)
- [ ] Test happy path
- [ ] Test one edge case

### Understanding Check
- [ ] I understand what this code does
- [ ] I can explain it to a colleague
- [ ] No "magic" that confuses me

### Provenance
- [ ] Mark as AI-generated in commit

**Result:** ☐ Approved  ☐ Needs Revision  ☐ Escalate to Higher Trust

**Time Spent:** ___ minutes
**Issues Found:** [List any issues]
```

#### Moderate Trust (15-30 minutes)

```markdown
## Verification Ritual — Moderate Trust

**Code Location:** [File/function/module]
**Generated:** [Date/time]
**Risk Score:** [11-20]

### Code Review
- [ ] Read all generated code line by line
- [ ] Verify logic matches intent
- [ ] Check variable naming is clear
- [ ] Review control flow (loops, conditionals)
- [ ] Validate error handling is comprehensive
- [ ] Check for potential null/undefined issues
- [ ] Verify resource cleanup (files, connections, etc.)

### Testing
- [ ] Run existing test suite (all pass)
- [ ] Test happy path manually
- [ ] Test 3-5 edge cases
- [ ] Test error conditions
- [ ] Verify error messages are helpful

### Security Check
- [ ] No SQL injection vulnerabilities
- [ ] No XSS vulnerabilities
- [ ] No hardcoded secrets
- [ ] Input validation present
- [ ] Output sanitization where needed

### Integration Check
- [ ] Integrates correctly with existing code
- [ ] API contracts respected
- [ ] Dependencies appropriate
- [ ] Side effects understood

### Understanding Check
- [ ] I can explain every line
- [ ] I understand why it works this way
- [ ] I know what could go wrong
- [ ] I documented anything non-obvious

### Documentation
- [ ] Comments added for complex logic
- [ ] Function/method documentation updated
- [ ] README updated if needed

### Provenance
- [ ] Marked as AI-generated in commit
- [ ] Verification level documented

**Result:** ☐ Approved  ☐ Needs Revision  ☐ Escalate to Guarded Trust

**Time Spent:** ___ minutes
**Issues Found:** [List any issues]
**Lessons Learned:** [What would you verify differently next time?]
```

#### Guarded Trust (30-60 minutes)

```markdown
## Verification Ritual — Guarded Trust

**Code Location:** [File/function/module]
**Generated:** [Date/time]
**Risk Score:** [21-30]

### Deep Code Review
- [ ] Read and understand every line
- [ ] Verify algorithm correctness
- [ ] Check for subtle logic bugs
- [ ] Review edge case handling
- [ ] Validate error propagation
- [ ] Check concurrency safety (if applicable)
- [ ] Review performance characteristics
- [ ] Verify memory management (if applicable)

### Comprehensive Testing
- [ ] All existing tests pass
- [ ] Write new tests for new functionality
- [ ] Test 10+ edge cases
- [ ] Test all error paths
- [ ] Load testing (if performance-critical)
- [ ] Boundary condition testing
- [ ] Integration testing

### Security Deep Dive
- [ ] Full security review completed
- [ ] Input validation comprehensive
- [ ] Authentication/authorization correct
- [ ] No injection vulnerabilities
- [ ] Sensitive data handling reviewed
- [ ] Logging doesn't expose secrets
- [ ] OWASP Top 10 considerations addressed

### Architecture Review
- [ ] Design pattern appropriate
- [ ] Fits within system architecture
- [ ] Doesn't introduce technical debt
- [ ] Scalability considered
- [ ] Maintainability considered

### Integration Verification
- [ ] All integration points tested
- [ ] Error handling across boundaries
- [ ] Transaction semantics correct (if applicable)
- [ ] Rollback scenarios tested

### Documentation
- [ ] Inline comments for all complex logic
- [ ] API documentation complete
- [ ] Architecture decision recorded (ADR if needed)
- [ ] Runbook updated (if operational impact)

### Understanding
- [ ] I fully understand this code
- [ ] I can modify it confidently
- [ ] I know exactly what could go wrong
- [ ] I've documented my understanding

### Provenance
- [ ] AI-generated status documented
- [ ] Verification depth recorded
- [ ] Review checklist attached to PR/commit

**Result:** ☐ Approved  ☐ Needs Revision  ☐ Escalate to Minimal Trust

**Time Spent:** ___ minutes
**Issues Found:** [Detailed list]
**Risk Mitigation:** [How issues were addressed]
**Lessons Learned:** [What surprised you?]
```

#### Minimal Trust (1-3+ hours + Peer Review)

```markdown
## Verification Ritual — Minimal Trust

**Code Location:** [File/function/module]
**Generated:** [Date/time]
**Risk Score:** [31-47]

### Code Deep Dive
- [ ] Line-by-line review with justification for every decision
- [ ] Algorithm correctness proven (informal proof or strong rationale)
- [ ] All edge cases identified and tested
- [ ] Error handling comprehensive and tested
- [ ] Security reviewed by security expert
- [ ] Performance profiled and verified
- [ ] Concurrency issues ruled out (if applicable)

### Exhaustive Testing
- [ ] Unit tests for every function/method
- [ ] Integration tests for all integrations
- [ ] End-to-end tests for critical paths
- [ ] Stress testing completed
- [ ] Chaos testing (if distributed system)
- [ ] Security testing (penetration testing if needed)
- [ ] Regression testing comprehensive

### Compliance & Legal
- [ ] Regulatory requirements verified
- [ ] Legal review completed (if needed)
- [ ] Compliance documentation updated
- [ ] Audit trail complete

### Architecture & Design
- [ ] Design reviewed by architect
- [ ] Failure modes analyzed (FMEA if critical)
- [ ] Disaster recovery plan updated
- [ ] Monitoring and alerting in place

### Peer Review
- [ ] Code reviewed by 2+ senior engineers
- [ ] Design reviewed by tech lead or architect
- [ ] Security reviewed by security team
- [ ] All review feedback addressed

### Production Readiness
- [ ] Deployment plan documented
- [ ] Rollback plan documented and tested
- [ ] Monitoring dashboards created
- [ ] Alerting configured
- [ ] Runbook complete
- [ ] On-call team briefed

### Documentation
- [ ] Complete inline documentation
- [ ] API documentation published
- [ ] Architecture diagrams updated
- [ ] ADR (Architecture Decision Record) created
- [ ] Runbook complete and tested

### Understanding
- [ ] I completely understand this code
- [ ] I understand all failure modes
- [ ] I understand compliance implications
- [ ] I can support this in production
- [ ] Team understands this code

### Provenance
- [ ] AI-generated clearly marked
- [ ] Full verification trail documented
- [ ] All reviewers acknowledged
- [ ] Review artifacts archived

**Result:** ☐ Approved for Production  ☐ Needs Revision  ☐ Rejected

**Time Spent:** ___ hours
**Issues Found:** [Comprehensive list with severity]
**Reviewers:** [List all reviewers and their roles]
**Risk Mitigation:** [Detailed mitigation strategies]
**Production Plan:** [Link to deployment plan]
**Rollback Plan:** [Link to rollback plan]
**Lessons Learned:** [What would you do differently?]
```

---

## Template 3: Risk Classification Worksheet

```markdown
## Risk Classification Worksheet

**Task:** [Brief description]
**Date:** [Date of assessment]
**Assessor:** [Your name]

### Risk Factors

#### 1. Impact (Score 1-5)
**Question:** What happens if this code is wrong?

1 = Minor inconvenience (log message incorrect)
2 = User-visible bug (UI glitch, non-critical feature broken)
3 = Significant issue (feature unavailable, user workflow disrupted)
4 = Major problem (data loss, security vulnerability, revenue impact)
5 = Critical failure (system down, data breach, legal liability)

**Score:** ___ / 5
**Rationale:** [Why this score?]

#### 2. Reversibility (Score 1-5)
**Question:** How easily can we fix or undo this if it's wrong?

1 = Instant rollback (feature flag, config change)
2 = Quick fix (code change, redeploy in minutes)
3 = Standard fix (code change, normal deployment process, <1 day)
4 = Difficult fix (requires migration, data cleanup, coordination)
5 = Nearly irreversible (permanent data loss, legal/compliance breach)

**Score:** ___ / 5
**Rationale:** [Why this score?]

#### 3. Exposure (Score 1-5)
**Question:** Who is affected by this code?

1 = Only me (dev environment only)
2 = Dev team (internal tools, development environment)
3 = Limited users (beta users, specific customer segment)
4 = All users (production system, all customers)
5 = Public exposure (external API, security boundary, public data)

**Score:** ___ / 5
**Rationale:** [Why this score?]

#### 4. Compliance (Score 0-10)
**Question:** Are there regulatory, legal, or compliance requirements?

0 = No compliance requirements
2 = Internal policies only
4 = Industry best practices (PCI DSS for non-payment code)
6 = Regulatory requirements (HIPAA, GDPR, SOX for non-critical)
8 = Direct compliance impact (payment processing, PHI, financial reporting)
10 = Existential compliance risk (FDA medical devices, financial transactions)

**Score:** ___ / 10
**Rationale:** [Which regulations apply?]

### Risk Calculation

```
Risk Score = (Impact × 3) + (Reversibility × 2) + (Exposure × 2) + Compliance

Impact:        ___ × 3 = ___
Reversibility: ___ × 2 = ___
Exposure:      ___ × 2 = ___
Compliance:    ___     = ___
                 Total = ___
```

### Trust Level Assignment

- **0-10:** High Trust (5-10 min verification)
- **11-20:** Moderate Trust (15-30 min verification)
- **21-30:** Guarded Trust (30-60 min verification)
- **31-47:** Minimal Trust (1-3+ hours + peer review)

**Trust Level:** ___________________

### Verification Requirements

Based on trust level, I will:

- [ ] [Specific verification activities required]
- [ ] [Additional checks needed]
- [ ] [Peer review required? Yes/No]
- [ ] [Compliance review required? Yes/No]

### Notes

[Any additional considerations, adjustments to standard scoring, or context]

---

**Approved By:** [Your name]
**Date:** [Date]
```

---

## Template 4: Provenance Annotation Guide

### Git Commit Message Format

```
[VID] <type>: <description>

<body explaining what and why>

Provenance: <AI-generated | Human-written | AI-assisted | Migrated>
Verification: <High Trust | Moderate | Guarded | Minimal>
Verified-by: <your-username>
Risk-score: <0-47>
Time-spent: <verification time>

[Optional: Issues found and addressed]
[Optional: Review-by: if peer reviewed]
```

**Example:**

```
[VID] feat: Add email validation for user registration

Implements RFC 5322-compliant email validation with disposable
domain blocking for the user registration flow.

Handles edge cases:
- Unicode/internationalized emails
- Very long addresses (>254 chars)
- Multiple @ symbols
- Empty/null inputs

Provenance: AI-generated
Verification: Moderate Trust
Verified-by: @sarah
Risk-score: 15
Time-spent: 22 minutes

Issues found and addressed:
- Missing null check (added)
- Disposable domain list was incomplete (updated)
- Edge case: emails with consecutive dots (now rejected)
```

### Code Comment Annotations

#### For AI-Generated Code

```javascript
/**
 * Calculate user subscription renewal date
 *
 * @provenance AI-generated 2024-12-07
 * @verified-by @mike (Moderate Trust, 25 min)
 * @risk-score 18 (financial impact)
 *
 * IMPORTANT: This function handles month-end edge cases carefully.
 * Do not modify date logic without understanding the Feb 29/30/31 handling.
 *
 * @param {Date} subscriptionStart - Original subscription date
 * @param {string} planType - 'monthly' or 'annual'
 * @returns {Date} Next renewal date
 */
function calculateRenewalDate(subscriptionStart, planType) {
  // ... implementation
}
```

#### For Modified AI-Generated Code

```python
# Originally AI-generated: 2024-06-15 (@sarah, Moderate Trust)
# Modified: 2024-12-07 (@mike, added rate limiting, Guarded Trust)
# Risk score: 25 (authentication + rate limiting)
def authenticate_request(request):
    """
    Verify JWT token, check rate limits, attach user to request.

    MODIFICATION NOTES:
    - Added rate limiting check after token validation
    - Preserved original error handling (DO NOT REMOVE try-except)
    - Rate limiter must be checked AFTER token decode to use user_id

    Original intent: Handle auth gracefully
    Modified intent: Add rate limiting while preserving error handling
    """
    # ... implementation
```

#### For Human-Written Code (in AI-augmented codebase)

```java
/**
 * Custom business logic for premium user tier calculations
 *
 * @provenance Human-written
 * @author @alex
 * @date 2024-12-07
 *
 * This logic is based on specific business requirements from the
 * product team and cannot be reliably generated by AI.
 *
 * DO NOT ask AI to refactor without understanding business rules.
 */
public class PremiumTierCalculator {
  // ... implementation
}
```

### Provenance Categories

| Provenance Type | When to Use | Example Comment |
|----------------|-------------|-----------------|
| **AI-generated** | Code written entirely by AI | `@provenance AI-generated 2024-12-07` |
| **Human-written** | Code written entirely by human | `@provenance Human-written (@username)` |
| **AI-assisted** | Human wrote with AI suggestions | `@provenance AI-assisted (human logic, AI implementation)` |
| **Migrated** | Existing code from pre-AI era | `@provenance Migrated (legacy codebase, verified 2024-12-07)` |
| **Modified from AI** | AI-generated, then human-modified | `@provenance AI-generated (2024-06-15), modified (2024-12-07)` |

---

## Template 5: Team Calibration Review

### Monthly Team Calibration Template

```markdown
# Team Calibration Review — [Month Year]

**Team:** [Team name]
**Date:** [Review date]
**Participants:** [List team members]
**Facilitator:** [Who led the review]

## Metrics Summary

### Production Defects

| Metric | This Month | Last Month | Trend |
|--------|------------|------------|-------|
| Total defects | ___ | ___ | ↑/↓/→ |
| Caught in verification | ___ | ___ | ↑/↓/→ |
| Escaped to production | ___ | ___ | ↑/↓/→ |
| High-severity | ___ | ___ | ↑/↓/→ |
| From AI-generated code | ___ | ___ | ↑/↓/→ |

**Catch Rate:** ___% (defects caught / total defects)

### Verification Time

| Trust Level | Tasks | Avg. Time | Time Range |
|-------------|-------|-----------|------------|
| High | ___ | ___ min | ___-___ min |
| Moderate | ___ | ___ min | ___-___ min |
| Guarded | ___ | ___ min | ___-___ min |
| Minimal | ___ | ___ hours | ___-___ hours |

### Risk Calibration

| Metric | This Month | Target |
|--------|------------|--------|
| Risk assessments done | ___ | 100% |
| Risk scores reviewed | ___ | All Guarded+ |
| Scores adjusted post-task | ___ | Track |

## Incidents Review

### Production Incidents Related to AI-Generated Code

**Incident 1:**
- **Description:** [What happened]
- **Root cause:** [Why it happened]
- **Original risk score:** ___ ([Trust Level])
- **Should have been:** ___ ([Correct Trust Level])
- **Verification gap:** [What verification step was missed?]
- **Lesson:** [What we learned]
- **Action:** [What we'll do differently]

**Incident 2:**
[Repeat for each incident]

### Issues Caught in Verification

**Top 5 Issues Caught:**

1. [Issue type] — Caught by [verification step] — [Trust level]
2. [Issue type] — Caught by [verification step] — [Trust level]
3. [Issue type] — Caught by [verification step] — [Trust level]
4. [Issue type] — Caught by [verification step] — [Trust level]
5. [Issue type] — Caught by [verification step] — [Trust level]

**What's working well:**
- [Verification practice that's catching issues]

## Risk Calibration Mismatches

### Tasks Scored Too Low

| Task | Scored | Should Be | Why Mismatch? | Impact |
|------|--------|-----------|---------------|--------|
| [Task] | [Score] | [Score] | [Reason] | [What happened] |

### Tasks Scored Too High

| Task | Scored | Could Be | Why Mismatch? | Time Wasted |
|------|--------|----------|---------------|-------------|
| [Task] | [Score] | [Score] | [Reason] | [Hours] |

## Pattern Analysis

### Common Bug Types (This Month)

1. **[Bug type]:** ___ occurrences
   - AI tends to... [pattern]
   - Caught by... [verification step]
   - Prevention: [Updated verification checklist]

2. **[Bug type]:** ___ occurrences
   - [Pattern and prevention]

### Verification Gaps

**What are we missing?**
- [Gap 1]: [Description] → [Proposed fix]
- [Gap 2]: [Description] → [Proposed fix]

## Team Performance

### Verification Effectiveness by Team Member

| Team Member | Tasks | Catch Rate | Avg. Verification Time | Notes |
|-------------|-------|------------|------------------------|-------|
| @member1 | ___ | ___% | ___ min | [Strengths/areas to improve] |
| @member2 | ___ | ___% | ___ min | [Strengths/areas to improve] |

**Top performers:** [Who's doing well and why]
**Need support:** [Who needs help and with what]

### Knowledge Gaps

**Areas where team lacks confidence:**
- [Area 1]: [How many team members struggle]
- [Area 2]: [How many team members struggle]

**Training needed:**
- [Topic]: [Who needs it]

## Calibration Adjustments

### Risk Scoring Updates

**Adjusted factors:**
- [Factor]: Changed from [old] to [new] because [reason]

**New patterns added to rubric:**
- [Pattern]: Automatically scores as [Trust Level] because [reason]

### Verification Checklist Updates

**Added to High Trust:**
- [New check]: [Why added]

**Added to Moderate Trust:**
- [New check]: [Why added]

**Added to Guarded Trust:**
- [New check]: [Why added]

**Added to Minimal Trust:**
- [New check]: [Why added]

## Action Items

- [ ] [Action 1] — Owner: [Name] — Due: [Date]
- [ ] [Action 2] — Owner: [Name] — Due: [Date]
- [ ] [Action 3] — Owner: [Name] — Due: [Date]

## Lessons Learned

### What's Working

1. [Practice that's working well]
2. [Practice that's working well]

### What's Not Working

1. [Practice that needs adjustment]
2. [Practice that needs adjustment]

### Experiments to Try

1. [New practice to experiment with] — Owner: [Name]
2. [New practice to experiment with] — Owner: [Name]

## Next Review

**Date:** [Next month's review date]
**Focus areas:** [What to pay special attention to next month]

---

**Review completed:** [Date]
**Signed off:** [Tech lead / Manager]
```

### Quarterly Calibration Template

```markdown
# Quarterly Team Calibration — Q[X] [Year]

**Team:** [Team name]
**Quarter:** [Q1/Q2/Q3/Q4 Year]
**Date:** [Review date]

## Quarter Summary

### Metrics Over Time

#### Defect Trends
```
Month 1: [Caught: ___ | Escaped: ___]
Month 2: [Caught: ___ | Escaped: ___]
Month 3: [Caught: ___ | Escaped: ___]

Trend: [Improving / Stable / Declining]
```

#### Verification Time Trends
```
Month 1: [Avg. time per trust level]
Month 2: [Avg. time per trust level]
Month 3: [Avg. time per trust level]

Trend: [Improving efficiency / Stable / Need more time]
```

### Major Incidents This Quarter

**Total production incidents:** ___
**From AI-generated code:** ___
**Preventable with better verification:** ___

**Root cause analysis:**
1. [Root cause] → [How many incidents] → [Prevention strategy]
2. [Root cause] → [How many incidents] → [Prevention strategy]

### Team Growth

**New team members onboarded:** ___
**Team members now proficient in VID:** ___
**Verification catch rate improvement:** ___% → ___%

## Risk Calibration Evolution

### Scoring Accuracy

**How often our risk scores were accurate:**
- Accurate: ___% (scored correctly, verified appropriately)
- Under-scored: ___% (should have verified more)
- Over-scored: ___% (wasted verification time)

### Rubric Updates This Quarter

[List all updates to risk scoring rubric and why]

## VID Practice Maturity

**Assessment:**

| Practice | Maturity Level | Evidence | Next Steps |
|----------|----------------|----------|------------|
| Intent Specification | [Novice/Developing/Proficient/Expert] | [Why this level] | [How to improve] |
| Verification Rituals | [Novice/Developing/Proficient/Expert] | [Why this level] | [How to improve] |
| Learning Loop | [Novice/Developing/Proficient/Expert] | [Why this level] | [How to improve] |
| Provenance Hygiene | [Novice/Developing/Proficient/Expert] | [Why this level] | [How to improve] |

## Next Quarter Goals

1. [Goal 1] — Measure: [How we'll measure success]
2. [Goal 2] — Measure: [How we'll measure success]
3. [Goal 3] — Measure: [How we'll measure success]

---

**Review completed:** [Date]
**Next quarterly review:** [Date]
```

---

## Using These Templates

### Getting Started

1. **Start with Intent Specification** (Template 1)
   - Use before every AI generation
   - Start with quick version, upgrade to extended for moderate+ risk

2. **Pick the right Verification Ritual** (Template 2)
   - Use Risk Classification (Template 3) to determine trust level
   - Follow the appropriate checklist

3. **Add Provenance annotations** (Template 4)
   - In every commit message
   - In code comments for significant functions

4. **Run monthly calibration** (Template 5)
   - First Friday of every month
   - Whole team participates

### Customization

**These templates are starting points. Adapt them:**

- Add items specific to your technology stack
- Adjust risk scoring for your industry
- Modify verification steps for your compliance needs
- Extend checklists based on bugs you find

### Template Maintenance

**Update templates when:**
- You find a bug that existing checklist would have caught
- Risk scoring proves inaccurate for your context
- Team feedback suggests improvements
- Compliance requirements change

---

## Template Summary

| Template | Purpose | Time Investment | When to Use |
|----------|---------|-----------------|-------------|
| Intent Spec (Quick) | Plan before generation | 2-3 min | Every task |
| Intent Spec (Extended) | Detailed planning | 5-10 min | Moderate+ risk |
| Verification Checklists | Systematic verification | 5 min - 3 hours | After every generation |
| Risk Classification | Determine trust level | 3-5 min | Every task |
| Provenance Annotation | Track code origins | 1 min | Every commit |
| Team Calibration (Monthly) | Improve practices | 1 hour | Monthly |
| Team Calibration (Quarterly) | Strategic review | 2 hours | Quarterly |

---

## Download & Adapt

**All templates available in this repository:**
- Copy directly from this file
- Adapt to your team's needs
- Integrate into your workflow tools
- Share improvements back to the community

**Integration ideas:**
- Add to PR templates
- Include in commit message templates
- Build into code review tools
- Integrate with project management systems

---

## Attribution

**Verified Intent Development (VID) Methodology**
Created by Oscar Valenzuela (SEMCL.ONE Community) - See [AUTHORS.md](./AUTHORS.md) for all contributors
Licensed under CC BY-SA 4.0

https://github.com/SemClone/Verified-Intent-Development

---

*Templates designed for immediate adoption. Start using VID today.*
