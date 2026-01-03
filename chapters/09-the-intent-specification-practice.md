## Chapter 9: The Intent Specification Practice

### From Principle to Practice

Principle One (Intent Before Generation) requires practical implementation. The intent specification practice provides it.

### The Practice

Before generating code:

1. **Articulate the functional requirement.** What should this code do? Be specific about inputs, outputs, and transformation.

2. **Identify boundaries.** What inputs are valid? What should happen at boundaries? What should happen with invalid inputs?

3. **State success criteria.** How will you know this code is correct? What tests or checks will verify it?

4. **Assess risk.** What's the impact if this is wrong? This determines verification depth.

### Intent Specification Formats

Intent specification can range from informal to formal:

**Mental intent (lowest formality):**
For trivial code, a clear thought is sufficient: "I need a function that capitalizes the first letter of each word."

**Comment intent:**
Write a comment describing the intent before generating:
```
// Function: Capitalize first letter of each word
// Input: String of words separated by spaces
// Output: Same string with each word capitalized
// Edge cases: Empty string returns empty, handles multiple spaces
```

**Test-first intent:**
Write the tests before generating the implementation:
```python
def test_capitalizes_words():
    assert capitalize_words("hello world") == "Hello World"
    
def test_handles_empty():
    assert capitalize_words("") == ""
    
def test_handles_single_word():
    assert capitalize_words("hello") == "Hello"
```

**Formal specification:**
For complex or high-risk code, use structured specification documents. Here's a template:

```markdown
## Intent Specification: [Feature/Function Name]

**Author:** [Your name]
**Date:** [Date]
**Risk Level:** [High Trust / Moderate / Guarded / Minimal]
**Risk Score:** [0-47] (See Appendix D)

### Purpose
[1-2 sentences: What problem does this code solve?]

### Functional Requirements
1. [Specific requirement with measurable outcome]
2. [Specific requirement with measurable outcome]
3. [...]

### Input Specification
- **Valid inputs:** [Types, ranges, formats]
- **Invalid inputs:** [What should be rejected and how]
- **Edge cases:** [Boundary values, empty inputs, maximum sizes]

### Output Specification
- **Success case:** [What the code returns/produces on success]
- **Error cases:** [What happens for each error condition]
- **Side effects:** [Database changes, API calls, file writes, etc.]

### Non-Functional Requirements
- **Performance:** [Response time, throughput requirements]
- **Security:** [Authentication, authorization, data protection]
- **Compliance:** [GDPR, HIPAA, SOX, etc.]
- **Scalability:** [Expected load, growth projections]

### Success Criteria
**The code is correct if:**
1. [Testable criterion]
2. [Testable criterion]
3. [...]

### Verification Plan
**Based on risk level [X], I will:**
- [ ] [Verification step matching trust level]
- [ ] [Verification step matching trust level]
- [ ] [Peer review required? Yes/No]
- [ ] [Security review required? Yes/No]

### Dependencies & Integration
- **Depends on:** [Other systems, services, libraries]
- **Used by:** [Callers, consumers]
- **Breaking changes:** [Any backwards compatibility concerns]

### Assumptions & Constraints
- [Assumption 1]
- [Constraint 1]
```

**Example - Formal Specification:**

```markdown
## Intent Specification: User Authentication Middleware

**Author:** Sarah Chen
**Date:** 2025-01-02
**Risk Level:** Guarded Trust
**Risk Score:** 26 (Impact: 5, Reversibility: 3, Exposure: 4, Compliance: 2)

### Purpose
Authenticate incoming HTTP requests using JWT tokens, attach user context to request object, and reject unauthenticated requests before they reach protected routes.

### Functional Requirements
1. Extract JWT token from Authorization header (Bearer scheme)
2. Validate token signature using RS256 algorithm
3. Verify token has not expired (exp claim)
4. Extract user ID from token payload (sub claim)
5. Attach validated user object to request.user
6. Return 401 Unauthorized for invalid/missing tokens
7. Return 403 Forbidden for expired tokens

### Input Specification
- **Valid inputs:**
  - Authorization: Bearer [valid-jwt-token]
  - Token format: Header.Payload.Signature (RS256)
  - Token payload must include: sub (user ID), exp (expiration), iat (issued at)
- **Invalid inputs:**
  - Missing Authorization header → 401
  - Malformed token → 401
  - Invalid signature → 401
  - Expired token → 403
  - Token from revoked user → 403
- **Edge cases:**
  - Token expires during request processing
  - Clock skew between auth server and app server (allow 60s tolerance)
  - Very long tokens (>8KB should be rejected)

### Output Specification
- **Success case:**
  - request.user = {id, email, roles, permissions}
  - next() called to continue request
- **Error cases:**
  - 401: {error: "invalid_token", message: "..."}
  - 403: {error: "token_expired", message: "...", expired_at: timestamp}
- **Side effects:**
  - Log authentication attempts (successful and failed)
  - Increment Prometheus counter for auth_attempts_total{status="success|failure"}

### Non-Functional Requirements
- **Performance:** <10ms p99 latency (token validation is synchronous)
- **Security:**
  - Must use constant-time comparison for signatures (prevent timing attacks)
  - Must validate ALL required claims before granting access
  - Must not log tokens or sensitive user data
  - Public key must be loaded from secure key vault, not hardcoded
- **Compliance:**
  - PCI DSS (for payment routes): Must log all access attempts
- **Scalability:**
  - Stateless (no session storage)
  - Must handle 10,000 req/sec per instance

### Success Criteria
**The code is correct if:**
1. Valid tokens grant access and attach correct user context
2. Invalid tokens are rejected with appropriate status codes
3. Expired tokens return 403, not 401
4. Token signature validation uses constant-time comparison
5. No tokens or sensitive data appear in logs
6. Performance meets <10ms p99 requirement under load
7. All error cases return helpful messages without leaking security details

### Verification Plan
**Based on risk level Guarded Trust, I will:**
- [ ] Line-by-line code review of authentication logic
- [ ] Test all success and error paths with unit tests
- [ ] Security review: Check for timing attacks, token leakage in logs
- [ ] Integration test with real JWT tokens (valid, expired, malformed)
- [ ] Load test to verify <10ms p99 under 10k req/sec
- [ ] Peer review by security-focused senior engineer
- [ ] Code review checklist from Appendix F

### Dependencies & Integration
- **Depends on:**
  - jsonwebtoken library (v9.0.0+)
  - Key vault service for public key retrieval
  - User service for checking revoked users
- **Used by:**
  - All protected API routes (/api/*)
  - Must be registered before route handlers
- **Breaking changes:**
  - Changing token format will break all mobile clients
  - Must version any changes to claims structure

### Assumptions & Constraints
- Tokens are signed by trusted auth service using RS256
- Public key rotates monthly but old keys remain valid for 7 days
- Maximum of 3 concurrent sessions per user
- Token lifetime is 1 hour (non-configurable)
```

### Matching Formality to Risk

- Trivial code: Mental intent is sufficient
- Typical code: Comment intent or test-first intent
- Important code: Test-first intent with edge cases
- Critical code: Formal specification with comprehensive test cases

### Anti-Pattern: Retroactive Intent

Writing intent after generation defeats the purpose. If you generate first, you'll rationalize that the output matches your intent rather than critically evaluating it.

The discipline is: intent first, always.

---

