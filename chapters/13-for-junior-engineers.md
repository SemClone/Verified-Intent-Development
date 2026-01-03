## Chapter 13: The Junior Engineer's Path to Verification Mastery

### The Paradox You Face

You're learning to code at a strange moment in history. AI can generate code faster than you can type it. This creates a paradox:

**The shortcut that helps you today will cripple you tomorrow.**

If you let AI generate code you don't understand, you'll ship features quickly. You'll look productive. But you won't be learning. And when things break—they always break—you won't be able to fix them. You'll become dependent on AI without developing the judgment to know when AI is wrong.

The engineers who will thrive learned verification *first*. They used AI as a learning accelerator, not a learning bypass.

This chapter provides a path to becoming that engineer.

---

### The 12-Week Curriculum

This curriculum assumes you have basic programming knowledge. You can write simple programs. You understand variables, functions, loops, and conditionals. You may have used AI coding assistants casually.

The goal is to transform you from someone who *uses* AI to generate code into someone who can *verify* AI-generated code reliably—and in the process, become a much stronger engineer than you would have been otherwise.

---

## Phase 1: Foundations (Weeks 1-3)

### Week 1: Learning to Read Code Critically

**The Goal:** Develop the habit of reading code carefully before accepting it.

**The Problem You're Solving:** Most developers skim code. They look for obvious errors and move on. This works when you wrote the code yourself (you already understand it). It fails catastrophically with AI-generated code.

**Daily Practice (30-45 minutes):**

Take a small piece of AI-generated code (one function, 10-30 lines) and analyze it completely.

1. **Read it aloud.** Literally speak each line. This forces you to actually read rather than skim.

2. **Trace execution.** Pick a specific input. Walk through line by line. What value does each variable have at each step? Write it down.

3. **Identify assumptions.** What does this code assume about its inputs? What happens if those assumptions are violated?

4. **Find the edges.** What inputs would cause this code to behave unexpectedly? Empty inputs? Very large inputs? Negative numbers? Null values?

5. **Explain it.** Write a 2-3 sentence explanation of what this code does and how. If you can't explain it clearly, you don't understand it.

**Exercise 1.1: The Explanation Challenge**

Generate 5 simple functions using AI (string manipulation, basic math, list operations). For each:
- Write your explanation *before* running any tests
- Then test with various inputs
- Compare actual behavior to your explanation
- Note any surprises

Track: How often did the code do exactly what you expected? Where were you surprised?

**Exercise 1.2: Bug Hunting**

Ask AI to generate functions with intentional prompts that might produce subtle bugs:
- "Write a function to calculate average" (what if the list is empty?)
- "Write a function to find the second-largest number" (what if there are duplicates?)
- "Write a function to check if a string is a palindrome" (what about case? spaces?)

Your job: Find the bugs before running the code. Then verify.

**Exercise 1.3: The Trace Journal**

Keep a journal this week. For every AI-generated function you use:
- Write the input/output trace for at least 2 inputs
- Note one edge case you identified
- Record whether your analysis found any issues

**End of Week Assessment:**

You should be able to:
- Read a 20-line function and explain what it does without running it
- Identify at least 2 edge cases for any function
- Predict output for specific inputs before testing

**Common Mistakes This Week:**

The most common mistake beginners make is skimming code instead of truly reading it. If you can't explain what each line does, you skimmed rather than read. Force yourself to slow down and actually process what the code says.

Another trap is substituting testing for tracing. Running the code and seeing it produce correct output isn't the same as understanding how it works. Trace execution manually first, predicting what will happen, then test to verify your understanding.

Finally, resist accepting "it works" as sufficient understanding. Code that passes tests isn't necessarily understood code. You need to know not just that it works, but why it works and when it might not work.

---

### Week 2: Intent Specification Practice

**The Goal:** Build the habit of knowing what you want before you ask AI for it.

**The Problem You're Solving:** Most AI interactions start with vague prompts. "Write a function to handle dates." Handle how? What dates? What should happen with invalid dates? Vague prompts produce code that might not match your actual need—and you won't notice because you weren't clear about your need.

**Daily Practice (30-45 minutes):**

Before any code generation:

1. **Write the function signature first.** What's the name? What are the parameters and their types? What's the return type?

2. **Write example calls.** Give 3-5 concrete examples of how you'd call this function and what it should return.

3. **Write the edge cases.** What happens with empty input? Null? Invalid values? Extremely large values?

4. **Write the error cases.** When should this function fail? How should it fail?

Only after writing all this do you prompt the AI.

**Exercise 2.1: The Spec-First Challenge**

Choose 5 programming problems (sorting, searching, string manipulation, etc.). For each:

1. Write a complete specification (signature, examples, edges, errors) — spend at least 10 minutes
2. Then prompt AI to implement it
3. Verify the implementation against your specification
4. Note: Did the AI match your spec? Where did it differ?

**Exercise 2.2: Spec Critique**

Look at these vague intents. Rewrite each as a complete specification:

*Vague:* "Function to validate email"
- What makes an email valid?
- What should return type be? Boolean? Error message?
- What about edge cases like very long emails, unicode characters, multiple @ signs?

