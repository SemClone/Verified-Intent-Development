# Building the VID Book

This document explains how to build the VID methodology book into various formats (PDF, EPUB) and prepare it for publishing on Leanpub.

## Quick Start

```bash
./build-book.sh
```

This will create:
- `build/VID-Methodology.pdf` - PDF version
- `build/VID-Methodology.epub` - EPUB version
- `build/VID-Complete.md` - Combined markdown
- `manuscript/` - Leanpub-ready manuscript directory

## Prerequisites

### Required

**Pandoc** - Universal document converter
```bash
# Debian/Ubuntu
sudo apt-get install pandoc

# macOS
brew install pandoc

# Other systems
# Visit: https://pandoc.org/installing.html
```

### Optional (for better PDF output)

**TeX Live** - LaTeX distribution for high-quality PDF generation
```bash
# Debian/Ubuntu
sudo apt-get install texlive-xetex texlive-fonts-recommended texlive-fonts-extra

# macOS
brew install --cask mactex
# Or install BasicTeX for smaller footprint:
brew install --cask basictex

# After installing BasicTeX, add required packages:
sudo tlmgr install collection-fontsrecommended
```

**Cover Image** - Optional cover.png in root directory for EPUB cover

## Output Formats

### PDF

High-quality PDF suitable for:
- Print publishing
- Professional sharing
- Archival

Features:
- Table of contents with page numbers
- Numbered sections
- Syntax highlighting for code
- Hyperlinked cross-references
- Professional typography (with XeLaTeX)

### EPUB

E-book format for:
- E-readers (Kindle, Kobo, etc.)
- Reading apps
- Accessibility features

Features:
- Reflowable text
- Adjustable font sizes
- Device compatibility
- Embedded table of contents

### Leanpub Manuscript

Directory structure for Leanpub publishing:
```
manuscript/
├── Book.txt                # Chapter order
└── [all chapter files]     # Individual chapters
```

Upload this directory to Leanpub to publish.

## Publishing to Leanpub

1. **Create a Leanpub book**
   - Go to https://leanpub.com/create/book
   - Choose "Bring Your Own Book" workflow
   - Select Markdown format

2. **Upload manuscript**
   - Run `./build-book.sh` to generate `manuscript/` directory
   - Zip the manuscript directory or use Leanpub's GitHub integration
   - Upload to your Leanpub book repository

3. **Configure book settings**
   ```yaml
   title: "Verified Intent Development"
   subtitle: "A Methodology for the Age of AI-Augmented Software Development"
   author: "SEMCL.ONE Community"
   copyright: "Licensed under CC BY-SA 4.0"
   ```

4. **Preview and publish**
   - Generate preview on Leanpub
   - Review formatting
   - Publish when ready

## Customization

### Changing Chapter Order

Edit the `CHAPTERS` array in `build-book.sh`:

```bash
CHAPTERS=(
    "chapters/00-preface.md"
    "chapters/01-the-inversion.md"
    # Add, remove, or reorder chapters
)
```

### PDF Styling

Modify pandoc PDF options in `build-book.sh`:

```bash
--variable papersize=a4        # Change paper size
--variable fontsize=12pt       # Change font size
--variable geometry:margin=1.5in  # Change margins
--variable mainfont="Times New Roman"  # Change font (requires XeLaTeX)
```

### EPUB Metadata

Edit the `--epub-metadata` section in `build-book.sh` to customize:
- Title
- Author
- Publisher
- Copyright
- Language

### Adding a Cover Image

Create `cover.png` in the root directory:
- Recommended size: 1600x2400 pixels
- Format: PNG or JPEG
- Will be automatically included in EPUB

## Troubleshooting

### "pandoc: command not found"

Install pandoc (see Prerequisites above).

### PDF generation fails with "xelatex not found"

Install TeX Live (see Optional Prerequisites above).

For basic PDF without XeLaTeX:
```bash
# Edit build-book.sh and change:
--pdf-engine=xelatex
# to:
--pdf-engine=pdflatex
```

### "Missing character" warnings

These warnings are usually safe to ignore. They occur when special Unicode characters aren't available in the selected font.

To suppress:
```bash
# Already handled in build-book.sh with:
2>&1 | grep -v "Missing character"
```

### EPUB validation errors

Validate your EPUB:
```bash
# Install epubcheck
sudo apt-get install epubcheck

# Validate
epubcheck build/VID-Methodology.epub
```

### Chapter links broken in PDF

Ensure all internal links use proper markdown reference format:
```markdown
[Chapter 1](chapters/01-the-inversion.md)  # Works in web/EPUB
[Chapter 1](#chapter-1)                    # Works in PDF
```

## Alternative Tools

### Using Calibre (GUI)

1. Install Calibre: https://calibre-ebook.com/
2. Run `./build-book.sh` to generate `build/VID-Complete.md`
3. Import VID-Complete.md into Calibre
4. Convert to desired format
5. Customize metadata and styling

### Using DocBook

For more advanced typesetting:
```bash
pandoc build/VID-Complete.md -t docbook -o build/VID.xml
# Use DocBook toolchain for PDF generation
```

### Using LaTeX Directly

For complete control over PDF formatting:
```bash
pandoc build/VID-Complete.md -t latex -o build/VID.tex
# Edit VID.tex with custom LaTeX styling
pdflatex build/VID.tex
```

## Continuous Integration

### GitHub Actions Example

Create `.github/workflows/build-book.yml`:

```yaml
name: Build Book

on:
  push:
    branches: [ master ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2

    - name: Install dependencies
      run: |
        sudo apt-get update
        sudo apt-get install -y pandoc texlive-xetex

    - name: Build book
      run: ./build-book.sh

    - name: Upload artifacts
      uses: actions/upload-artifact@v2
      with:
        name: book-builds
        path: build/
```

## License

This build system is part of the VID methodology and is licensed under CC BY-SA 4.0.

The generated books inherit the same license.

---

**Questions or issues?**
- Report build issues: https://github.com/SemClone/Verified-Intent-Development/issues
- Contribute improvements to build-book.sh
