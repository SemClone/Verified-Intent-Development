# VID Git Hooks

Git hooks that help automate provenance tracking.

## Available Hooks

### `pre-commit`
**Purpose:** Reminds you to add provenance markers to code files before committing.

**Behavior:**
- Scans staged code files for provenance markers
- Warns if files with substantial code lack `@provenance` markers
- Non-blocking (allows commit to proceed)
- Only checks files with > 10 lines of code

**Usage:**
```bash
# Install to your project
cp templates/git-hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

### `prepare-commit-msg`
**Purpose:** Automatically adds a provenance section to your commit message template.

**Behavior:**
- Adds provenance prompts to commit message
- Only activates for regular commits (not merges, rebases, etc.)
- Doesn't duplicate if section already exists

**Usage:**
```bash
# Install to your project
cp templates/git-hooks/prepare-commit-msg .git/hooks/prepare-commit-msg
chmod +x .git/hooks/prepare-commit-msg
```

## Installation

### Single Project

```bash
# From the root of your project
cp /path/to/VID/templates/git-hooks/pre-commit .git/hooks/
cp /path/to/VID/templates/git-hooks/prepare-commit-msg .git/hooks/
chmod +x .git/hooks/pre-commit .git/hooks/prepare-commit-msg
```

### Global Installation (All Repositories)

Git 2.9+ supports global hooks via `core.hooksPath`:

```bash
# Create a global hooks directory
mkdir -p ~/.git-hooks

# Copy VID hooks
cp /path/to/VID/templates/git-hooks/* ~/.git-hooks/
chmod +x ~/.git-hooks/*

# Configure git to use global hooks
git config --global core.hooksPath ~/.git-hooks
```

**Note:** Global hooks will run for ALL repositories. If you want project-specific behavior, use the single project installation method.

### Team-Wide Installation

To share hooks with your team via the repository:

```bash
# Create hooks directory in repo
mkdir -p .githooks

# Copy VID hooks
cp templates/git-hooks/* .githooks/
chmod +x .githooks/*

# Configure git to use repo hooks (each team member runs this)
git config core.hooksPath .githooks

# Commit .githooks to version control
git add .githooks
git commit -m "Add VID provenance git hooks"
```

Then document in your README that team members should run:
```bash
git config core.hooksPath .githooks
```

## Customization

### Making Hooks Stricter

By default, the `pre-commit` hook is non-blocking (it warns but allows commit). To make it blocking:

Edit the last line of `pre-commit`:
```bash
# Change this:
exit 0

# To this:
exit 1  # Blocks commit if provenance markers missing
```

### Adjusting File Types

To check different file extensions, edit the `grep` pattern in `pre-commit`:

```bash
# Current:
code_files=$(echo "$staged_files" | grep -E '\.(ts|js|py|rb|go|java|cpp|c|rs|jsx|tsx)$' || true)

# Add more extensions:
code_files=$(echo "$staged_files" | grep -E '\.(ts|js|py|rb|go|java|cpp|c|rs|jsx|tsx|swift|kt|scala)$' || true)
```

### Adjusting Code Line Threshold

To change the minimum lines of code before requiring provenance markers:

```bash
# Current (10 lines):
if [ "$code_lines" -gt 10 ]; then

# Change to 20 lines:
if [ "$code_lines" -gt 20 ]; then
```

## Troubleshooting

### Hooks Not Running

**Check if hooks are executable:**
```bash
ls -la .git/hooks/
# Should show: -rwxr-xr-x for hook files
```

**Check hook location:**
```bash
git config core.hooksPath
# Should show your hooks directory if configured
```

### Hooks Running on Wrong Files

Check your `.gitignore` - hooks only run on files tracked by git.

### Disabling Hooks Temporarily

To skip hooks for a single commit:
```bash
git commit --no-verify
```

## Best Practices

1. **Start non-blocking**: Use the default warning-only mode while team builds habits
2. **Iterate**: After 2-4 weeks, consider making hooks blocking if needed
3. **Document**: Add hook usage to your team's onboarding docs
4. **Feedback loop**: Review hook messages with team and adjust as needed

## Example Workflow

1. Developer writes code with AI assistance
2. Adds provenance marker using VS Code snippet (`vid-ai`)
3. Stages changes: `git add src/feature.ts`
4. Attempts commit: `git commit`
5. `pre-commit` hook: Checks for provenance markers ✓
6. `prepare-commit-msg` hook: Adds provenance section to commit message
7. Developer fills in provenance details in commit message
8. Commit succeeds with full provenance documentation
