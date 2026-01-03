# Appendix F: VID Checklists

## Purpose

These checklists ensure you don't skip critical verification steps. Print and use daily until they become second nature.

---

## Checklist 1: Pre-Generation (Intent Specification)

**Use before every AI code generation**

**Functional Requirements:**
- [ ] I can describe what this code should do in 2-3 sentences
- [ ] I have identified the inputs and their types
- [ ] I have identified the expected outputs
- [ ] I have listed the main use cases (at least 2-3 examples)

**Boundary Cases:**
- [ ] I know what happens with empty/null inputs
- [ ] I know what happens at min/max boundaries
- [ ] I have identified at least 3 edge cases
- [ ] I know how errors should be handled

**Success Criteria:**
- [ ] I have written down how I'll verify this is correct
- [ ] I have specific test cases in mind (at least 3)
- [ ] I know what properties must always hold
- [ ] I can recognize correct vs. incorrect behavior

**Risk Assessment:**
- [ ] I have scored Impact (1-5)
- [ ] I have scored Reversibility (1-5)
- [ ] I have scored Exposure (1-5)
- [ ] I have scored Compliance (0-10)
- [ ] I have calculated total risk score
- [ ] I know what trust level to apply

**Ready to Generate:**
- [ ] I have documented my intent (at least informally)
- [ ] I know what verification I'll perform
- [ ] I have allocated appropriate time for verification
- [ ] I understand what I'm trying to build

**If ANY checkbox is unchecked: STOP. Complete intent specification before generating.**

---

## Checklist 2: Post-Generation Verification (All Trust Levels)

**Use immediately after AI generates code**

### Basic Verification (Required for ALL code)

**Understanding:**
- [ ] I have READ the entire code (not skimmed)
- [ ] I can explain what this code does without looking at it
- [ ] I understand the approach it takes
- [ ] I could explain this to a colleague

**Intent Match:**
- [ ] The code does what I specified
- [ ] It handles the inputs I identified
- [ ] It produces the outputs I expected
- [ ] It solves my actual problem (not a similar one)

**Automated Checks:**
- [ ] Code compiles/parses without errors
- [ ] Linting passes
- [ ] Type checking passes (if applicable)
- [ ] Basic tests pass

**Spot Check:**
- [ ] I tested with at least 1 normal input
- [ ] I tested with at least 1 edge case
- [ ] Results match my expectations

---

## Checklist 3: Moderate Trust Verification

**Use for Risk Score 11-20 (in addition to Basic Verification)**

**Systematic Testing:**
- [ ] I have identified input categories (at least 4-5)
- [ ] I have tested at least 1 representative from each category
- [ ] I have tested boundary values
- [ ] I have tested error conditions

**Security Review (Basic):**
- [ ] I have identified all inputs
- [ ] User-controlled inputs are validated
- [ ] No obvious injection vulnerabilities (SQL, command, XSS)
- [ ] Sensitive data is not logged

**Error Handling:**
- [ ] Error cases are handled (not just ignored)
- [ ] Error messages don't leak sensitive information
- [ ] The code fails safely
- [ ] Resources are cleaned up on errors

**Integration:**
- [ ] I understand how this integrates with existing code
- [ ] Interfaces/contracts are honored
- [ ] Dependencies are appropriate
- [ ] Side effects are documented

**Documentation:**
- [ ] Edge cases are documented
- [ ] Assumptions are documented
- [ ] Purpose is clear from code/comments
- [ ] Future maintainers can understand this

---

## Checklist 4: Guarded Trust Verification

**Use for Risk Score 21-30 (in addition to Moderate Trust Verification)**

**Comprehensive Security Review:**
- [ ] I have performed STRIDE threat analysis
- [ ] I have tested adversarial inputs
- [ ] Authentication is required (if applicable)
- [ ] Authorization is checked (if applicable)
- [ ] Sensitive data handling is appropriate
- [ ] Rate limiting is considered (if applicable)

**Adversarial Testing:**
- [ ] I tried to break the code
- [ ] I tested with malicious inputs
- [ ] I tested extreme values
- [ ] I tested concurrent access (if applicable)
- [ ] I tested failure modes

