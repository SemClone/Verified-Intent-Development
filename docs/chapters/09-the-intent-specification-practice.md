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
For complex or high-risk code, use structured specification documents.

### Matching Formality to Risk

- Trivial code: Mental intent is sufficient
- Typical code: Comment intent or test-first intent
- Important code: Test-first intent with edge cases
- Critical code: Formal specification with comprehensive test cases

### Anti-Pattern: Retroactive Intent

Writing intent after generation defeats the purpose. If you generate first, you'll rationalize that the output matches your intent rather than critically evaluating it.

The discipline is: intent first, always.

---

