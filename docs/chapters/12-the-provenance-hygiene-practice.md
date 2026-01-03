## Chapter 12: The Provenance Hygiene Practice

### The Practice

Maintain awareness and documentation of where code comes from.

### The Scaling Challenge

A common objection to provenance tracking: "This sounds good in theory, but marking code as AI-generated in commits and documentation becomes chaotic once the codebase reaches a certain size."

This is a valid concern. Manual discipline doesn't scale. But provenance tracking doesn't have to be purely manual.

The key insight: **provenance tracking should evolve with your team and codebase size**.

### Provenance Tracking: Maturity Levels

Different teams need different approaches:

#### Level 1: Manual Commit Messages
**Good for:** Teams < 5 people, codebases < 10,000 LOC

Simple commit message conventions:
```
feat: add OAuth login (AI-generated, verified)
fix: handle edge case in parser (human-written)
```

This works when:
- Team discipline is high
- Code review is thorough
- The codebase is small enough to remember what's what

**Limitations:** Breaks down with team growth, easy to forget, hard to audit.

#### Level 2: Structured Metadata
**Good for:** Teams 5-20 people, codebases 10,000-100,000 LOC

When manual tracking becomes error-prone, add structure:

**Git commit templates** that prompt for provenance
**Code comment conventions** that are greppable
**Periodic manual audits** to verify metadata accuracy

Example structured approach:
```typescript
// @provenance ai-generated
// @tool gpt-4
// @verification deep
// @reviewer alice@example.com
// Human intent: Implement token refresh with exponential backoff
// Known limitations: Doesn't handle network partitions > 30s
export async function refreshToken(token: string) {
  // ...
}
```

This works when:
- You need programmatic queries ("show me all AI-generated code with light verification")
- Multiple people touch the same code
- Incident investigation requires provenance data

**Limitations:** Requires consistent adoption, metadata can drift from reality over time.

#### Level 3: Automated Tracking
**Good for:** Teams 20+ people, codebases 100,000+ LOC

When you need programmatic enforcement:

**Git hooks** that prompt for provenance before commit
**Metadata files** maintained automatically by tooling
**Continuous audit scripts** that run in CI
**Provenance dashboards** for team visibility

This works when:
- Manual processes have failed
- Compliance or legal requires audit trails
- The codebase is too large for manual tracking

**Limitations:** Requires tooling investment, can be seen as process overhead.

### Principles for Scalable Provenance Tracking

Regardless of maturity level, effective provenance tracking follows these principles:

#### Make It Hard to Forget

Don't rely on memory. Use automation:

- **Git hooks** that ask "Was this AI-generated?" before allowing commits
- **PR templates** with provenance checklist sections
- **CI checks** that warn when provenance markers are missing
- **Editor snippets** that make adding provenance metadata trivial

The goal: forgetting to document provenance should feel like friction.

#### Make It Easy to Query

Structure metadata for programmatic access:

- **Use consistent, greppable markers** in code comments
- **Maintain a single source of truth** (e.g., `.provenance.yml` or similar)
- **Provide scripts** to answer questions like:
  - "Which files are AI-generated with minimal verification?"
  - "What percentage of our codebase is AI-generated?"
  - "Which modules have unknown provenance?"

If you can't query it, you can't audit it.

#### Make It Maintainable

Automation should help, not burden:

- **Automation updates metadata**, not humans editing files manually
- **Provenance should degrade gracefully** (missing metadata = "unknown", not broken builds)
- **Periodic audits should be scheduled**, not ad-hoc fire drills
- **Keep it simple** - complex systems that nobody understands won't be maintained

#### Make It Culturally Normal

The hardest part isn't technical:

- **Lead by example** - senior engineers document provenance visibly
- **Make it part of code review** - reviewers ask "What's the provenance?" if unclear
- **Share provenance in incident reviews** - "This bug was in AI-generated code that had light verification"
- **Don't use it punitively** - provenance is for learning and risk management, not blame

### Commit Hygiene

When committing AI-generated or AI-assisted code:

