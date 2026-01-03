## Chapter 16: Adopting VID

### Starting Points

You can begin VID adoption at different scales, depending on your position and influence within your organization.

Individual adoption is the most accessible entry point. You can start applying VID principles personally today, with no permission needed. Begin specifying intent before generation, practice verification rituals on your own code, and build your calibration skills. As you demonstrate results—fewer bugs, better code quality, stronger understanding—you'll naturally influence those around you.

Team adoption amplifies these benefits. When a team agrees collectively to apply VID practices, they can align on shared risk calibration and verification standards. This creates consistency across the team's work and enables collective learning. Teams can review verification outcomes together, calibrate their practices, and build shared expertise more rapidly than individuals working in isolation.

Organizational adoption formalizes VID as the development methodology across multiple teams. This enables systematic training programs, dedicated tooling support, and organization-wide metrics that reinforce verification practices. When the organization commits to VID, it sends a clear signal that verification is valued work, not optional overhead.

### Starting Small

Don't try to implement everything at once. VID adoption works best as a gradual, deliberate progression.

In the first two weeks, practice intent specification. Before asking AI to generate code, take time to articulate clearly what you need and how you'll verify it meets your requirements. This single practice immediately improves the quality of generated code and prepares you for effective verification.

During weeks three and four, add verification rituals to your workflow. Start with basic rituals—read the code, check for obvious issues, verify it matches your intent—and apply them consistently. The goal isn't perfection; it's building the habit of verification as a standard part of accepting AI-generated code.

By weeks five and six, begin actively calibrating your verification intensity. Start noticing patterns: which types of code need more thorough verification, which need less. A simple utility function might need only basic checks, while authentication code demands deeper scrutiny. Let your growing experience inform your calibration.

From there, the work becomes ongoing. Build the learning loop into your practice. Track outcomes—what types of issues does your verification catch? What escapes?—and adjust your practices accordingly. Calibration improves continuously as you accumulate experience.

### Common Obstacles

Every team adopting VID encounters predictable resistance. Understanding these obstacles helps you address them proactively.

"It slows us down" is perhaps the most common objection. Yes, verification takes time. But debugging production issues, reworking faulty code, and responding to incidents take far more time. VID front-loads small, predictable costs during development to avoid large, unpredictable costs later. The question isn't whether you'll pay the cost of quality—it's when and how much.

"AI is good enough" reflects understandable optimism about AI capabilities. AI is indeed remarkably good at generating code that looks correct and often is correct for common cases. But AI struggles with edge cases, security implications, performance considerations, and maintainability concerns. The code that looks right isn't always the code that is right, especially under stress or adversarial conditions.

"We don't have time" reveals a fundamental misunderstanding of where time actually goes. You don't have time to not verify. The time you imagine you're saving by skipping verification, you'll spend—often multiplied—on debugging obscure issues, fixing production incidents, and explaining to stakeholders why things broke. Verification time is invested; debugging time is lost.

### The 30/60/90 Day Adoption Plan

Whether you're an individual, team lead, or engineering manager, this structured plan provides a concrete path to VID adoption.

#### **Days 1-30: Foundation & Awareness**

**Individual Contributors:**
- **Week 1:**
  - [ ] Read Chapters 1-3 (The paradigm shift)
  - [ ] Read Chapter 4 (Intent Before Generation)
  - [ ] Start: Write intent specification before every AI generation (even if just 2 sentences)
  - [ ] Track: Keep simple log of what you specified and what AI generated

- **Week 2:**
  - [ ] Read Chapter 5 (Graduated Trust) + Appendix D (Risk Rubric)
  - [ ] Practice: Assess risk for every task using the rubric
  - [ ] Start: Apply basic verification ritual to all AI-generated code (10-15 min minimum)

- **Week 3:**
  - [ ] Read Chapters 9-10 (Intent Specification & Verification Rituals)
  - [ ] Practice: Match verification depth to risk score
  - [ ] Track: Record time spent verifying vs. bugs caught

- **Week 4:**
  - [ ] Read Chapter 7 (Provenance Awareness)
  - [ ] Start: Add provenance markers to all commits (AI-generated vs. human-written)
  - [ ] Reflect: What verification techniques work best for you?
  - [ ] Milestone: First 30 days of consistent intent specification + verification

**Team Leads:**
- **Week 1:**
  - [ ] Share VID One-Page Overview with team
  - [ ] Identify 2-3 team members interested in pilot adoption
  - [ ] Schedule: 1-hour team introduction to VID for Week 2

- **Week 2:**
  - [ ] Facilitate team discussion: Do we have this problem?
  - [ ] Share 1-2 recent incidents that verification would have prevented
  - [ ] Decision: Commit to 30-day pilot with volunteer subset of team

- **Week 3-4:**
  - [ ] Pilot team applies VID practices (following IC track above)
  - [ ] Weekly check-in: What's working? What's hard?
  - [ ] Collect early wins: Document bugs caught during verification
  - [ ] Milestone: Team understanding of VID value proposition

**Engineering Managers:**
- **Week 1:**
  - [ ] Read VID for Engineering Managers guide
  - [ ] Review current metrics: Incident rates, debugging time, velocity trends
  - [ ] Identify 1-2 teams most affected by AI-generated code issues

- **Week 2:**
  - [ ] Meet with team leads: Present VID business case
  - [ ] Share: Incident data + costs of current approach
  - [ ] Decision: Select pilot team for VID adoption