**Performance:**
- [ ] I considered performance implications
- [ ] I tested with realistic data volumes
- [ ] No obvious performance bottlenecks
- [ ] Resource usage is reasonable

**Maintainability:**
- [ ] Code is readable (not overly clever)
- [ ] Complexity is justified
- [ ] Naming is clear
- [ ] Logic is straightforward
- [ ] I would be comfortable modifying this in 6 months

**Peer Review:**
- [ ] Another developer has reviewed this code
- [ ] Review feedback has been addressed
- [ ] Reviewer understands and approves

---

## Checklist 5: Minimal Trust Verification

**Use for Risk Score 31-47 (in addition to Guarded Trust Verification)**

**Mandatory Reviews:**
- [ ] At least 2 developers have reviewed this code
- [ ] Security specialist has reviewed (if available)
- [ ] Tech lead has approved
- [ ] All review feedback addressed

**Comprehensive Testing:**
- [ ] Test coverage is comprehensive (>90%)
- [ ] Mutation testing performed (score >90%)
- [ ] Property-based tests added (where applicable)
- [ ] Integration tests pass
- [ ] Performance tests pass

**Formal Analysis:**
- [ ] Threat model documented
- [ ] Security properties formally stated
- [ ] Critical invariants identified and tested
- [ ] Failure modes analyzed

**Documentation:**
- [ ] Architecture decisions documented
- [ ] Security model documented
- [ ] Edge cases and limitations documented
- [ ] Incident response considerations documented
- [ ] Provenance thoroughly documented

**Sign-offs:**
- [ ] Tech lead sign-off obtained
- [ ] Security team sign-off (if applicable)
- [ ] Product/business sign-off (for critical business logic)

---

## Checklist 6: Test Verification

**Use when AI generates tests or when reviewing test quality**

**Test Quality:**
- [ ] Test names describe behavior (not implementation)
- [ ] Assertions check correct values (not just "something returned")
- [ ] Tests test behavior (not implementation details)
- [ ] Tests are readable and understandable

**Coverage:**
- [ ] Normal/happy paths are tested
- [ ] Edge cases are tested (empty, null, boundaries)
- [ ] Error conditions are tested
- [ ] Integration points are tested (if applicable)

