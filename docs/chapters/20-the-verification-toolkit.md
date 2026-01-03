## Chapter 20: The Verification Toolkit

### What This Chapter Is

The previous chapter showed patterns in context. This chapter goes deeper into verification techniques—what to actually check and how.

This is not a checklist to follow mindlessly. It's a toolkit to draw from intelligently. Different code needs different verification. Your job is to select the right tools for the situation.

---

### Part 1: Functional Verification

Functional verification answers: "Does this code do what it's supposed to do?"

#### Technique 1: Input Space Partitioning

The input space is everything a function could receive. Testing everything is impossible. Partitioning makes it tractable.

**The Approach:**

Divide inputs into categories that should behave the same way. Test at least one representative from each category.

**How to Partition:**

For numeric inputs:
- Negative numbers
- Zero
- Positive numbers
- Very large numbers (near overflow)
- Very small numbers (precision issues)
- Special values (NaN, Infinity if applicable)

For string inputs:
- Empty string
- Single character
- Typical string
- Very long string
- Unicode characters
- Special characters (quotes, backslashes, newlines)
- Null (if the language allows)

For collections:
- Empty collection
- Single element
- Multiple elements
- Very large collection
- Collection with duplicates
- Collection with special values (nulls, etc.)

For dates:
- Normal date
- Leap year date (Feb 29)
- Month boundaries
- Year boundaries
- Time zone edge cases
- DST transitions

**Example:**

For a function `get_element_at_index(list, index)`:

List partitions:
- Empty list → should handle gracefully
- Single-element list → index 0 valid, others invalid
- Multi-element list → various valid and invalid indices

Index partitions:
- Negative index → might be valid (Python) or invalid
- Zero → valid if list non-empty
- Middle valid index → normal case
- Last valid index → boundary
- One past end → invalid
- Very large → invalid

Combined test cases:
1. Empty list, index 0 → error handling
2. Single element, index 0 → returns element
3. Single element, index 1 → error handling
4. Multi-element, index 0 → returns first
5. Multi-element, middle index → returns middle
6. Multi-element, last index → returns last
7. Multi-element, past end → error handling
8. Multi-element, negative → depends on language semantics

#### Technique 2: Boundary Value Analysis

Bugs cluster at boundaries. If something works for 5 and 100, it probably works for 50. But it might fail for 0, 1, or the maximum.

**The Approach:**

For every boundary, test:
- The boundary value itself
- Just below the boundary (boundary - 1)
- Just above the boundary (boundary + 1)

**Common Boundaries:**

- Array indices: 0, length-1, length
- Numeric ranges: min, max
- String lengths: 0, 1, max
- Date ranges: start of range, end of range
- Pagination: first page, last page

**Example:**

For a function `is_valid_percentage(value)` that should accept 0-100:

Boundaries: 0 and 100

Test cases:
- -1 → should be invalid
- 0 → should be valid
- 1 → should be valid
- 99 → should be valid
- 100 → should be valid
- 101 → should be invalid

Also consider:
- What about 50.5? Are decimals valid?
- What about null/undefined?

#### Technique 3: State Transition Testing

For code with state, verify that state transitions are correct.

**The Approach:**

1. Identify all possible states
2. Identify all events that cause transitions
3. Map which transitions are valid
4. Test that valid transitions work
5. Test that invalid transitions are rejected

**Example:**

For an order state machine:

States: Created, Paid, Shipped, Delivered, Cancelled, Refunded

Valid transitions:
- Created → Paid (payment received)
- Created → Cancelled (user cancels)
- Paid → Shipped (fulfillment ships)
- Paid → Refunded (refund before ship)
- Shipped → Delivered (delivery confirmed)
- Shipped → Refunded (refund after ship)