*Vague:* "Function to split a bill"
- Split how? Evenly? By item? By percentage?
- What about tax? Tip?
- What if amounts don't divide evenly?
- What's the input format? Output format?

*Vague:* "Function to check password strength"
- What criteria? Length? Character types? Common passwords?
- What's the output? Boolean? Score? Specific feedback?
- What are the thresholds?

Write complete specs for each. Compare with a peer if possible.

**Exercise 2.3: The Retroactive Spec Test**

Find code you wrote (or AI generated) last week without a clear spec. Now write the spec that *should* have existed. Then check: does the code actually meet this spec? Often you'll find it doesn't—because you weren't clear about what you needed.

**End of Week Assessment:**

You should be able to:
- Write a complete spec (signature, examples, edges, errors) in 10 minutes
- Identify 3+ ambiguities in any vague requirement
- Verify implementation against spec systematically

**Common Mistakes This Week:**

Vague specifications plague beginners. Writing "Handle errors appropriately" isn't a specification—it's wishful thinking. How should errors be handled? Which errors? What's appropriate? Force yourself to be concrete and specific.

Edge cases are easy to forget when you're focused on the happy path. Make it a habit: empty inputs, null values, very large numbers, very small numbers, duplicates, negative values—run through this mental checklist for every specification you write.

The strongest temptation is skipping straight to prompting the AI. You know what you want (sort of), so why not just ask? Because vague prompts produce vague code. Resist the urge. Specification first, generation second, always.

---

### Week 3: Calibrating Trust

**The Goal:** Develop judgment about when to verify deeply vs. when to verify lightly.

**The Problem You're Solving:** You can't verify everything deeply—there isn't time. But you can't verify everything lightly—too many bugs will escape. You need judgment about what deserves attention.

**Daily Practice (30-45 minutes):**

For every piece of code you work with:

1. **Assess impact.** What's the worst case if this code is wrong? Categorize: trivial / annoying / problematic / serious / severe

2. **Assess reversibility.** If this breaks in production, how easily can we fix it? Categorize: instant / easy / difficult / very hard / impossible

3. **Assess exposure.** Who/what is affected? Just me / my team / internal users / external users / everyone

4. **Decide verification depth.** Based on assessments, choose: quick check / standard review / deep analysis / intensive verification

**Exercise 3.1: Risk Calibration Scenarios**

For each scenario below, assess impact (what's the worst that could happen?), reversibility (how easily can we fix it if it breaks?), and exposure (who's affected?). Based on your assessment, decide how much verification each deserves.

**Quick Reference: Scenarios at a Glance**

Before reading the detailed analysis, try scoring these yourself:

| # | Scenario | Your Impact (1-5) | Your Reversibility (1-5) | Your Exposure (1-5) | Your Trust Level |
|---|----------|-------------------|--------------------------|---------------------|------------------|
| 1 | Logging function for debug messages | ? | ? | ? | ? |
| 2 | Input validation for public signup form | ? | ? | ? | ? |
| 3 | Calculation for displaying shipping dates | ? | ? | ? | ? |
| 4 | Password hashing for authentication | ? | ? | ? | ? |
| 5 | Archive old records to cold storage | ? | ? | ? | ? |
| 6 | Generate unique IDs for database records | ? | ? | ? | ? |
| 7 | Endpoint that deletes user accounts | ? | ? | ? | ? |
| 8 | Currency formatting for display | ? | ? | ? | ? |
| 9 | Rate limiting logic for API | ? | ? | ? | ? |
| 10 | Report generator for internal dashboards | ? | ? | ? | ? |

*Fill this out before reading further. Then compare your assessments with the detailed analysis below.*

---

**Detailed Scenario Analysis:**

Consider a **logging function that formats debug messages**. If this breaks, what happens? Debug output looks weird. Can you fix it quickly? Absolutely—change the code and redeploy. Who's affected? Primarily developers. This is genuinely lower risk, though you should still verify the basics to avoid wasting developer time on broken logs.

Now contrast that with **input validation for a public signup form**. If this breaks? Attackers might register with malicious data, or legitimate users might be blocked. Can you fix it easily? Yes, but damage might already be done. Who's affected? All potential users, and possibly your production database. This demands careful verification—security implications, edge cases, error handling.

Consider **password hashing for user authentication**. If this is wrong, user accounts could be compromised. Reversibility is irrelevant—the damage is permanent the moment someone's password is exposed. Exposure is total: every user. This requires intensive verification. You need to understand exactly how the hashing works, verify it matches security best practices, check for timing attacks, ensure salts are unique.

Think about **an endpoint that deletes user accounts**. This is a destructive action. If it accidentally deletes the wrong accounts, that data is gone. If it lacks proper authorization checks, any user could delete any account. Impact: severe. Reversibility: difficult or impossible without backups. Exposure: potentially all users. This is high-risk code that demands intensive verification.

Contrast with **a function that formats currency for display**. Wrong output is visible but not destructive. Users might see "$1234" instead of "$1,234.00"—annoying but fixable immediately. Lower risk, lighter verification, though you should still check edge cases like very large numbers and different currencies.

After working through these scenarios yourself, compare your assessments with this guide:

**Risk Calibration Summary Table**

