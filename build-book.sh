#!/bin/bash

# VID Book Build Script
# Converts VID methodology chapters to PDF and EPUB formats
# Supports Leanpub manuscript structure

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
OUTPUT_DIR="build"
MANUSCRIPT_DIR="manuscript"
DOCS_DIR="docs"
BOOK_TITLE="Verified Intent Development"
BOOK_SUBTITLE="A Methodology for the Age of AI-Augmented Software Development"
AUTHOR="Oscar Valenzuela"
VERSION="First Edition - December 2025"

# Chapter order (matching README structure)
CHAPTERS=(
    "chapters/00-preface.md"
    "chapters/01-the-inversion.md"
    "chapters/02-why-existing-approaches-fall-short.md"
    "chapters/03-the-core-insight.md"
    "chapters/04-principle-one-intent-before-generation.md"
    "chapters/05-principle-two-graduated-trust.md"
    "chapters/06-principle-three-understanding-over-acceptance.md"
    "chapters/07-principle-four-provenance-awareness.md"
    "chapters/08-principle-five-continuous-calibration.md"
    "chapters/09-the-intent-specification-practice.md"
    "chapters/10-the-verification-ritual-practice.md"
    "chapters/11-the-learning-loop-practice.md"
    "chapters/12-the-provenance-hygiene-practice.md"
    "chapters/13-for-junior-engineers.md"
    "chapters/14-for-senior-engineers.md"
    "chapters/15-for-teams-and-organizations.md"
    "chapters/16-adopting-vid.md"
    "chapters/17-the-continuing-evolution.md"
    "chapters/18-summary.md"
    "chapters/19-patterns-and-anti-patterns.md"
    "chapters/20-the-verification-toolkit.md"
    "chapters/21-test-verification-framework.md"
    "chapters/22-real-world-examples.md"
    "chapters/appendix-a-quick-reference.md"
    "chapters/appendix-b-discussion-questions.md"
    "chapters/appendix-c-glossary.md"
    "chapters/appendix-d-risk-scoring-rubric.md"
    "chapters/appendix-e-decision-trees.md"
    "chapters/appendix-f-checklists.md"
)

echo -e "${GREEN}VID Book Build Script${NC}"
echo "=================================="

# Check dependencies
check_dependency() {
    if ! command -v $1 &> /dev/null; then
        echo -e "${RED}Error: $1 is not installed${NC}"
        echo "Install with: $2"
        return 1
    fi
    return 0
}

echo -e "\n${YELLOW}Checking dependencies...${NC}"
DEPS_OK=true
if ! check_dependency "pandoc" "sudo apt-get install pandoc (Debian/Ubuntu) or brew install pandoc (macOS)"; then
    DEPS_OK=false
fi

if [ "$DEPS_OK" = false ]; then
    echo -e "\n${RED}Missing dependencies. Please install them and try again.${NC}"
    exit 1
fi

echo -e "${GREEN}All dependencies found${NC}"

# Clean and create output directories
echo -e "\n${YELLOW}Cleaning and creating output directories...${NC}"

