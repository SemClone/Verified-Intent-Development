# VID Provenance Tracking Tools

This directory contains ready-to-use tools for implementing scalable provenance tracking in your codebase.

These tools support the practices described in [Chapter 12: The Provenance Hygiene Practice](../chapters/12-the-provenance-hygiene-practice.md).

## What's Inside

### Git Templates

**[git-commit-template.txt](git-commit-template.txt)**
- Template for commit messages with provenance prompts
- Setup: `git config commit.template templates/git-commit-template.txt`

**[pr-template.md](pr-template.md)**
- Pull request template with provenance checklist
- Place in `.github/pull_request_template.md` in your repo

### Git Hooks

Located in `git-hooks/` directory:

**[pre-commit](git-hooks/pre-commit)**
- Reminds you to add provenance markers before committing
- Non-blocking by default (can be configured to block)
- Checks code files for `@provenance` markers

**[prepare-commit-msg](git-hooks/prepare-commit-msg)**
- Automatically adds provenance section to commit messages
- Works for regular commits (not merges)

See [git-hooks/README.md](git-hooks/README.md) for detailed installation and customization.

### Code Editor Tools

**[provenance-markers.code-snippets](provenance-markers.code-snippets)**
- VS Code snippets for quick provenance documentation
- Snippets: `vid-ai`, `vid-assist`, `vid-human`, `vid-mixed`
- See [SNIPPETS-README.md](SNIPPETS-README.md) for installation

### Audit Scripts

Located in `scripts/` directory:

**[audit-provenance.sh](scripts/audit-provenance.sh)**
- Generate comprehensive provenance reports
- Shows provenance breakdown, verification levels, high-risk areas
- Usage: `./templates/scripts/audit-provenance.sh`

**[check-verification.sh](scripts/check-verification.sh)**
- Find high-risk AI-generated code needing review
- Identifies unreviewed and lightly-verified code
- Can be used in CI pipelines (exits with error code if issues found)
- Usage: `./templates/scripts/check-verification.sh`

## Quick Start

### Level 1: Manual Tracking (Small Teams)

**Week 1:**
```bash
# Set up commit template
git config commit.template templates/git-commit-template.txt
```

Just use the commit template. That's it. Start building the habit.

### Level 2: Structured Metadata (Medium Teams)

**Week 1-2:**
```bash
# Install VS Code snippets (see SNIPPETS-README.md)
# Install git hooks
cp templates/git-hooks/pre-commit .git/hooks/
cp templates/git-hooks/prepare-commit-msg .git/hooks/
chmod +x .git/hooks/pre-commit .git/hooks/prepare-commit-msg
```

**Month 2:**
```bash
# Run your first audit
./templates/scripts/audit-provenance.sh
```

### Level 3: Automated Tracking (Large Teams)

**All of the above, plus:**

```bash
# Add verification check to CI
# In your .github/workflows/ci.yml or similar:
# - name: Check AI-generated code verification
#   run: ./templates/scripts/check-verification.sh
```

```bash
# Share hooks with team via repo
mkdir -p .githooks
cp templates/git-hooks/* .githooks/
git add .githooks
git commit -m "Add VID provenance hooks"

# Team members run:
git config core.hooksPath .githooks
```

## Provenance Marker Format

All tools use consistent, greppable markers:

```typescript
// @provenance ai-generated | ai-assisted | human-original | mixed
// @tool <tool-name>
// @verification deep | standard | light | unreviewed
// @reviewer <email>
// Human intent: <what you were trying to accomplish>
// Known limitations: <edge cases or scenarios not handled>
```

**Example:**
```python
# @provenance ai-generated
# @tool copilot
# @verification deep
# @reviewer alice@example.com
# Human intent: Parse ISO 8601 dates with timezone support
# Known limitations: Doesn't handle leap seconds
def parse_datetime(date_string: str) -> datetime:
    # ...
```

## Tool Selection Guide

| Team Size | Codebase Size | Recommended Tools |
|-----------|---------------|-------------------|
| < 5 people | < 10k LOC | Commit template only |
| 5-20 people | 10k-100k LOC | Commit template + VS Code snippets + git hooks |
| 20+ people | 100k+ LOC | All tools + CI integration |

## Philosophy

These tools follow VID principles:

1. **Make it hard to forget** - Git hooks prompt for provenance
2. **Make it easy to query** - Greppable markers enable programmatic audit
3. **Make it maintainable** - Simple, lightweight tools that won't be abandoned
4. **Make it culturally normal** - Templates make provenance documentation routine

**Key insight:** Automation helps, but doesn't replace judgment. These tools assist, remind, and report - but humans still make the verification decisions.

## Customization

All tools are designed to be customized:

- **File types**: Edit `grep` patterns in scripts to match your stack
- **Strictness**: Make hooks blocking vs. warning-only
- **Markers**: Adjust comment syntax for your languages
- **Reports**: Modify audit scripts to highlight what matters to your team

See individual README files in subdirectories for customization details.

## Support

For questions, issues, or suggestions:
- Open an issue in the main VID repository
- See [Chapter 12](../chapters/12-the-provenance-hygiene-practice.md) for methodology background
- Check [CONTRIBUTING.md](../CONTRIBUTING.md) for how to contribute improvements

## License

These tools are part of the VID Methodology, licensed under [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/).

You're free to use, modify, and share these tools. Attribution appreciated but not required for the tools themselves (though methodology attribution is required per CC BY-SA 4.0).