| Scenario | Impact | Reversibility | Exposure | Risk Score | Trust Level | Verification Time |
|----------|--------|---------------|----------|------------|-------------|-------------------|
| **1. Logging function** | 1-2 (minor) | 1 (instant fix) | 2 (developers) | 6-8 | High Trust | 5-10 min |
| **2. Input validation (signup)** | 4 (security/UX) | 3 (damage done) | 4 (all users) | 26 | Guarded Trust | 30-60 min |
| **3. Shipping date display** | 2 (UX issue) | 2 (quick fix) | 3 (customers) | 12 | Moderate Trust | 15-30 min |
| **4. Password hashing** | 5 (critical) | 5 (irreversible) | 5 (all users) | 35 | Minimal Trust | 1-3+ hours |
| **5. Archive old records** | 4 (data loss) | 4 (very hard) | 3 (internal) | 26 | Guarded Trust | 30-60 min |
| **6. Generate unique IDs** | 4 (data integrity) | 4 (migrations) | 4 (all users) | 28 | Guarded Trust | 30-60 min |
| **7. Delete user accounts** | 5 (data loss) | 5 (impossible) | 5 (users) | 35 | Minimal Trust | 1-3+ hours |
| **8. Currency formatting** | 2 (display bug) | 1 (instant) | 3 (customers) | 10 | High Trust | 5-10 min |
| **9. Rate limiting (API)** | 4 (DoS/abuse) | 3 (redeploy) | 4 (all users) | 26 | Guarded Trust | 30-60 min |
| **10. Internal reports** | 2 (wrong data) | 2 (regenerate) | 2 (internal) | 10 | High Trust | 5-10 min |

**Formula Reminder:** Risk Score = (Impact × 3) + (Reversibility × 2) + (Exposure × 2) + Compliance

