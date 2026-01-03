## Chapter 4: Principle One — Intent Before Generation

### The Principle

**Never generate code without first articulating what you intend to build and how you will verify correctness.**

This principle seems simple but violates common practice. Most developers using AI start with a vague idea, prompt the AI, look at the result, and decide if it seems right. This is backwards.

### Why Intent First?

Without explicit intent, you cannot verify. You can only react. You look at generated code and ask "does this seem okay?" rather than "does this match what I needed?"

The difference is profound:

**Reactive verification:** "This function seems to do something with dates. It looks reasonable. I'll accept it."

**Intent-driven verification:** "I needed a function that calculates business days between two dates, excluding weekends and holidays from a provided list. Let me check if this implementation handles holidays, excludes weekends, and correctly counts the days without double-counting boundaries."

Reactive verification catches obvious errors. Intent-driven verification catches subtle ones — the ones that matter in production.

### Articulating Intent

Intent should include:

**Functional intent:** What should this code do? What are the inputs, outputs, and transformation?

**Quality intent:** What are the performance requirements? Reliability requirements? What trade-offs are acceptable?

**Boundary intent:** What inputs are valid? What should happen with invalid inputs? What are the edge cases?

**Integration intent:** How does this interact with existing code? What contracts must it honor?

You don't need a formal document for every function. But you should be able to articulate these before generating code. If you can't, you're not ready to generate.

### The Verification Criteria

Intent leads to verification criteria. Before generating, ask:

"How will I verify this is correct?"

If you can't answer, you can't verify. And if you can't verify, you shouldn't generate.

Verification criteria might be:
- Specific test cases with expected outputs
- Properties that must hold (e.g., "output is always sorted")
- Security requirements (e.g., "rejects SQL injection attempts")
- Performance requirements (e.g., "responds in under 100ms for 1000 items")

Write these down, even informally. They guide your verification after generation.

### Practice: The Intent Moment

Before every generation, pause for an "intent moment." Ask yourself:

1. What exactly should this code do?
2. What are the edge cases?
3. How will I verify it's correct?

This pause takes seconds. It saves hours of debugging wrong code.

---

