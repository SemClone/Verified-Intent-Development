## Chapter 19: Patterns and Anti-Patterns

### Why Patterns Matter

Principles tell you what to value. Practices tell you what to do. But patterns show you what it looks like in reality—both when it works and when it fails.

This chapter presents concrete scenarios. Some show VID done well. Others show common failures. Study both. The failures are often more instructive.

---

### Pattern 1: The Specification-First Win

**The Scenario:**

Maya needs a function to calculate prorated subscription charges. A user upgrades mid-billing-cycle; the function determines how much to charge for the remaining days.

**The Anti-Pattern (how it usually goes wrong):**

Maya opens her AI assistant and types: "Write a function to calculate prorated subscription charges."

The AI generates something. It looks reasonable. Maya runs a quick test—upgrade on day 15 of a 30-day month. The result seems right. She commits.

Two weeks later, a customer complains they were overcharged. Finance investigates. The function doesn't handle months with different numbers of days correctly. It assumed 30 days always. February charges were wrong. So were charges in 31-day months.

Maya fixes the bug. But the damage is done—customers were overcharged, refunds are needed, trust is damaged.

**The Pattern (VID approach):**

Maya pauses before prompting. She writes:

```
Function: calculate_prorated_charge
Inputs:
  - original_price: monthly subscription cost
  - upgrade_date: date of upgrade
  - billing_cycle_start: first day of current billing period

Output: dollar amount to charge (rounded to cents)

Behavior:
  - Calculate days remaining from upgrade_date to end of billing cycle
  - Prorate based on actual days in that specific month
  - Round to nearest cent

Edge cases:
  - upgrade_date equals billing_cycle_start: charge full amount
  - upgrade_date is last day of cycle: charge for 1 day
  - February (28/29 days): must handle correctly
  - 31-day months: must handle correctly

Verification:
  - Test with Feb 15 in non-leap year (14 days remaining of 28)
  - Test with Feb 15 in leap year (14 days remaining of 29)
  - Test with Jan 15 (17 days remaining of 31)
  - Test with Jun 15 (15 days remaining of 30)
  - Test upgrade on day 1 (full charge)
  - Test upgrade on last day (1 day charge)
```

Now Maya prompts the AI with this specification. The AI generates code. Maya runs her pre-planned tests. The February test fails—the AI assumed 30 days. Maya catches it before commit.

She either fixes the code or prompts again with explicit instructions about variable month lengths. The final code handles all cases correctly.

**The Lesson:**

The time Maya spent writing the specification was less than the time Anti-Pattern Maya spent on customer complaints, investigation, fixes, and refunds. Specification isn't overhead—it's the shortest path to correct code.

---

### Pattern 2: Graduated Trust in Action

**The Scenario:**

A team is building a new feature. It involves three components:
1. A utility to format currency for display
2. An endpoint to update user profile information
3. A function to process refunds

**The Anti-Pattern:**

The team treats all three equally. Each gets the same cursory review: glance at the code, run a quick test, approve the PR.

Six months later:
- The currency formatter has a bug with negative numbers. It displays "-$-50" instead of "-$50". Embarrassing but minor—it only affects a rarely-used report.
- The profile endpoint has a bug. It doesn't validate email format. Users enter invalid emails, then can't receive notifications. Support tickets pile up.
- The refund function has a serious bug. Under certain conditions, it processes refunds twice. The company loses $200,000 before anyone notices.

**The Pattern:**

The team assesses each component:

*Currency formatter:*
- Impact if wrong: Minor display issue
- Reversibility: Easy fix, redeploy
- Exposure: Internal report
- **Verdict: High trust, basic verification**

*Profile endpoint:*
- Impact if wrong: User experience problems, support burden
- Reversibility: Can fix but affected users remain in bad state
- Exposure: All users
- **Verdict: Moderate trust, standard verification including input validation review**

*Refund function:*
- Impact if wrong: Financial loss, potentially significant
- Reversibility: Money already gone, hard to recover
- Exposure: Every refund transaction
- **Verdict: Minimal trust, intensive verification**

They allocate time accordingly:
- Currency formatter: 10 minutes, automated tests, quick review
- Profile endpoint: 30 minutes, systematic input validation check, edge case testing
- Refund function: 2 hours, multiple reviewers, explicit test of idempotency, audit trail verification, sign-off from senior engineer