- **Week 3-4:**
  - [ ] Communicate org-wide: Why verification matters, pilot team announcement
  - [ ] Allocate: Dedicated time for pilot team training (don't expect "free time")
  - [ ] Establish: Baseline metrics (pre-VID incident rates for pilot team)
  - [ ] Milestone: Org commitment to supporting VID experiment

---

#### **Days 31-60: Practice & Integration**

**Individual Contributors:**
- **Week 5-6:**
  - [ ] Read Chapters 13 or 14 (role-specific guidance)
  - [ ] Integrate: VID practices now feel routine, not forced
  - [ ] Expand: Apply verification rituals to legacy code you modify (not just new code)
  - [ ] Measure: Compare bugs caught in verification vs. Month 1

- **Week 7-8:**
  - [ ] Read Chapter 11 (Learning Loop)
  - [ ] Analyze: What types of bugs does your verification miss? What patterns escape?
  - [ ] Adjust: Refine your verification checklist based on learnings
  - [ ] Share: Teach one technique to a colleague
  - [ ] Milestone: Verification is habitual; you have data showing it works

**Team Leads:**
- **Week 5:**
  - [ ] Expand pilot: Invite rest of team to adopt VID practices
  - [ ] Share: Pilot team's results (bugs caught, time data, developer feedback)
  - [ ] Update: PR template with risk score + verification notes fields

- **Week 6:**
  - [ ] Facilitate: First team-wide risk calibration session (1 hour)
  - [ ] Align: What constitutes High/Moderate/Guarded/Minimal Trust for our codebase?
  - [ ] Document: Team's agreed risk scoring norms

- **Week 7-8:**
  - [ ] Establish: Monthly calibration meeting (first Friday of each month)
  - [ ] Track: Team-level metrics (% PRs with risk scores, bugs caught, incidents)
  - [ ] Celebrate: Public recognition for verification catches
  - [ ] Milestone: Whole team practicing VID, metrics show early results

**Engineering Managers:**
- **Week 5-6:**
  - [ ] Review: Pilot team metrics at 30 days
  - [ ] If successful: Approve rollout to 2-3 additional teams
  - [ ] If struggling: Diagnose blockers and provide support

- **Week 7-8:**
  - [ ] Invest: Formal training session for expanding teams (2-4 hours)
  - [ ] Resource: Allocate time for teams to adapt VID to their context
  - [ ] Communicate: Share pilot results org-wide (especially wins)
  - [ ] Milestone: Multiple teams practicing VID, leadership visibly supporting it

---

#### **Days 61-90: Optimization & Scale**

**Individual Contributors:**
- **Week 9-10:**
  - [ ] Refine: Your verification practices are now highly calibrated
  - [ ] Efficiency: Verification time is stable, not increasing
  - [ ] Confidence: You can explain every line of AI-generated code you commit

- **Week 11-12:**
  - [ ] Read Chapters 19-20 (Patterns & Verification Toolkit)
  - [ ] Contribute: Share your verification techniques with team
  - [ ] Mentor: Help onboard new team member to VID practices
  - [ ] Milestone: VID mastery—you verify efficiently without thinking about it

**Team Leads:**
- **Week 9:**
  - [ ] Analyze: 60-day metrics review with team
  - [ ] Compare: Pre-VID vs. current incident rates, debugging time
  - [ ] Identify: What verification gaps remain?

- **Week 10:**
  - [ ] Optimize: Remove bureaucratic parts of VID (if any emerged)
  - [ ] Standardize: Document team's adapted VID practices for onboarding
  - [ ] Share: Present results to engineering leadership

- **Week 11-12:**
  - [ ] Scale: New team members onboard to VID within first week
  - [ ] Automate: PR template enforces risk scoring, provenance marking
  - [ ] Celebrate: 90-day retrospective highlighting wins
  - [ ] Milestone: VID is "how we work," not "that new thing"

**Engineering Managers:**
- **Week 9-10:**
  - [ ] Decision: Based on data, expand VID org-wide or refine approach
  - [ ] Invest: If successful, build shared resources (templates, checklists, training materials)
  - [ ] Metrics: Establish org-level dashboard for VID quality metrics

- **Week 11-12:**
  - [ ] Policy: Update engineering standards to include VID practices
  - [ ] Recognition: Add verification quality to performance review criteria
  - [ ] Planning: Roadmap for next 6 months of VID maturation
  - [ ] Milestone: VID integrated into org culture and processes

---

### Success Indicators by Timeframe

**After 30 Days:**
- ✅ Team members can explain VID principles in their own words
- ✅ 50%+ of PRs include risk scores
- ✅ At least 3 bugs caught in verification that would have reached production
- ✅ Developers report verification feels manageable, not overwhelming

**After 60 Days:**
- ✅ 90%+ of PRs include risk scores + verification notes
- ✅ Team calibration is converging (less disagreement on risk)
- ✅ Measurable decrease in post-deployment defects (20%+ improvement)
- ✅ Verification time is stable (not growing indefinitely)

**After 90 Days:**
- ✅ Production incidents from AI code down 30%+
- ✅ Developer confidence survey shows >4.0/5.0 "I understand code I commit"
- ✅ New team members adopt VID practices within 1 week
- ✅ Team proposes improvements to VID based on experience
- ✅ Leadership can articulate clear ROI for VID investment

---

