## Chapter 10: The Verification Ritual Practice

### The Practice

After every code generation, perform a verification ritual. The depth varies by risk, but the practice is consistent.

### The Basic Ritual (High Trust)

For low-risk code:

1. **Read the code.** Actually read it, don't skim.
2. **Verify against intent.** Does this do what you specified?
3. **Run automated checks.** Linting, type checking, tests.
4. **Ask: "What could go wrong?"** Spend 30 seconds considering failure modes.

This takes 2-5 minutes. It's the minimum for any code.

### The Standard Ritual (Moderate Trust)

For typical production code:

1. **Complete the basic ritual.**
2. **Trace the logic.** Walk through the code path mentally.
3. **Test edge cases.** Run specific tests for boundary conditions.
4. **Check integration.** How does this interact with existing code?
5. **Document understanding.** Write a brief note on what this code does.

This takes 5-15 minutes depending on code complexity.

### The Deep Ritual (Guarded Trust)

For important code:

1. **Complete the standard ritual.**
2. **Adversarial thinking.** Try to break the code. What inputs could cause problems?
3. **Security review.** Are there injection risks? Access control issues? Data exposure?
4. **Performance consideration.** What happens at scale? Are there expensive operations?
5. **Maintainability review.** Can someone else understand this? Should it be refactored for clarity?

This takes 15-30 minutes.

### The Intensive Ritual (Minimal Trust)

For high-risk code:

1. **Complete the deep ritual.**
2. **Independent review.** Have another person review independently.
3. **Formal verification.** Apply relevant security tools, static analysis, etc.
4. **Documentation.** Document the code's behavior, limitations, and security considerations.
5. **Provenance documentation.** Record how this code was generated and verified.

This takes 30+ minutes and involves multiple people.

### Making It a Ritual

The value of a ritual is consistency. It shouldn't require decision-making about whether to do it. After every generation:

"What's the risk level? Apply that verification ritual."

Make it automatic.

---