The refund double-processing bug gets caught in review. The profile email validation gets added. The currency formatter ships with minimal review—and yes, it has the negative number bug, but that's discovered and fixed with minimal impact.

**The Lesson:**

Equal treatment of unequal risks is wasteful at best, catastrophic at worst. The refund bug could have bankrupted a startup. Catching it was worth the extra two hours.

---

### Pattern 3: The Understanding Trap

**The Scenario:**

Carlos needs to implement a caching layer. He's not an expert in caching, but the AI generates something that looks sophisticated.

**The Anti-Pattern:**

Carlos prompts: "Implement an LRU cache with TTL support."

The AI generates 80 lines of code with a doubly-linked list, a hash map, timestamp tracking, and cleanup logic. Carlos reads through it. It looks professional. He doesn't fully understand the linked list manipulation, but the tests pass.

He ships it.

Three weeks later, production experiences memory growth. The cache isn't releasing memory correctly. Carlos investigates. He stares at the linked list code. He doesn't understand it. He can't debug what he doesn't understand.

He spends two days learning how doubly-linked lists work in this context, then another day finding the bug: a reference wasn't being cleared during eviction, preventing garbage collection.

Total cost: three days of debugging code he didn't understand. Plus the production incident.

**The Pattern:**

Carlos prompts for the cache implementation. The AI generates the same sophisticated code.

Carlos reads it. He doesn't fully understand the linked list manipulation. He stops.

He asks himself: "Do I understand this well enough to debug it when it breaks?"

The answer is no.

Carlos has options:

*Option A: Learn enough to understand*
He spends two hours studying how LRU caches work with doubly-linked lists. He traces through the AI's code. Now he understands it. He can verify it properly and debug it later.

*Option B: Simplify*
He prompts again: "Implement a simpler LRU cache using OrderedDict" (in Python) or equivalent simple approach. The result is less sophisticated but understandable. It might be slightly slower, but Carlos can verify and maintain it.

*Option C: Get help*
He asks a colleague who knows caching to review with him. Together they verify the implementation. Carlos learns enough to maintain it.

Carlos chooses Option B. The simpler cache is 20% slower but completely understandable. It ships without issues. When a bug eventually surfaces (wrong TTL calculation), Carlos fixes it in 20 minutes because he understands the code.

**The Lesson:**

Sophisticated code you don't understand is a liability, not an asset. The time saved by accepting complex AI output is borrowed from your future self, with interest.

---

### Pattern 4: The Provenance Blind Spot

**The Scenario:**

A team has been using AI assistance heavily for six months. The codebase has grown substantially.

**The Anti-Pattern:**

No one tracked what was AI-generated versus human-written. Commit messages just say "Add feature X" or "Fix bug Y."

Now they need to audit their code for potential IP issues. A large enterprise customer requires attestation that code doesn't infringe third-party IP.

The team realizes they have no idea which parts of their codebase were AI-generated. They can't assess risk. They can't provide attestation.

Their options:
- Manually review the entire codebase (expensive)
- Provide attestation without knowing (risky)
- Lose the enterprise customer (costly)

They also discover a security pattern that's been copy-pasted throughout the codebase. It has a vulnerability. They don't know where it came from. Did a human write it? Did AI generate it? Was it in one place originally and spread, or generated multiple times?

Without provenance, they can't trace the origin or assess how it spread.

**The Pattern:**

From the start, the team maintains provenance awareness:

- Commit messages indicate AI assistance: "Add user authentication (AI-assisted, reviewed by @carlos)"
- A simple convention marks sections of code: `# AI-generated: initial implementation` or `# Human: security-critical logic`
- PR descriptions note what was AI-generated and what review it received

Six months later, they face the same enterprise audit request.

They can identify AI-generated code. They can show it was reviewed. They can provide meaningful attestation: "Our codebase includes AI-assisted code in these areas, which underwent our standard review process including security verification."

When the vulnerability pattern appears, they trace it: originally AI-generated in one file, then copied (by humans) to other files. They know exactly where to look and can assess the scope of the problem.

**The Lesson:**

Provenance tracking costs almost nothing in the moment. Reconstructing provenance later costs enormously—if it's even possible.

---

### Pattern 5: The Security Review That Wasn't

**The Scenario:**

A developer needs to build a password reset flow. The AI generates code that:
- Generates a reset token
- Stores it in the database
- Emails it to the user
- Accepts the token on a reset page
- Updates the password

**The Anti-Pattern:**