Invalid transitions:
- Delivered → Cancelled (can't cancel delivered order)
- Cancelled → anything (cancelled is terminal)
- Shipped → Paid (can't go backward)

Test each valid transition. Test key invalid transitions to ensure they're rejected.

#### Technique 4: Property-Based Reasoning

Instead of specific test cases, verify properties that should always hold.

**The Approach:**

Identify invariants—things that should always be true—and verify them.

**Common Properties:**

- **Round-trip:** encode then decode should return original
- **Idempotency:** doing something twice should be same as once (when applicable)
- **Symmetry:** reverse(reverse(x)) should equal x
- **Ordering:** sort(x) should be ordered
- **Size preservation:** map over a list should preserve length
- **Bounds:** output should be within expected range

**Example:**

For a serialization function:

Property: For all valid inputs, `deserialize(serialize(input)) == input`

For a sort function:

Properties:
- Output length equals input length
- Every element in input exists in output (same count)
- Output is ordered (each element ≤ next element)

For an idempotent API endpoint:

Property: `POST /resource` twice with same data should have same result as once

---

### Part 2: Security Verification

Security verification answers: "Can this code be exploited?"

#### Technique 1: Input Vector Enumeration

**The Approach:**

List every input to the code. For each, ask: "What if this came from an attacker?"

**Input Vectors Include:**

- URL parameters
- Form fields
- HTTP headers
- Cookies
- File uploads
- Database contents (might be poisoned)
- Environment variables (in some contexts)
- File system contents
- Data from external APIs

**For Each Input:**

- What's the expected format?
- What happens with unexpected format?
- Can special characters cause problems?
- Can excessive length cause problems?
- Can the input influence SQL, commands, HTML, or other interpreted contexts?

**Example:**

For a user profile update endpoint:

Inputs:
- Username (from form)
- Email (from form)
- Bio (from form)
- Profile picture (file upload)
- Session token (cookie)
- User ID (might be in URL or derived from session)

For each:
- Username: Could contain script tags (XSS if displayed), SQL injection characters, or path traversal characters
- Email: Could be malformed, excessively long, contain injection characters
- Bio: Prime XSS target, could contain huge content (DoS)
- Profile picture: Could be disguised executable, excessively large, specially crafted to exploit image processors
- Session token: Could be forged, stolen, expired
- User ID: Could be manipulated to update someone else's profile

#### Technique 2: Injection Point Analysis

**The Approach:**

Find every place where input data is combined with commands, queries, or markup. These are injection points.

**Common Injection Contexts:**

SQL:
```python
# DANGEROUS
query = f"SELECT * FROM users WHERE name = '{user_input}'"

# Input: "'; DROP TABLE users; --"
# Result: SQL injection
```

Shell commands:
```python
# DANGEROUS
os.system(f"convert {user_filename} output.png")

# Input: "file.jpg; rm -rf /"
# Result: Command injection
```

HTML:
```python
# DANGEROUS
html = f"<div>Welcome, {username}</div>"

# Input: "<script>steal_cookies()</script>"
# Result: XSS
```

File paths:
```python
# DANGEROUS
path = f"/app/data/{user_filename}"

# Input: "../../../etc/passwd"
# Result: Path traversal
```

**Verification Questions:**

- Is user input ever concatenated into SQL? → Use parameterized queries
- Is user input ever passed to shell? → Avoid if possible; whitelist if necessary
- Is user input ever rendered as HTML? → Escape output
- Is user input ever used in file paths? → Validate against whitelist

#### Technique 3: Authentication and Authorization Audit

**The Approach:**

For every action the code enables, verify:
1. Does it require authentication? Should it?
2. Does it verify authorization? Should it?
3. Can authentication be bypassed?
4. Can authorization be bypassed?

**Common Vulnerabilities:**

**Broken authentication:**
- Weak password requirements
- No brute force protection
- Predictable session tokens
- Session doesn't expire
- Password in URL (logged)

**Broken authorization:**
- Checking if user is logged in, but not if they own the resource
- Client-side authorization checks only
- Assuming sequential IDs can't be guessed
- Not re-checking permissions on sensitive actions

**Verification Questions:**

- What proves this user is who they claim?
- What proves this user can perform this action on this resource?
- Where are these checks? Are they before the action?
- Can they be bypassed by modifying the request?

**Example:**

For an endpoint `DELETE /api/documents/{id}`:

Questions:
- Does it require authentication? (Should: yes)
- Does it verify the user owns document {id}? (Should: yes)
- What if I'm logged in as User A and request delete of User B's document?
- What if the ID is guessed or enumerated?

#### Technique 4: Data Exposure Analysis

**The Approach:**

Trace every piece of sensitive data through the code. Where does it go? Could it leak?

**Sensitive Data Includes:**

- Passwords (should never be visible)
- API keys and secrets
- Personal information (PII)
- Financial information
- Session tokens
- Internal system information

**Exposure Points:**

- Log files (are sensitive values logged?)
- Error messages (do they reveal internal information?)
- API responses (is too much data returned?)
- URLs (sensitive data in query strings is logged)
- Client-side storage (localStorage is readable by scripts)
- Source code (hardcoded secrets?)

**Verification Questions:**

- Is this sensitive data logged anywhere?
- Does any error message reveal this data?
- Is this data sent to the client when it shouldn't be?
- Is this data stored securely at rest?
- Is this data transmitted securely in transit?

**Example:**

For a login function:

Sensitive data: password, session token

Trace:
- Password received → is it ever logged? (Should: no)
- Password compared → is the comparison constant-time? (Prevents timing attacks)
- Password stored → is it hashed properly? (bcrypt, argon2, not MD5/SHA1)
- Session token generated → is it cryptographically random? (Should: yes)
- Session token stored → is it accessible to JavaScript? (httpOnly flag)
- Session token transmitted → is it HTTPS only? (secure flag)

---

### Part 3: Maintainability Verification

Maintainability verification answers: "Can this code be understood and safely modified in the future?"

#### Technique 1: The Stranger Test

**The Approach:**

Pretend you've never seen the code. Time how long it takes to understand:
1. What does this code do? (purpose)
2. How does it do it? (mechanism)
3. Why does it do it this way? (rationale)

**Interpretation:**

- < 5 minutes for simple code: Good
- 5-15 minutes: Acceptable for complex logic
- 15+ minutes for code that should be simple: Problem

**What Makes Understanding Hard:**

- Poor naming (what is `x`? what is `process`?)
- Long functions (> 30 lines needs scrutiny, > 100 lines is a problem)
- Deep nesting (more than 3 levels needs refactoring)
- Magic values (what is 86400? what is 0.035?)
- Missing context (why is this special case here?)
- Clever tricks (clever code is hard to debug)

#### Technique 2: Change Impact Assessment

**The Approach:**

Consider likely future changes. How hard would they be?

**Common Changes:**

- Adding a new case/variant to existing logic
- Changing a business rule or threshold
- Integrating with a new external system
- Adding logging or monitoring
- Fixing a bug in one scenario without breaking others

**For Each Change:**

- What code would need to be modified?
- What else might be affected?
- How confident are you that you could make the change without breaking something?

**Red Flags:**

- "I'd need to change this in many places" → duplication problem
- "I'm not sure what else this would affect" → coupling problem
- "I'd need to understand all of this to change any of it" → cohesion problem
- "I'd be afraid to touch this" → clarity problem

#### Technique 3: Naming Audit

**The Approach:**

Read just the names—function names, variable names, parameter names. Do they tell a story?

**Good Names:**

- Functions: verbs that describe what they do (`calculate_shipping_cost`, `validate_email`, `send_notification`)
- Variables: nouns that describe what they hold (`user_email`, `total_price`, `is_active`)
- Booleans: questions that make sense in conditions (`is_valid`, `has_permission`, `should_retry`)
- Constants: describe what the value means (`MAX_RETRY_COUNT`, `SECONDS_PER_DAY`)

**Bad Names:**

- Single letters (except loop counters): `x`, `d`, `t`
- Generic names: `data`, `temp`, `result`, `value`, `item`
- Misleading names: `list` that's actually a dictionary, `count` that's actually a sum
- Abbreviated names: `usr`, `pwd`, `cfg` (use `user`, `password`, `config`)

**Verification:**

For each name, can you understand its purpose without reading the implementation?

#### Technique 4: Complexity Assessment

**The Approach:**

Identify complexity and decide if it's justified.

**Complexity Indicators:**

- **Cyclomatic complexity:** Number of decision points (if, while, for, case). Higher = more complex. Over 10 warrants scrutiny.
- **Nesting depth:** How deep do control structures nest? More than 3 levels is hard to follow.
- **Function length:** Longer functions are harder to understand. Over 30 lines warrants scrutiny.
- **Parameter count:** Functions with many parameters are hard to use correctly. Over 4 parameters warrants scrutiny.
- **Dependencies:** How many other modules does this code depend on? More dependencies = more fragile.

**Complexity Isn't Always Bad:**

Some problems are inherently complex. The question is whether the code's complexity matches the problem's complexity.

- Simple problem, complex code → refactor
- Complex problem, complex code → acceptable but document
- Complex problem, simple code → ideal (if it's actually correct)

---

### Part 4: Provenance Verification

Provenance verification answers: "Where did this code come from, and what does that imply?"

#### Technique 1: Origin Documentation

**The Approach:**

For every significant piece of code, document:
- Who/what created it (human, AI, copied from somewhere)
- When it was created
- What verification it received

**For AI-Generated Code:**

- Which model/tool generated it
- What prompt produced it (summary if long)
- What verification was performed after generation
- Who verified it

**Why It Matters:**

- AI-generated code might have training data issues
- Code that was lightly reviewed is higher risk for modification
- Knowing origin helps assess appropriate trust level

#### Technique 2: License Compatibility Check

**The Approach:**

Verify that code origins are compatible with your project's licensing.

**Check:**

- If code was copied from external sources, what's the license?
- If AI-generated, what are the terms of service? Any IP concerns?
- Are all dependencies' licenses compatible with your project?

**Common Issues:**

- Copying GPL code into proprietary project
- Using code from Stack Overflow without attribution
- AI generating code that closely matches training data (potential copyright issue)

#### Technique 3: Pattern Origin Tracking

**The Approach:**

When you see a pattern repeated, trace its origin.

**Questions:**

- Where did this pattern start?
- Who introduced it?
- Was it verified when introduced?
- Has it been modified since?

**Why It Matters:**

- A bad pattern spreads through copy-paste
- Fixing the pattern requires finding all copies
- Understanding origin helps assess risk

---

### Using the Toolkit

These techniques form a toolkit, not a checklist. Selection depends on context.

**High Trust (Low Risk):**
- Quick functional verification (key test cases)
- Naming audit (basic clarity)
- Skip intensive security analysis

**Moderate Trust (Typical Risk):**
- Systematic functional verification (input partitioning, boundary analysis)
- Basic security review (input vectors, obvious injection points)
- Maintainability review (stranger test, naming audit)
- Provenance documentation

**Guarded Trust (Important Risk):**
    - Comprehensive functional verification (all techniques)
    - Intensive security review (all techniques)
    - Full maintainability assessment (all techniques)
    - Formal provenance documentation
    - Multiple reviewers

**Minimal Trust (Intensive Verification):**
    - Everything in Guarded Trust
    - Dedicated security review or threat modeling session
    - Formal provenance documentation with reviewer sign-off
    - Incident response considerations

**The skill is matching technique to need.** Over time, you develop intuition for what each situation requires. The techniques become second nature—you apply them without consciously thinking through lists.

That's mastery: not following a checklist, but having internalized the toolkit so deeply that you automatically apply what's needed.

---