**Key Patterns:**
- **Destructive operations** (#4, #5, #7): Always high risk—data loss is irreversible
- **Security boundaries** (#2, #4, #9): Require careful verification—mistakes have cascading effects
- **Display/formatting** (#1, #3, #8, #10): Generally lower risk—annoying but fixable
- **Data integrity** (#6): Moderate-to-high risk—affects every future operation

**Exercise 3.2: Your Risk History**

Think about code you wrote or used recently. For each piece:
- What was your implicit risk assessment?
- How much verification did you actually do?
- In retrospect, was that appropriate?

Many developers discover they over-verify trivial code (it's easy) and under-verify important code (it's harder and they're tired).

**Exercise 3.3: The Calibration Journal**

This week, for every verification decision:
- Record what you verified and how deeply
- Record your reasoning
- At end of week, review: Do your decisions make sense? Any patterns of over/under verification?

**End of Week Assessment:**

You should be able to:
- Assess risk across impact, reversibility, and exposure quickly
- Match verification depth to risk level consistently
- Explain why you chose a particular verification depth

**Common Mistakes This Week:**

New engineers often treat everything as high risk because they lack confidence. But if everything is critical, nothing is. You must differentiate. A logging function genuinely carries less risk than authentication logic, and treating them the same wastes time and attention.

Familiarity bias cuts the other way: code that feels familiar feels safe, even when it's not. Unfamiliar patterns feel risky even when they're low-stakes. Remember that risk is about actual impact—what happens if this breaks—not about your comfort level with the code.

The most insidious mistake is rationalizing. Calling something "low risk" because you don't want to do the verification work is self-deception. Be ruthlessly honest with yourself about why you're making calibration decisions.

---

## Phase 2: Building Verification Skills (Weeks 4-7)

You've built the foundations: you can read code critically, specify intent clearly, and calibrate verification depth to risk. Now you'll develop the specific verification skills that let you evaluate code across multiple dimensions. Each week in this phase focuses on a different aspect of verification—functional correctness, semantic alignment, security, and maintainability. By the end, you'll be able to assess code comprehensively, not just check that it runs without errors.

### Week 4: Functional Verification

**The Goal:** Learn to verify that code does what it's supposed to do.

> **Cross-reference:** This week introduces the functional verification techniques detailed in Chapter 20 (input partitioning, boundary analysis, category testing). Reference those sections when you need more depth.

**The Problem You're Solving:** "It works" is not verification. Code that works for one input might fail for others. Functional verification systematically checks that code meets its specification across its intended domain.

**Daily Practice (45-60 minutes):**

For each function you work with:

1. **Identify categories of inputs.** What are the meaningfully different kinds of inputs? (e.g., for a search: found vs. not found, empty list, one item, many items)

2. **Select representatives.** Pick at least one input from each category.

3. **Determine expected output.** Before running, what should the output be?

4. **Test and compare.** Run the code, compare to expectations.

5. **Investigate surprises.** If output differs from expectation, is your expectation wrong, or is the code wrong?

**Exercise 4.1: Category Analysis**

For each function type, list input categories that should be tested:

1. A function that finds the maximum value in a list
   - List with one item
   - List with multiple items (max at start, middle, end)
   - List with all same values
   - List with negative numbers
   - Empty list
   - List with very large numbers

2. A function that validates a phone number
   - (You identify the categories)

3. A function that calculates days between two dates
   - (You identify the categories)

4. A function that merges two sorted lists
   - (You identify the categories)

**Exercise 4.2: Test Case Design**

Take a function you've recently generated with AI. Write test cases that cover:
- Normal operation (typical inputs)
- Boundary conditions (edges of valid input ranges)
- Error conditions (invalid inputs)
- Special cases (empty, null, very large)

Aim for 8-12 test cases for a single function. Run them. Did any fail?

**Exercise 4.3: The Mutation Game**

This exercise builds intuition for what tests actually verify.

1. Take a working, tested function
2. Introduce a small bug intentionally (change a < to <=, change a + to -, off-by-one error)
3. Run your tests
4. Did any test catch the bug?

If no test caught it, your tests have a gap. What test would have caught it?

This teaches you that tests only verify what they test. Passing tests doesn't mean no bugs—it means no bugs *that the tests check for*.

**End of Week Assessment:**

You should be able to:
- Identify 6+ input categories for any function
- Design test cases that cover categories systematically
- Recognize when tests are insufficient (gaps in coverage)

**Common Mistakes This Week:**

Beginners naturally focus on the happy path—testing only normal operation with typical inputs. This feels productive because tests pass. But most bugs live off the happy path, in edge cases and error conditions you didn't test.

Some developers react by throwing random inputs at code, hoping to find problems. This isn't systematic verification—it's chaos. Random testing might stumble on bugs, but it won't give you confidence. Categorize your inputs thoughtfully instead.

The most dangerous mistake is trusting test passage as proof of correctness. Tests only verify what they check. Passing tests mean the code works for the scenarios you tested, nothing more. The bugs you didn't test for can still be there, waiting.

---

### Week 5: Semantic Verification

**The Goal:** Learn to verify that code does what was *intended*, not just what was *specified*.

> **Cross-reference:** This week builds on the semantic verification techniques in Chapter 20 (intent alignment, implicit expectations, context checking). Use those techniques as you practice.

**The Problem You're Solving:** Specifications are imperfect. They describe what we think we want, but we often have implicit expectations we didn't specify. Semantic verification bridges the gap between specification and true intent.

**Daily Practice (45-60 minutes):**

For each piece of functionality:

1. **Ask "why?"** Why does this code exist? What problem does it solve? What would the user expect?

2. **Check alignment.** Does the code's behavior align with the underlying purpose, not just the written spec?

3. **Consider context.** How will this be used in practice? Does behavior make sense in that context?

4. **Identify implicit expectations.** What behaviors would users/callers assume even if not specified?

**Exercise 5.1: Intent vs. Spec Analysis**

For each scenario, identify the gap between spec and intent:

*Scenario 1:*
Spec: "Function returns user's age in years"
Code: Returns the difference between current year and birth year
Intent gap: What about someone born in December asked in January? They'd be "10" when they're actually still 9.

*Scenario 2:*
Spec: "Function splits a string into words"
Code: Splits on space character
Intent gap: (What about multiple spaces? Tabs? Newlines?)

*Scenario 3:*
Spec: "Function calculates shipping cost based on weight"
Code: Returns weight * rate
Intent gap: (What implicit expectations might exist?)

*Scenario 4:*
Spec: "Function checks if username is available"
Code: Returns true if username not in database
Intent gap: (What about case sensitivity? Reserved names? SQL injection?)

**Exercise 5.2: The User Story Test**

Take a function you're working with. Write a brief user story:
"As a [user type], I want to [action] so that [benefit]"

Now review the code through the user's eyes:
- Does the behavior make sense for this user?
- Would the user be surprised by any behavior?
- What would the user assume that might not be true?

**Exercise 5.3: The Peer Explanation**

Find a peer (or imagine one). Explain what a piece of code is *for*, not just what it *does*. As you explain, you'll often notice gaps:

"This function validates emails... well, actually it just checks for an @ symbol... but for our purposes that's probably... hmm, actually someone could put 'x@x' and it would pass... is that okay?"

The act of explaining intent reveals gaps between code and purpose.

**End of Week Assessment:**

You should be able to:
- Articulate the purpose behind any code you work with
- Identify at least 2 implicit expectations for any function
- Recognize when code technically meets spec but violates intent

**Common Mistakes This Week:**

Engineers trained on specifications naturally stop when code matches the spec. "It does what the spec says"—task complete! But specs are imperfect human artifacts. If the spec is incomplete or wrong, compliance with it isn't success.

Context gets ignored when you verify code in isolation. You check whether a function works on its own, forgetting that it exists within a system. Behavior that seems fine for an isolated function might be completely wrong in the context where it's actually used.

Perhaps the subtlest mistake is assuming your implicit expectations are shared by others. You think "of course it should handle unicode," but the person who wrote the spec assumed ASCII. Your assumptions and theirs diverge invisibly until something breaks. Make implicit expectations explicit.

---

### Week 6: Security Verification

**The Goal:** Learn to identify security implications in code.

> **Cross-reference:** Pair this week with the security techniques in Chapter 20 (sections on adversarial testing and provenance hygiene) so you're practicing the same toolkit the rest of the organization uses.

**The Problem You're Solving:** AI generates code that works. It rarely generates code that's secure against adversarial input. Security thinking requires considering how code could be misused, not just how it's intended to be used.

**Prerequisite Understanding:**

Before this week, ensure you understand these concepts (research if needed):
- Input validation and sanitization
- Injection attacks (SQL, command, XSS)
- Authentication vs. authorization
- Data exposure risks
- The principle of least privilege

**Daily Practice (45-60 minutes):**

For each piece of code:

1. **Identify inputs.** What data enters this code? From where?

2. **Assume hostility.** What if that input comes from an attacker? What's the worst they could do?

3. **Trace sensitive data.** If this code touches sensitive data, where does that data go? Could it be exposed?

4. **Check access control.** Does this code verify the caller has permission to do what they're asking?

5. **Look for trust boundaries.** Where does code assume input is safe? Are those assumptions valid?

**Exercise 6.1: Attack Vector Identification**

For each code pattern, identify potential attack vectors:

```python
# Pattern 1: Database query
def get_user(username):
    query = f"SELECT * FROM users WHERE name = '{username}'"
    return db.execute(query)
```
Attack vectors: (SQL injection - what if username is "'; DROP TABLE users; --"?)

```python
# Pattern 2: File access
def read_config(filename):
    with open(f"/app/config/{filename}") as f:
        return f.read()
```
Attack vectors: (What if filename is "../../../etc/passwd"?)

```python
# Pattern 3: HTML output
def display_comment(comment):
    return f"<div class='comment'>{comment}</div>"
```
Attack vectors: (What if comment contains <script>alert('xss')</script>?)

```python
# Pattern 4: Command execution
def convert_image(input_path, output_path):
    os.system(f"convert {input_path} {output_path}")
```
Attack vectors: (What if paths contain shell metacharacters?)

**Exercise 6.2: Security Review Practice**

Take a piece of AI-generated code that handles user input. Perform a security review:

1. List every input to the code
2. For each input, list what an attacker could provide
3. For each attack input, trace what happens
4. Identify which attacks succeed and which are blocked
5. For successful attacks, what's the fix?

**Exercise 6.3: The STRIDE Walkthrough**

STRIDE is a threat modeling framework. For a function you're reviewing, consider each threat:

- **S**poofing: Could someone pretend to be someone else?
- **T**ampering: Could someone modify data they shouldn't?
- **R**epudiation: Could someone deny they did something?
- **I**nformation disclosure: Could sensitive data be exposed?
- **D**enial of service: Could someone make this unavailable?
- **E**levation of privilege: Could someone gain unauthorized access?

Not every threat applies to every function, but considering all six ensures you don't miss anything.

**End of Week Assessment:**

You should be able to:
- Identify inputs and trust boundaries in any code
- Recognize common vulnerability patterns (injection, path traversal, XSS)
- Apply threat modeling framework to code review

**Common Mistakes This Week:**

The cardinal sin of security is assuming inputs are safe. Perhaps the data comes from your own frontend, so it must be trustworthy, right? Wrong. Never trust input. Ever. Not from users, not from your frontend, not from other internal services. Treat all input as potentially hostile.

Many developers treat security as an afterthought—something to think about after the code works. But security issues are vastly cheaper to fix early, and they're often architectural. Bolting security onto working code is harder than building it in from the start. Always consider security implications as you verify.

The most revealing mistake is the phrase "No one would do that." You see a potential attack vector but dismiss it as too unlikely, too weird, too much effort for an attacker. Attackers do unexpected things. That's literally their job. If an attack is possible, assume someone will try it.

---

### Week 7: Maintainability Verification

**The Goal:** Learn to evaluate whether code can be understood and modified in the future.

> **Cross-reference:** This week applies the maintainability verification techniques from Chapter 20 (naming review, complexity assessment, documentation quality). Practice with those specific checklists.

**The Problem You're Solving:** Code is read more than it's written. AI generates code that works but is often hard to understand or modify. Maintainability verification ensures code won't become a burden.

**Daily Practice (45-60 minutes):**

For each piece of code:

1. **Read without context.** Can someone who didn't write this understand what it does?

2. **Predict modification.** What changes are likely in the future? How hard would they be?

3. **Identify complexity.** Where is this code hard to follow? Why?

4. **Check documentation.** Are there comments where needed? Are they accurate? Are they helpful?

5. **Evaluate naming.** Do names convey meaning? Would you understand the purpose from names alone?

**Exercise 7.1: The Stranger Test**

Take code you generated last week. Pretend you've never seen it before. Time yourself:
- How long until you understand what it does?
- How long until you could confidently modify it?
- What confused you?

If understanding takes more than a few minutes for simple code, maintainability is poor.

**Exercise 7.2: Future Modification Prediction**

For a piece of code, list 5 changes that might be needed in the future:
- New feature addition
- Bug fix
- Performance improvement
- Integration with new system
- Behavior change

For each change, assess:
- How hard would this change be?
- What would you have to understand?
- What could go wrong?

Code that makes changes hard has poor maintainability.

**Exercise 7.3: Refactoring for Clarity**

Take an AI-generated function that works but is unclear. Refactor it purely for readability:
- Better variable names
- Extract confusing logic into well-named helper functions
- Add comments where truly needed (not obvious things)
- Simplify complex conditions

Before/after comparison: is it easier to understand?

**Exercise 7.4: The Documentation Challenge**

Write documentation for a function that has none:
- What does it do?
- What are the parameters and what do they mean?
- What does it return?
- What can go wrong?
- What are the assumptions/prerequisites?

Now check: did you have to read the code deeply to write this? If the code had been clear, documentation would have been quick.

**End of Week Assessment:**

You should be able to:
- Estimate time-to-understand for code
- Identify maintainability problems (complexity, naming, documentation)
- Refactor for clarity without changing behavior

**Common Mistakes This Week:**

When asked about maintainability, developers instinctively respond "I understand it." Of course you do—you just wrote it, or you just accepted it from AI. The question isn't whether present-you understands it. The question is whether future-you, six months from now after working on completely different code, will understand it. Or whether your teammate will understand it.

Over-documentation wastes time and attention. Comments that simply repeat what code clearly expresses add noise without value. If your code says `user.activate()`, a comment saying "activate the user" helps no one.

Under-documentation is equally problematic. Complex logic with no explanation forces future readers to reverse-engineer your thinking. Why did you choose this algorithm? What assumptions are you making? What edge cases did you handle? Comments should explain the why and the what-might-not-be-obvious, not the what.

---

## Phase 3: Integration and Judgment (Weeks 8-11)

The previous phase taught you verification skills in isolation—functional testing separate from security review, maintainability separate from semantic verification. Real development requires integrating all these skills into a coherent practice. You need to apply the right verification at the right depth efficiently, without following a rigid checklist. This phase builds that integration and develops the judgment to handle situations where no template applies.

### Week 8: Putting It Together

**The Goal:** Integrate all verification skills into a cohesive practice.

**The Problem You're Solving:** You've learned functional, semantic, security, and maintainability verification separately. Now you need to apply them together, efficiently.

**Daily Practice (60 minutes):**

Work through complete development tasks using full VID practice:

1. **Spec first.** Write intent specification before generating
2. **Assess risk.** Determine appropriate verification depth
3. **Generate.** Use AI to generate implementation
4. **Verify functionally.** Does it do what the spec says?
5. **Verify semantically.** Does it do what was intended?
6. **Verify security.** Is it safe against adversarial input?
7. **Verify maintainability.** Can it be understood and modified?
8. **Document decisions.** Record what you verified and why

**Exercise 8.1: End-to-End Practice**

Complete these tasks using full VID methodology:

*Task 1:* Build a function that validates and formats phone numbers
- Write complete spec
- Assess risk (this likely handles user input)
- Generate implementation
- Verify across all dimensions
- Document your verification

*Task 2:* Build a function that calculates compound interest
- Same process

*Task 3:* Build a function that parses and validates JSON configuration
- Same process

For each, time yourself. Where do you spend time? Where could you be more efficient?

**Exercise 8.2: The Prioritization Challenge**

You have 30 minutes to verify 5 functions. How do you allocate time?

1. A logging utility that formats timestamps
2. A function that authenticates API requests
3. A helper that capitalizes names
4. A function that processes payment amounts
5. A function that generates unique session IDs

Think about:
- Which need deep verification?
- Which can be verified quickly?
- What's your time allocation?

Practice making these decisions quickly. Risk calibration should become instinctive.

**Exercise 8.3: Verification Journal**

This week, for every verification you perform:
- What did you verify?
- What depth did you choose?
- Why?
- What did you find?

Review at end of week: Are your decisions consistent? Are they appropriate?

**End of Week Assessment:**

You should be able to:
- Apply full VID process end-to-end
- Allocate verification time based on risk
- Verify efficiently without cutting corners

**Common Mistakes This Week:**

Beginners often approach verification sequentially: first check functionality, then security, then maintainability, in rigid order. But you don't have to verify in strict sequence. Let risk guide where your attention goes. If security is the primary concern, start there. Let the nature of the code, not a fixed checklist, determine your approach.

Treating all code with uniform verification depth wastes time and creates blind spots. A simple utility function doesn't need the same intensive scrutiny as authentication logic. Calibrate your effort to the actual risk and complexity.

Documentation of verification decisions feels optional when you're focused on the code itself. But recording what you verified and why creates invaluable context. When something breaks later—or when you need to modify the code—those notes will save you hours. Future-you will thank present-you for taking two minutes to document your reasoning.

---

### Week 9: Building Speed Without Sacrificing Depth

**The Goal:** Become faster at verification without reducing quality.

**The Problem You're Solving:** Thorough verification takes time. But you're under time pressure. You need to be efficient—doing what matters, skipping what doesn't—without dropping important checks.

**Daily Practice (60 minutes):**

Focus on verification efficiency:

1. **Time your verifications.** How long does each type of check take?

2. **Identify shortcuts.** What checks can be done together? What patterns indicate you can skip something?

3. **Build checklists.** What do you always check? Make it automatic.

4. **Practice pattern recognition.** What patterns indicate problems? Learn to see them quickly.

**Exercise 9.1: Timed Verification**

Verify 5 functions with a strict time limit:
- 2 minutes each for low-risk code
- 5 minutes each for medium-risk code
- 15 minutes each for high-risk code

What can you accomplish in these times? What must you skip? What would you need to go back and check given more time?

**Exercise 9.2: Pattern Library**

Build a personal library of "things to watch for":
- Patterns that often indicate bugs
- Patterns that often indicate security issues
- Patterns that often indicate maintainability problems

Every time you find a bug, add the pattern to your library. Over time, you'll spot these patterns instantly.

**Exercise 9.3: Checklist Development**

Create verification checklists for common code types:

*For any function:*
- [ ] Understand what it does
- [ ] Check edge cases (empty, null, large)
- [ ] Verify against spec
- [ ] Check error handling

*For functions that handle user input:*
- [ ] Input validation
- [ ] Injection risk assessment
- [ ] Error message safety (no sensitive info)

*For functions that touch data storage:*
- [ ] Check for data loss scenarios
- [ ] Verify transactions/rollbacks
- [ ] Check concurrent access safety

Checklists make verification faster by removing decision overhead.

**End of Week Assessment:**

You should be able to:
- Complete appropriate verification within time constraints
- Identify which checks are essential vs. optional
- Recognize common problem patterns quickly

**Common Mistakes This Week:**

The pressure to move faster often leads to cutting verification corners. You time yourself and feel pressure to beat your previous time. But faster is only valuable if quality is maintained. Verification that misses critical issues because you rushed isn't verification—it's theater.

Checklists help create systematic habits, but rigid adherence to checklists can blind you. You might skip an important check because "it's not on my list," or conversely, waste time on checklist items that don't matter for the specific code you're reviewing. Checklists guide judgment; they don't replace it.

As you build speed, don't let efficiency silence your intuition. If something feels wrong, investigate, even if you can't immediately articulate why. That nagging feeling often comes from pattern recognition happening below conscious thought. Speed shouldn't override the instinct that something needs deeper attention.

---

### Week 10: Handling Complexity

**The Goal:** Learn to verify complex code that exceeds simple function analysis.

**The Problem You're Solving:** Real code isn't always simple functions. You'll face complex logic, interacting components, and systems that can't be verified by looking at one piece in isolation.

**Daily Practice (60 minutes):**

Work with increasingly complex code:

1. **Multi-function logic.** Verify code that spans multiple functions
2. **Stateful systems.** Verify code that maintains state
3. **Concurrent code.** Verify code that runs in parallel
4. **Integration points.** Verify code that interacts with external systems

**Exercise 10.1: Call Chain Analysis**

Take a function that calls other functions. Trace the full execution:
- What does each called function do?
- How do they compose?
- What assumptions does each make about the others?
- Where could the chain break?

**Exercise 10.2: State Machine Verification**

Take code that maintains state (e.g., a user session, a shopping cart, a workflow engine):
- What are the possible states?
- What transitions are allowed?
- What should never happen?
- Verify state transitions are correct
- Look for invalid state possibilities

**Exercise 10.3: Integration Point Analysis**

Take code that calls an external API or database:
- What happens if the external system is slow?
- What happens if it's unavailable?
- What happens if it returns unexpected data?
- What happens if it returns errors?

Verify that the code handles these scenarios appropriately.

**End of Week Assessment:**

You should be able to:
- Trace and verify multi-function logic
- Verify stateful code systematically
- Identify integration failure modes

**Common Mistakes This Week:**

Function-level tunnel vision is natural when you've spent weeks focused on individual functions. You verify each function carefully but miss how they interact. Complex systems often fail at the boundaries and interactions between components, not within well-tested individual functions. Step back and see the larger picture.

When verifying integration points with external systems, beginners focus on the happy path. They verify that the code correctly handles successful API responses but forget to consider what happens when the external system is slow, unavailable, returns malformed data, or throws errors. External systems fail constantly. Verify that your code handles failure gracefully.

Stateful code introduces subtle bugs that don't exist in pure functions. You might verify that each operation works individually but miss that certain sequences of operations produce invalid states. State machine thinking—explicitly considering what states are possible and what transitions are allowed—helps catch these subtle issues before they become production bugs.

---

### Week 11: Developing Judgment

**The Goal:** Develop verification judgment that handles novel situations.

**The Problem You're Solving:** You've learned practices for common situations. But you'll face novel situations where no checklist applies. You need judgment—the ability to figure out what to verify when there's no template.

**Daily Practice (60 minutes):**

Work with unfamiliar code and domains:

1. **Face novelty.** Work with code types you haven't seen before
2. **Derive approaches.** Figure out verification approaches from first principles
3. **Learn from outcomes.** Track what works and what doesn't
4. **Build intuition.** Develop gut feelings, then verify them

**Exercise 11.1: Unknown Domain**

Get AI to generate code in a domain you don't know (e.g., graph algorithms, cryptography, signal processing). You can't verify by domain knowledge. How do you approach it?

Options:
- Learn enough domain knowledge to verify
- Verify structural properties (no crashes, handles edges)
- Test against known correct implementations
- Consult domain experts

Explore each approach. What can you verify without domain knowledge? What requires expertise?

**Exercise 11.2: First Principles Verification**

For code in an unfamiliar pattern, ask:
- What could go wrong with this type of code?
- What would be really bad if it happened?
- How would I detect if it went wrong?
- What would give me confidence it's right?

Derive your verification approach from these questions.

**Exercise 11.3: Judgment Calibration**

For code you've verified, predict:
- How confident am I this is correct? (percentage)
- What's the most likely problem I missed?

Track outcomes. When problems occur, were they things you predicted? Is your confidence calibrated (i.e., code you're 90% confident about should be right 90% of the time)?

**End of Week Assessment:**

You should be able to:
- Approach unfamiliar code types systematically
- Derive verification strategies from first principles
- Calibrate confidence appropriately

**Common Mistakes This Week:**

When facing unfamiliar code, there's a strong temptation to default to familiar patterns. You've learned approaches that work for web applications, so you try to apply them to embedded systems code. Novel situations require novel approaches. Don't force familiar patterns onto unfamiliar domains.

Overconfidence in unfamiliar territory is surprisingly common. You've become skilled at verification, so you assume your judgment extends to domains you don't understand. But unknown domains contain unknown unknowns. Calibrate your confidence appropriately—be more tentative, seek more review, acknowledge the limits of your knowledge.

On the flip side, some engineers freeze when faced with unfamiliarity. Complete paralysis because "I don't know this domain" prevents any verification at all. Don't let unfamiliarity stop you entirely. Do what you can with the knowledge you have, acknowledge clearly what you can't verify, and know when to seek expert review.

---

## Phase 4: Mastery and Teaching (Week 12+)

After eleven weeks of deliberate practice, you've developed substantial verification skills. You can read code critically, specify intent precisely, calibrate verification to risk, and apply multiple verification techniques efficiently. But mastery isn't just personal skill—it's the ability to articulate what you know, teach others, and contribute to collective practice. This final phase consolidates your learning and begins your transition from student to teacher.

### Week 12: Consolidation and Sharing

**The Goal:** Consolidate your learning and begin sharing with others.

**The Problem You're Solving:** Mastery isn't just personal skill—it's being able to help others develop skill. Teaching reinforces learning and multiplies your impact.

**Activities This Week:**

1. **Review your journey.** Look back at your journals and notes. What did you learn? How did you change?

2. **Identify your patterns.** What verification approaches work best for you? What mistakes do you keep making?

3. **Teach someone else.** Explain VID to someone who doesn't know it. Teaching reveals what you don't understand.

4. **Contribute to team practices.** Propose improvements to how your team handles AI-generated code.

**Exercise 12.1: The Retrospective**

Write a personal retrospective:
- What verification skills improved most?
- What's still weak?
- What was most surprising?
- What would you tell past-you starting this journey?

**Exercise 12.2: Teaching Practice**

Teach a concept from this curriculum to someone else:
- Explain risk calibration
- Walk through a verification ritual
- Demonstrate security verification

Did you explain it clearly? Where did they get confused? What would you explain differently?

**Exercise 12.3: Process Proposal**

Write a proposal for your team:
- What VID practices would benefit the team?
- How would you introduce them?
- What resistance do you expect?
- How would you measure success?

**End of Week Assessment:**

You should be able to:
- Articulate your verification approach clearly
- Teach VID concepts to others
- Propose practical improvements to team practices

---

### Beyond Week 12: Continuous Development

This twelve-week curriculum builds foundational verification skills, but mastery is not a destination you reach and then stop. It's a continuous process of learning, calibrating, and adapting. The best engineers you'll work with—the ones whose code you trust, whose reviews catch issues others miss—didn't stop developing their skills after some arbitrary point. They kept learning, deliberately and systematically, throughout their careers.

**Ongoing Practices:**

- **Keep learning patterns.** Every bug you find teaches you a pattern. Build your library.

- **Keep calibrating.** Track outcomes. Adjust practices based on reality.

- **Keep teaching.** Explaining to others deepens your own understanding.

- **Keep adapting.** AI capabilities change. Verification needs change with them.

**Signs of Growing Mastery:**

- Verification becomes faster without losing depth
- You spot problems others miss
- Your confidence calibration improves (your predictions match outcomes)
- Others seek your review
- You can explain why, not just what

**Signs You Need More Work:**

If problems consistently escape your review and reach production, your verification has gaps. Track what you're missing and adjust your approach.

If you can't explain why you check what you check—you just follow steps mechanically—you haven't internalized the principles. Understanding the why behind verification practices is essential for judgment.

If verification feels like checklist compliance rather than genuine understanding, you're going through motions without engaging. Real verification requires active thinking, not mechanical box-checking.

If you struggle with novel situations and can't figure out what to verify when there's no template, you need more practice deriving approaches from first principles.

These signs don't mean you're failing—they mean you know where to focus your continued development. Every senior engineer still has areas where they need work. The difference is they recognize those gaps and address them deliberately.

---

**A Final Word**

You're learning to code at a pivotal moment. AI can generate more code in an hour than a human could write in a week. This reality creates a choice: become someone who prompts AI without understanding what it produces, or become someone who can verify AI-generated code with skill and judgment.

The path presented in this curriculum is harder. It requires deliberate practice, intellectual honesty, and sustained effort. But it builds something AI cannot replace: the judgment to know what matters, the skill to verify what's generated, and the understanding to maintain and evolve code over time.

The engineers who thrive in this new era won't be those who generate the most code. They'll be those who can confidently verify that code is correct, secure, and maintainable—and who can teach others to do the same. That's the path this curriculum offers. The work is yours to do.

---