**Indicate AI involvement.** Your commit message or description should indicate that AI assisted in generating this code.

**Note the verification level.** Briefly indicate how this code was verified.

**Document significant AI interactions.** For complex generations, keep the prompt/response history.

**Example commit message:**
```
feat: implement JWT token refresh logic

Added automatic token refresh with exponential backoff retry.

Provenance:
- AI-generated initial implementation
- Human verification: deep (tested edge cases, reviewed algorithm)
- Tool: GPT-4 via Copilot
- Files: src/auth/token-refresh.ts, src/auth/token-refresh.test.ts
```

### Code Comments

For non-trivial AI-generated code:

**Document the intent.** What was this code meant to do?

**Note limitations.** What does the AI-generated version not handle that a more complete implementation might?

**Mark uncertainty.** If you're uncertain about parts of the code, note that for future maintainers.

**Use greppable markers.** Structured comments enable programmatic auditing:

```python
# @provenance ai-generated
# @verification standard
# Human intent: Parse ISO 8601 dates with timezone support
# Known limitations: Doesn't handle leap seconds
def parse_datetime(date_string: str) -> datetime:
    # ...
```

### Team Awareness

Teams should have shared awareness:

**Which areas are heavily AI-generated?** This affects modification planning and risk assessment.

**What AI tools were used?** Different tools have different characteristics.

**What verification standards were applied?** This affects confidence in different areas of the codebase.

**How to maintain awareness:**

- Regular team syncs that review provenance metrics
- Documentation that highlights AI-heavy modules
- Onboarding materials that explain provenance conventions
- Dashboards or reports showing provenance distribution

### Practical Implementation

The `templates/` directory in this repository contains ready-to-use tools:

**Git templates:**
- `git-commit-template.txt` - Commit message template with provenance prompts
- `git-hooks/prepare-commit-msg` - Hook that adds provenance section to commits
- `git-hooks/post-commit` - Hook for automated metadata tracking

**Code templates:**
- `provenance-markers.code-snippets` - VS Code snippets for quick provenance comments

**Audit tools:**
- `scripts/audit-provenance.sh` - Generate provenance reports from your codebase
- `scripts/check-verification.sh` - Find high-risk AI-generated code

**PR templates:**
- `pr-template.md` - Pull request template with provenance checklist

See the templates directory for implementation details and usage instructions.

### The Anti-Pattern: Invisible AI

When AI-generated code is indistinguishable from human-written code:

- Future maintainers don't know to be cautious
- Problems are harder to diagnose
- Risk assessment is wrong because provenance is unknown

Make provenance visible.

### The Anti-Pattern: Overly Complex Metadata

The opposite extreme is also problematic:

Complex JSON schemas that require manual editing:
```json
// DON'T DO THIS - too complex, won't be maintained
{
  "files": {
    "src/feature.ts": {
      "provenance": "ai-generated",
      "tool": "gpt-4",
      "model_version": "gpt-4-0613",
      "temperature": 0.7,
      "prompt_hash": "sha256:abc123...",
      "verification": {
        "level": "deep",
        "reviewer": "alice@example.com",
        "date": "2024-01-15T10:30:00Z",
        "tests_added": true,
        "edge_cases_verified": ["null", "empty", "overflow"]
      }
    }
  }
}
```

This fails because:
- Too much overhead to maintain
- Requires tools that may not exist
- Breaks when forgotten or outdated
- Creates false confidence ("we have metadata!") when it's actually stale

**Instead:** Keep it simple. A greppable comment is better than an unmaintained JSON file.

### Starting Point

If you're introducing provenance tracking to an existing team:

**Week 1:** Add a commit message template with provenance prompt. Make it optional.

**Week 2-4:** Lead by example - senior engineers document provenance in their commits and code.

**Month 2:** Make provenance documentation part of code review checklist.

**Month 3:** Add simple audit script to understand current state.

**Month 6:** Evaluate whether you need automated enforcement (git hooks, CI checks).

Start small. Build habits. Automate when manual processes break down.

---