The developer reviews the code. It looks correct. The token is generated. It's stored. It's emailed. The reset works. Ship it.

Three months later, attackers discover:
- The token is generated using predictable random numbers
- There's no expiration on tokens
- There's no rate limiting on the reset request endpoint
- The token is passed in the URL (and thus logged everywhere)
- The same token can be used multiple times

None of these were obviously visible in the code. The code "worked." It just wasn't secure.

**The Pattern:**

The developer recognizes password reset as security-critical (authentication-adjacent, affects account access). This triggers intensive verification including security review.

For the security review, they consider:

*Token generation:*
- Is the random number generator cryptographically secure?
- Is the token long enough to prevent brute force?
- Is there sufficient entropy?

*Token lifecycle:*
- Does the token expire?
- Is expiration enforced server-side (not just client-side)?
- Is the token invalidated after use?
- Is it invalidated if the user requests another reset?

*Attack surface:*
- Can attackers enumerate valid tokens?
- Is there rate limiting to prevent brute force?
- Are failed attempts logged?

*Token handling:*
- Is the token transmitted securely?
- Is it stored securely?
- Does it appear in logs?

The developer checks each of these against the AI-generated code. They find:
- Token generation uses basic random, not cryptographic random → fix
- No expiration → add expiration
- Token appears in URL query parameters → move to POST body
- No rate limiting → add rate limiting
- Token works multiple times → add single-use enforcement

The fixed implementation ships without the vulnerabilities.

**The Lesson:**

Security review isn't checking if code looks right. It's systematically considering how code could be attacked and whether it resists those attacks.

---

### Pattern 6: The Maintenance Nightmare

**The Scenario:**

A feature was built quickly using heavy AI assistance. It works. It ships. Everyone moves on.

**The Anti-Pattern:**

A year later, the feature needs modification. The original developer has left. A new developer opens the code.

They find:
- 500 lines in a single function
- Variables named `temp`, `data`, `result`, `x`
- No comments explaining the business logic
- Deeply nested conditionals (if inside if inside if inside if)
- Magic numbers throughout (why 86400? why 0.035?)
- Duplicated code blocks with slight variations

The new developer spends three days just understanding what the code does. They're afraid to change it because they might break something they don't understand.

Eventually, they give up on modifying the existing code. They rewrite the feature from scratch. A month of work to add what should have been a two-day feature.

**The Pattern:**

During original development, the developer applies maintainability verification:

They ask: "Could someone else understand this in a year?"

The AI-generated code has the same issues: one long function, poor names, no comments.

Before accepting it, the developer refactors:
- Breaks the long function into smaller, named functions (`calculate_shipping_cost`, `apply_discount`, `validate_address`)
- Renames variables to be meaningful (`seconds_per_day` instead of 86400, `commission_rate` instead of 0.035)
- Adds comments explaining *why*, not *what* (the what is in the code; the why is the business logic)
- Eliminates duplication by extracting common patterns
- Reduces nesting by early returns and guard clauses

This takes an extra hour.

A year later, the new developer opens the code. They understand the structure in 15 minutes. They find the function that needs modification. They make the change in two days as expected.

**The Lesson:**

An hour of maintainability work saves months of future confusion. AI generates working code, but working code isn't necessarily maintainable code.

---

### Anti-Pattern Catalog

Here are common VID anti-patterns in brief:

**"It compiled, so it's correct"**
Code that compiles can be completely wrong. Compilation is syntax checking, not semantic verification.

**"The tests pass"**
Tests only verify what they test. If the tests don't cover the bug, they won't catch it. Passing tests are necessary but not sufficient.

**"I'll understand it later"**
You won't. Understanding erodes quickly. If you don't understand it now, you'll understand it less in a month.

**"This is just like last time"**
Similar-looking code can have very different behavior. Verify each instance; don't assume patterns transfer.

**"AI knows what I meant"**
AI guesses what you meant based on your words. It often guesses wrong. Specify explicitly.

**"It's just internal tooling"**
Internal tools become critical infrastructure. Today's quick script is tomorrow's system dependency.

**"We're moving fast"**
Fast without verification is fast toward failure. Real speed includes time to verify.

**"No one will misuse it"**
Someone will. Assume adversarial use and verify accordingly.

**"The senior dev approved it"**
Approval isn't verification. Did they actually verify, or did they trust without checking?

**"We've always done it this way"**
Past success doesn't guarantee future success, especially as AI capabilities and risks change.

---