# Remove old build artifacts to ensure fresh build
if [ -d "$OUTPUT_DIR" ]; then
    echo "  Removing old build artifacts..."
    rm -f "$OUTPUT_DIR"/*.pdf
    rm -f "$OUTPUT_DIR"/*.epub
    rm -f "$OUTPUT_DIR"/*.md
fi

mkdir -p "$OUTPUT_DIR"
mkdir -p "$MANUSCRIPT_DIR"
mkdir -p "$DOCS_DIR"

# Generate timestamp for dated versions
BUILD_DATE=$(date +%Y-%m-%d)
BUILD_TIMESTAMP=$(date +%Y%m%d-%H%M%S)

# Build combined markdown file
echo -e "\n${YELLOW}Combining chapters...${NC}"
COMBINED_FILE="$OUTPUT_DIR/VID-Complete.md"

# Create title page
cat > "$COMBINED_FILE" << EOF
---
title: "$BOOK_TITLE"
subtitle: "$BOOK_SUBTITLE"
author: "$AUTHOR"
date: "$VERSION"
license: "CC BY-SA 4.0"
---

EOF

# Combine all chapters
for chapter in "${CHAPTERS[@]}"; do
    if [ -f "$chapter" ]; then
        echo "  Adding: $chapter"
        cat "$chapter" >> "$COMBINED_FILE"
        echo -e "\n\n---\n\n" >> "$COMBINED_FILE"
    else
        echo -e "${YELLOW}  Warning: $chapter not found, skipping${NC}"
    fi
done

echo -e "${GREEN}Combined markdown created: $COMBINED_FILE${NC}"

# Build PDF
echo -e "\n${YELLOW}Building PDF...${NC}"

# Create dated PDF first
PDF_DATED="$OUTPUT_DIR/VID-Methodology-$BUILD_DATE.pdf"
pandoc "$COMBINED_FILE" \
    --from=markdown+smart \
    --to=pdf \
    --output="$PDF_DATED" \
    --pdf-engine=xelatex \
    --toc \
    --toc-depth=2 \
    --number-sections \
    --highlight-style=tango \
    --variable papersize=letter \
    --variable geometry:margin=1in \
    --variable fontsize=11pt \
    --variable linkcolor=blue \
    --variable urlcolor=blue \
    2>&1 | grep -v "Missing character" || true

if [ -f "$PDF_DATED" ]; then
    # Copy dated version to standard filename
    cp "$PDF_DATED" "$OUTPUT_DIR/VID-Methodology.pdf"

    PDF_SIZE=$(ls -lh "$PDF_DATED" | awk '{print $5}')
    echo -e "${GREEN}PDF created:${NC}"
    echo -e "  ${GREEN}Standard:${NC} $OUTPUT_DIR/VID-Methodology.pdf"
    echo -e "  ${GREEN}Dated:${NC} $PDF_DATED ($PDF_SIZE)"
else
    echo -e "${YELLOW}PDF creation failed or was skipped${NC}"
fi

# Build EPUB
echo -e "\n${YELLOW}Building EPUB...${NC}"

# Create dated EPUB first
EPUB_DATED="$OUTPUT_DIR/VID-Methodology-$BUILD_DATE.epub"
pandoc "$COMBINED_FILE" \
    --from=markdown+smart \
    --to=epub3 \
    --output="$EPUB_DATED" \
    --toc \
    --toc-depth=2 \
    --epub-metadata=<(cat << EOF
<dc:title>$BOOK_TITLE</dc:title>
<dc:creator>$AUTHOR</dc:creator>
<dc:publisher>SEMCL.ONE Community</dc:publisher>
<dc:date>2025</dc:date>
<dc:rights>Licensed under CC BY-SA 4.0</dc:rights>
<dc:language>en-US</dc:language>
EOF
) \
    --epub-cover-image=cover.png 2>/dev/null || \
    pandoc "$COMBINED_FILE" \
        --from=markdown+smart \
        --to=epub3 \
        --output="$EPUB_DATED" \
        --toc \
        --toc-depth=2

if [ -f "$EPUB_DATED" ]; then
    # Copy dated version to standard filename
    cp "$EPUB_DATED" "$OUTPUT_DIR/VID-Methodology.epub"

    EPUB_SIZE=$(ls -lh "$EPUB_DATED" | awk '{print $5}')
    echo -e "${GREEN}EPUB created:${NC}"
    echo -e "  ${GREEN}Standard:${NC} $OUTPUT_DIR/VID-Methodology.epub"
    echo -e "  ${GREEN}Dated:${NC} $EPUB_DATED ($EPUB_SIZE)"
else
    echo -e "${YELLOW}EPUB creation failed${NC}"
fi

# Create Leanpub manuscript structure
echo -e "\n${YELLOW}Creating Leanpub manuscript structure...${NC}"

# Create resources folder for images/assets
mkdir -p "$MANUSCRIPT_DIR/resources"

# Copy chapters to manuscript directory
for chapter in "${CHAPTERS[@]}"; do
    if [ -f "$chapter" ]; then
        cp "$chapter" "$MANUSCRIPT_DIR/"
    fi
done

# Create Book.txt for Leanpub (full book)
cat > "$MANUSCRIPT_DIR/Book.txt" << EOF
00-preface.md
01-the-inversion.md
02-why-existing-approaches-fall-short.md
03-the-core-insight.md
04-principle-one-intent-before-generation.md
05-principle-two-graduated-trust.md
06-principle-three-understanding-over-acceptance.md
07-principle-four-provenance-awareness.md
08-principle-five-continuous-calibration.md
09-the-intent-specification-practice.md
10-the-verification-ritual-practice.md
11-the-learning-loop-practice.md
12-the-provenance-hygiene-practice.md
13-for-junior-engineers.md
14-for-senior-engineers.md
15-for-teams-and-organizations.md
16-adopting-vid.md
17-the-continuing-evolution.md
18-summary.md
19-patterns-and-anti-patterns.md
20-the-verification-toolkit.md
21-test-verification-framework.md
appendix-a-quick-reference.md
appendix-b-discussion-questions.md
appendix-c-glossary.md
appendix-d-risk-scoring-rubric.md
appendix-e-decision-trees.md
appendix-f-checklists.md
EOF

# Create Sample.txt for Leanpub (free preview - first 4 chapters)
cat > "$MANUSCRIPT_DIR/Sample.txt" << EOF
00-preface.md
01-the-inversion.md
02-why-existing-approaches-fall-short.md
03-the-core-insight.md
EOF

# Create Subset.txt for Leanpub (development/testing - first 2 chapters)
cat > "$MANUSCRIPT_DIR/Subset.txt" << EOF
00-preface.md
01-the-inversion.md
EOF

echo -e "${GREEN}Leanpub manuscript created in $MANUSCRIPT_DIR/${NC}"
echo -e "  ${GREEN}Book.txt:${NC} Full book structure (28 chapters)"
echo -e "  ${GREEN}Sample.txt:${NC} Free preview (4 chapters)"
echo -e "  ${GREEN}Subset.txt:${NC} Development preview (2 chapters)"

# Create website structure (Docsify)
echo -e "\n${YELLOW}Creating website (Docsify)...${NC}"

# Ensure docs directory structure exists and is fresh
rm -rf "$DOCS_DIR/chapters"
mkdir -p "$DOCS_DIR/chapters"
mkdir -p "$DOCS_DIR/resources"

# Copy chapters to docs directory
for chapter in "${CHAPTERS[@]}"; do
    if [ -f "$chapter" ]; then
        cp "$chapter" "$DOCS_DIR/chapters/"
    fi
done

# Copy top-level README for Docsify landing page
if [ -f "README.md" ]; then
    cp README.md "$DOCS_DIR/README.md"
fi

# Copy resources to docs directory
if [ -d "resources" ]; then
    cp resources/*.md "$DOCS_DIR/resources/" 2>/dev/null || true
fi

# Copy releases to docs directory for GitHub Pages
mkdir -p "$DOCS_DIR/releases"
if [ -f "$OUTPUT_DIR/VID-Methodology.pdf" ]; then
    cp "$OUTPUT_DIR/VID-Methodology.pdf" "$DOCS_DIR/releases/"
fi
if [ -f "$OUTPUT_DIR/VID-Methodology.epub" ]; then
    cp "$OUTPUT_DIR/VID-Methodology.epub" "$DOCS_DIR/releases/"
fi

echo -e "${GREEN}Website files updated in $DOCS_DIR/${NC}"
echo -e "  ${GREEN}Chapters:${NC} $DOCS_DIR/chapters/"
echo -e "  ${GREEN}Resources:${NC} $DOCS_DIR/resources/"
echo -e "  ${GREEN}Releases:${NC} $DOCS_DIR/releases/"
echo -e "  ${GREEN}Website README:${NC} $DOCS_DIR/README.md"

# Summary
echo -e "\n${GREEN}=================================="
echo "Build Complete!"
echo "==================================${NC}"
echo ""
echo "Generated files:"
if [ -f "$OUTPUT_DIR/VID-Methodology.pdf" ]; then
    echo -e "  ${GREEN}PDF (standard):${NC} $OUTPUT_DIR/VID-Methodology.pdf"
    if [ -f "$PDF_DATED" ]; then
        echo -e "  ${GREEN}PDF (dated):${NC} $PDF_DATED"
    fi
fi
if [ -f "$OUTPUT_DIR/VID-Methodology.epub" ]; then
    echo -e "  ${GREEN}EPUB (standard):${NC} $OUTPUT_DIR/VID-Methodology.epub"
    if [ -f "$EPUB_DATED" ]; then
        echo -e "  ${GREEN}EPUB (dated):${NC} $EPUB_DATED"
    fi
fi
echo -e "  ${GREEN}Combined Markdown:${NC} $OUTPUT_DIR/VID-Complete.md"
echo -e "  ${GREEN}Leanpub Manuscript:${NC} $MANUSCRIPT_DIR/"
echo -e "  ${GREEN}Website:${NC} $DOCS_DIR/"
echo ""
echo -e "${YELLOW}Build Date:${NC} $BUILD_DATE"
echo ""
echo "Usage:"
echo "  - Share PDF/EPUB with readers"
echo "  - Upload manuscript/ directory to Leanpub"
echo "  - Upload EPUB to Amazon Kindle Direct Publishing (KDP)"
echo "  - Serve docs/ as website (see instructions below)"
echo "  - Use VID-Complete.md for other conversions"
echo ""
echo -e "${YELLOW}Publishing Instructions:${NC}"
echo ""
echo "Leanpub:"
echo "  1. Connect your Dropbox or GitHub to Leanpub"
echo "  2. Upload the manuscript/ directory contents"
echo "  3. Generate preview using Book.txt (full book)"
echo "  4. Use Sample.txt for the free preview on your landing page"
echo "  5. Use Subset.txt during development for faster previews"
echo ""
echo "Amazon Kindle (KDP):"
echo "  1. Go to kdp.amazon.com"
echo "  2. Upload build/VID-Methodology.epub as your manuscript"
echo "  3. Amazon will convert EPUB to Kindle format automatically"
echo "  4. Note: MOBI format is deprecated as of Feb 2025"
echo ""
echo "Website (Docsify - Free hosting):"
echo "  Local preview:"
echo "    npx serve docs"
echo "    # Or: python3 -m http.server 3000 --directory docs"
echo ""
echo "  Deploy options:"
echo "    • GitHub Pages: Push to GitHub, enable Pages on 'docs/' folder"
echo "    • Netlify: Drag & drop 'docs/' folder to netlify.com/drop"
echo "    • Vercel: Connect GitHub repo and deploy"
echo "    • Cloudflare Pages: Connect repo and deploy"
echo ""
echo -e "${YELLOW}Optional:${NC}"
echo "  - Add cover.png (1600x2560px recommended) in root directory"
echo "  - Add images to manuscript/resources/ folder"