**Test Correctness:**
- [ ] I have verified expected values are actually correct
- [ ] Tests would fail if code was wrong
- [ ] Tests are not tautological (not testing code against itself)
- [ ] No correlated bugs (test and code don't share same logic error)

**For Important+ Code:**
- [ ] Mutation testing performed
- [ ] Mutation score >80% (important) or >90% (critical)
- [ ] Property-based tests added for key invariants

**Provenance:**
- [ ] Test provenance documented (how tests were created)
- [ ] Verification performed is documented
- [ ] Tests are marked as AI-generated (if applicable)

---

## Checklist 7: Code Acceptance

**Use before committing code (final gate)**

**Quality Gates:**
- [ ] All appropriate verification checklists completed
- [ ] Verification depth matches risk level
- [ ] All verification passed (or issues resolved)
- [ ] No known bugs or issues

**Understanding:**
- [ ] I understand this code at appropriate depth for risk level
- [ ] I could debug this if it breaks
- [ ] I could modify this if requirements change
- [ ] I could explain this to a colleague

**Documentation:**
- [ ] Commit message describes what was done
- [ ] Commit message indicates AI assistance (if applicable)
- [ ] Commit message notes verification performed
- [ ] PR description includes risk score and trust level

**Provenance:**
- [ ] Code provenance is documented
- [ ] Verification provenance is documented
- [ ] Future maintainers will know where this came from

**Team Standards:**
- [ ] Code follows team conventions
- [ ] No shortcuts taken under time pressure
- [ ] I'm confident in this code
- [ ] I'm willing to be on-call for this code

**Final Check:**
- [ ] I would accept responsibility for this code
- [ ] I'm not rushing to ship without proper verification
- [ ] The quality is appropriate for the risk level

**If ANY critical checkbox is unchecked: DON'T COMMIT. Complete required verification.**

---

## Checklist 8: Incident Response

**Use after production incidents involving AI-generated code**

**Immediate Response:**
- [ ] Incident is contained
- [ ] Impact is assessed
- [ ] Customers are notified (if needed)
- [ ] Fix is deployed (or incident is mitigated)

**Investigation:**
- [ ] Root cause identified
- [ ] Was this code AI-generated?
- [ ] What verification was performed?
- [ ] What verification should have been performed?
- [ ] Should verification have caught this?

**Documentation:**
- [ ] Incident is documented
- [ ] Root cause is documented
- [ ] Timeline is documented
- [ ] Lessons learned are captured

**Process Improvement:**
- [ ] Was risk score accurate?
- [ ] Was trust level appropriate?
- [ ] Was verification sufficient?
- [ ] What verification technique would have caught this?
- [ ] Do we need to update our practices?

**Follow-up:**
- [ ] Regression test added
- [ ] Similar code patterns identified and reviewed
- [ ] Team notified of lessons learned
- [ ] Verification practices updated (if needed)
- [ ] Risk calibration adjusted (if needed)

---

## Checklist 9: Team Calibration Session

**Use monthly to align team on risk assessment and verification**

**Preparation:**
- [ ] Selected 5-10 recent PRs for review
- [ ] PRs represent mix of risk levels
- [ ] Everyone has reviewed PRs beforehand

**During Session:**
- [ ] Each person independently scores risk for each PR
- [ ] Compare scores
- [ ] Discuss differences (why did you score higher/lower?)
- [ ] Agree on calibrated scores
- [ ] Document any changes to team norms

**Review Outcomes:**
- [ ] What verification caught in past month
- [ ] What escaped to production in past month
- [ ] Were trust levels appropriate?
- [ ] Were verification techniques effective?

**Action Items:**
- [ ] Update risk scoring guidelines (if needed)
- [ ] Update verification rituals (if needed)
- [ ] Schedule training (if knowledge gaps identified)
- [ ] Document decisions

---

## Checklist 10: Onboarding New Developer to VID

**Use when new developer joins team**

**Week 1:**
- [ ] Read VID One-Page Overview
- [ ] Read Chapter 1: The Inversion
- [ ] Read Chapter 4: Intent Before Generation
- [ ] Shadow experienced developer on full VID cycle
- [ ] 1-hour 1-on-1 discussion about VID

**Week 2:**
- [ ] Pair program with mentor (new dev drives)
- [ ] Complete low-risk task using VID
- [ ] Mentor reviews every step
- [ ] Debrief session

**Week 3:**
- [ ] Complete medium-risk task independently
- [ ] Mentor reviews verification notes
- [ ] Attend team calibration session
- [ ] Can explain 5 principles and risk scoring

**Week 4:**
- [ ] Complete full VID cycle independently
- [ ] Appropriate oversight based on risk level
- [ ] Mentor spot-checks work
- [ ] Debrief on month 1 experience

**Competency Verification:**
- [ ] Can articulate the 5 VID principles
- [ ] Can score risk using the rubric
- [ ] Can apply appropriate verification for each trust level
- [ ] Knows when to ask for help
- [ ] Ready to work independently (with normal oversight)

---

## Checklist 11: PR Review (for Reviewers)

**Use when reviewing pull requests containing AI-generated code**

**Before Reviewing:**
- [ ] PR includes risk score
- [ ] PR includes trust level
- [ ] PR notes verification performed
- [ ] PR indicates AI usage (if applicable)

**Code Review:**
- [ ] I understand what the code does
- [ ] Code matches PR description
- [ ] Changes are appropriate for the task
- [ ] No obvious bugs or issues
- [ ] Code is maintainable

**Verification Review:**
- [ ] Was appropriate trust level applied?
- [ ] Was verification depth sufficient?
- [ ] Are verification notes convincing?
- [ ] Would I be comfortable with this code in production?

**Risk Assessment Review:**
- [ ] Do I agree with the risk score?
- [ ] If no, what dimension did they miss?
- [ ] Should trust level be escalated?

**Testing Review:**
- [ ] Tests are present and appropriate
- [ ] Tests cover important cases
- [ ] Tests are not just testing implementation
- [ ] Test quality is appropriate for risk level

**Decision:**
- [ ] Approve (quality is appropriate for risk)
- [ ] Request changes (issues need addressing)
- [ ] Escalate (higher trust level needed)

---

## How to Use These Checklists

### Daily Use

1. **Print checklists** 1-7 and keep at your desk
2. **Use checklist 1** before every generation
3. **Use checklist 2** after every generation
4. **Use checklists 3-5** based on risk score
5. **Use checklist 7** before every commit

### Periodic Use

- **Checklist 8:** After incidents
- **Checklist 9:** Monthly calibration
- **Checklist 10:** When onboarding
- **Checklist 11:** During PR reviews

### Adaptation

These checklists are starting points. Your team should:
- Adapt them to your context
- Add team-specific items
- Remove items that don't apply
- Update based on lessons learned
- Share improvements

### Building Habits

**First 2 weeks:** Use checklists explicitly (check every box)

**Weeks 3-4:** Use checklists as reference (verify you didn't miss anything)

**Month 2+:** Internalized habits (checklists as spot-check)

**Goal:** Build habits so verification is automatic, not checklist-driven.

---

## Printable Quick Reference Cards

### Card 1: Pre-Generation
```
┌────────────────────────────────────────┐
│ BEFORE AI GENERATION: INTENT FIRST     │
├────────────────────────────────────────┤
│ ☐ What should this do? (2-3 sentences)│
│ ☐ What are the inputs/outputs?        │
│ ☐ What are 3+ edge cases?             │
│ ☐ How will I verify it's correct?     │
│ ☐ What's the risk score?              │
│ ☐ What trust level will I apply?      │
│                                        │
│ IF ANY UNCHECKED → STOP               │
│ Complete intent specification first   │
└────────────────────────────────────────┘
```

### Card 2: Post-Generation
```
┌────────────────────────────────────────┐
│ AFTER AI GENERATION: VERIFY            │
├────────────────────────────────────────┤
│ ALWAYS:                                │
│ ☐ Read and understand code            │
│ ☐ Verify against intent               │
│ ☐ Run automated checks                │
│ ☐ Test edge cases                     │
│                                        │
│ THEN by risk score:                   │
│  0-10: Basic verification (10 min)    │
│ 11-20: + Security & integration (30m) │
│ 21-30: + Adversarial testing (60m)    │
│ 31-47: + Peer review & sign-off (2h+) │
│                                        │
│ ANY dimension ≥4 → Escalate trust     │
└────────────────────────────────────────┘
```

### Card 3: Before Commit
```
┌────────────────────────────────────────┐
│ BEFORE COMMIT: FINAL GATE              │
├────────────────────────────────────────┤
│ ☐ Appropriate verification completed  │
│ ☐ I understand this code              │
│ ☐ I could debug/modify this           │
│ ☐ Provenance documented               │
│ ☐ Commit message includes:            │
│   - What was done                     │
│   - AI assistance noted               │
│   - Verification noted                │
│   - Risk score/trust level            │
│                                        │
│ I accept responsibility for this code │
└────────────────────────────────────────┘
```

---

## Digital Checklist Templates

### PR Template Addition

```markdown
## VID Verification

**Risk Assessment:**
- Impact: [1-5]
- Reversibility: [1-5]
- Exposure: [1-5]
- Compliance: [0-10]
- **Total Risk Score:** [calculated]
- **Trust Level:** [High/Moderate/Guarded/Minimal]

**AI Usage:**
- [ ] AI-generated code (specify tool/model)
- [ ] Human-written code
- [ ] Mixed (specify which parts)

**Verification Performed:**
- [ ] Intent specification documented
- [ ] Basic verification completed
- [ ] [Trust-level-specific checks completed]
- [ ] Tests passing
- [ ] Peer review (if required)

**Verification Notes:**
[What did you verify? What did you find? Any concerns?]
```

### Commit Message Template

```
[Brief summary of change]

AI-assisted: [Yes/No, tool used]
Risk Score: [0-47] (Trust Level: [High/Moderate/Guarded/Minimal])

Verification:
- [List key verification steps performed]
- [Note any issues found and resolved]

[Detailed description if needed]
```

---

*Print these checklists. Use them daily. Build verification habits.*

*Return to [Table of Contents](../README.md)*
