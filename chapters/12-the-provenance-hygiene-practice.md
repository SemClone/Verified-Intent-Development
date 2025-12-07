## Chapter 12: The Provenance Hygiene Practice

### The Practice

Maintain awareness and documentation of where code comes from.

### Commit Hygiene

When committing AI-generated or AI-assisted code:

**Indicate AI involvement.** Your commit message or description should indicate that AI assisted in generating this code.

**Note the verification level.** Briefly indicate how this code was verified.

**Document significant AI interactions.** For complex generations, keep the prompt/response history.

### Code Comments

For non-trivial AI-generated code:

**Document the intent.** What was this code meant to do?

**Note limitations.** What does the AI-generated version not handle that a more complete implementation might?

**Mark uncertainty.** If you're uncertain about parts of the code, note that for future maintainers.

### Team Awareness

Teams should have shared awareness:

**Which areas are heavily AI-generated?** This affects modification planning and risk assessment.

**What AI tools were used?** Different tools have different characteristics.

**What verification standards were applied?** This affects confidence in different areas of the codebase.

### The Anti-Pattern: Invisible AI

When AI-generated code is indistinguishable from human-written code:

- Future maintainers don't know to be cautious
- Problems are harder to diagnose
- Risk assessment is wrong because provenance is unknown

Make provenance visible.

---

