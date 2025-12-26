#!/bin/bash

# VID Verification Checker
# Finds high-risk AI-generated code that needs review

set -e

# Colors for output
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "========================================"
echo "VID High-Risk Code Check"
echo "========================================"
echo ""

# Find AI-generated code with light or no verification
echo -e "${YELLOW}Searching for high-risk AI-generated code...${NC}"
echo ""

found_issues=0

# Check for unreviewed AI-generated code
unreviewed_files=$(grep -r "@provenance ai-generated" --include="*.ts" --include="*.js" --include="*.py" --include="*.rb" --include="*.go" --include="*.java" --include="*.cpp" --include="*.c" --include="*.rs" -l 2>/dev/null || true)

if [ -n "$unreviewed_files" ]; then
    echo "$unreviewed_files" | while read file; do
        if grep -q "@verification unreviewed" "$file" 2>/dev/null; then
            echo -e "${RED}❌ UNREVIEWED: $file${NC}"

            # Show the tool used
            tool=$(grep "@tool" "$file" 2>/dev/null | head -1 | sed 's/.*@tool //' || echo "unknown")
            echo "   Tool: $tool"

            # Show human intent if available
            intent=$(grep "Human intent:" "$file" 2>/dev/null | head -1 | sed 's/.*Human intent: //' || echo "not documented")
            echo "   Intent: $intent"

            # Show line numbers where the code starts
            line=$(grep -n "@provenance ai-generated" "$file" | head -1 | cut -d: -f1)
            echo "   Location: $file:$line"
            echo ""

            found_issues=$((found_issues + 1))
        fi
    done
fi

# Check for lightly verified AI-generated code
if [ -n "$unreviewed_files" ]; then
    echo "$unreviewed_files" | while read file; do
        if grep -q "@verification light" "$file" 2>/dev/null; then
            echo -e "${YELLOW}⚠️  LIGHT VERIFICATION: $file${NC}"

            # Show the tool used
            tool=$(grep "@tool" "$file" 2>/dev/null | head -1 | sed 's/.*@tool //' || echo "unknown")
            echo "   Tool: $tool"

            # Show human intent if available
            intent=$(grep "Human intent:" "$file" 2>/dev/null | head -1 | sed 's/.*Human intent: //' || echo "not documented")
            echo "   Intent: $intent"

            # Show known limitations if available
            limitations=$(grep "Known limitations:" "$file" 2>/dev/null | head -1 | sed 's/.*Known limitations: //' || echo "not documented")
            echo "   Limitations: $limitations"

            # Show line numbers
            line=$(grep -n "@provenance ai-generated" "$file" | head -1 | cut -d: -f1)
            echo "   Location: $file:$line"
            echo ""

            found_issues=$((found_issues + 1))
        fi
    done
fi

# Summary
echo "========================================"
if [ $found_issues -eq 0 ]; then
    echo -e "${GREEN}✓ No high-risk AI-generated code found${NC}"
    echo "All AI-generated code has adequate verification."
else
    echo -e "${RED}Found $found_issues file(s) needing attention${NC}"
    echo ""
    echo "Recommendations:"
    echo "1. Review unreviewed code thoroughly"
    echo "2. For lightly verified code, consider:"
    echo "   - Adding comprehensive tests"
    echo "   - Reviewing edge cases"
    echo "   - Documenting known limitations"
    echo "3. Update @verification tag after review"
fi
echo "========================================"

# Exit with error code if issues found (useful for CI)
if [ $found_issues -gt 0 ]; then
    exit 1
fi
