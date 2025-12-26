#!/bin/bash

# VID Provenance Audit Script
# Generates a report of provenance metadata in your codebase

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "========================================"
echo "VID Provenance Audit Report"
echo "Generated: $(date)"
echo "========================================"
echo ""

# Function to count files with a specific provenance marker
count_provenance() {
    local marker=$1
    grep -r "@provenance $marker" --include="*.ts" --include="*.js" --include="*.py" --include="*.rb" --include="*.go" --include="*.java" --include="*.cpp" --include="*.c" --include="*.rs" 2>/dev/null | wc -l | xargs
}

# Function to count files with a specific verification level
count_verification() {
    local level=$1
    grep -r "@verification $level" --include="*.ts" --include="*.js" --include="*.py" --include="*.rb" --include="*.go" --include="*.java" --include="*.cpp" --include="*.c" --include="*.rs" 2>/dev/null | wc -l | xargs
}

# Count total files with provenance markers
total_marked=$(grep -r "@provenance" --include="*.ts" --include="*.js" --include="*.py" --include="*.rb" --include="*.go" --include="*.java" --include="*.cpp" --include="*.c" --include="*.rs" 2>/dev/null | wc -l | xargs)

# Count by provenance type
ai_generated=$(count_provenance "ai-generated")
ai_assisted=$(count_provenance "ai-assisted")
human_original=$(count_provenance "human-original")
mixed=$(count_provenance "mixed")

# Count by verification level
deep_verify=$(count_verification "deep")
standard_verify=$(count_verification "standard")
light_verify=$(count_verification "light")
unreviewed=$(count_verification "unreviewed")

# Summary section
echo -e "${BLUE}## Summary${NC}"
echo "Total files with provenance markers: $total_marked"
echo ""

# Provenance breakdown
echo -e "${BLUE}## Provenance Breakdown${NC}"
echo "AI-generated: $ai_generated"
echo "AI-assisted: $ai_assisted"
echo "Human-original: $human_original"
echo "Mixed: $mixed"
echo ""

# Verification breakdown
echo -e "${BLUE}## Verification Levels${NC}"
echo "Deep verification: $deep_verify"
echo "Standard verification: $standard_verify"
echo "Light verification: $light_verify"
echo "Unreviewed: $unreviewed"
echo ""

# High-risk areas
echo -e "${YELLOW}## ⚠️  High-Risk Areas${NC}"
echo "Files with AI-generated code and light/no verification:"
echo ""
grep -r "@provenance ai-generated" --include="*.ts" --include="*.js" --include="*.py" --include="*.rb" --include="*.go" --include="*.java" --include="*.cpp" --include="*.c" --include="*.rs" -l 2>/dev/null | while read file; do
    if grep -q "@verification light\|@verification unreviewed" "$file" 2>/dev/null; then
        verification=$(grep "@verification" "$file" | head -1 | sed 's/.*@verification //')
        echo -e "${RED}  - $file${NC} (verification: $verification)"
    fi
done

# List files without provenance markers in commonly changed directories
echo ""
echo -e "${YELLOW}## Files Without Provenance Markers${NC}"
echo "Sample of files that may need provenance documentation:"
echo ""

# Look in src/ directory if it exists
if [ -d "src" ]; then
    find src -type f \( -name "*.ts" -o -name "*.js" -o -name "*.py" -o -name "*.rb" -o -name "*.go" -o -name "*.java" \) 2>/dev/null | head -20 | while read file; do
        if ! grep -q "@provenance" "$file" 2>/dev/null; then
            echo "  - $file"
        fi
    done
fi

# Tools usage
echo ""
echo -e "${BLUE}## AI Tools Used${NC}"
grep -rh "@tool" --include="*.ts" --include="*.js" --include="*.py" --include="*.rb" --include="*.go" --include="*.java" --include="*.cpp" --include="*.c" --include="*.rs" 2>/dev/null | sed 's/.*@tool //' | sort | uniq -c | sort -rn

# Recommendations
echo ""
echo -e "${BLUE}## Recommendations${NC}"

if [ "$unreviewed" -gt 0 ]; then
    echo -e "${YELLOW}⚠️  Found $unreviewed files with unreviewed AI-generated code${NC}"
    echo "   Consider reviewing and verifying this code."
fi

if [ "$light_verify" -gt 0 ]; then
    echo -e "${YELLOW}⚠️  Found $light_verify files with light verification${NC}"
    echo "   Consider deeper review for critical code paths."
fi

if [ "$total_marked" -eq 0 ]; then
    echo -e "${RED}❌ No provenance markers found in codebase${NC}"
    echo "   Consider starting to document code provenance."
    echo "   See templates/ directory for tools and examples."
fi

if [ "$total_marked" -gt 0 ]; then
    echo -e "${GREEN}✓ Provenance tracking is active${NC}"
    percent_ai=$((($ai_generated + $ai_assisted + $mixed) * 100 / $total_marked))
    echo "   Approximately $percent_ai% of marked code involves AI"
fi

echo ""
echo "========================================"
echo "End of Report"
echo "========================================"
