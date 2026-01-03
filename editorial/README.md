# Editorial Documentation

This directory contains editorial documentation for building, publishing, and deploying the VID book.

## Quick Links

- **[QUICKSTART.md](QUICKSTART.md)** - Get started in 5 minutes
- **[PUBLISHING.md](PUBLISHING.md)** - Complete publishing guide (Website, Leanpub, Kindle)
- **[WEBSITE.md](WEBSITE.md)** - Detailed website deployment guide
- **[BUILD.md](BUILD.md)** - Build script documentation
- **[DEPLOYMENT_SUMMARY.txt](DEPLOYMENT_SUMMARY.txt)** - Quick deployment reference

## For Different Audiences

### Authors & Contributors
- Start with [QUICKSTART.md](QUICKSTART.md) to understand the workflow
- See [BUILD.md](BUILD.md) for build script details

### Publishers
- Read [PUBLISHING.md](PUBLISHING.md) for multi-platform publishing
- Use [QUICKSTART.md](QUICKSTART.md) for quick deployment

### Developers
- Check [WEBSITE.md](WEBSITE.md) for website customization
- See [BUILD.md](BUILD.md) for build process details

## File Overview

| File | Purpose | Audience |
|------|---------|----------|
| QUICKSTART.md | Quick start guide | Everyone |
| PUBLISHING.md | Complete publishing guide | Publishers, Authors |
| WEBSITE.md | Website deployment details | Developers |
| BUILD.md | Build script documentation | Developers |
| DEPLOYMENT_SUMMARY.txt | Quick reference | Everyone |

## Common Tasks

**Build the book:**
```bash
./build-book.sh
```

**Preview website locally:**
```bash
npx serve docs
```

**Deploy to GitHub Pages:**
1. Push to master
2. Enable Pages in Settings → Pages → `/docs` folder
3. Visit https://yourusername.github.io/repo-name/

## Need Help?

See the main [README.md](../README.md) for project overview and [CONTRIBUTING.md](../CONTRIBUTING.md) for contribution guidelines.
