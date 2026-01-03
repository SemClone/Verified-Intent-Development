# Quick Start Guide

Get your VID book published in 3 formats (Website, Leanpub, Kindle) with one command.

## 1. Build Everything

```bash
./build-book.sh
```

This generates:
- **PDF** (`build/VID-Methodology.pdf`)
- **EPUB** (`build/VID-Methodology.epub`)
- **Leanpub manuscript** (`manuscript/`)
- **Website** (`docs/`)

## 2. Choose Your Publishing Platform(s)

### Option A: Free Website (Recommended First Step)

**Preview locally:**
```bash
npx serve docs
# Open http://localhost:3000
```

**Deploy to GitHub Pages (Free):**
```bash
git add .
git commit -m "Add VID book website"
git push origin master
```

Then:
1. Go to GitHub repo → Settings → Pages
2. Select branch: `master`, folder: `/docs`
3. Save
4. Your book is live at `https://yourusername.github.io/repo-name/`

**Or deploy to Netlify (Even faster):**
1. Go to https://app.netlify.com/drop
2. Drag the `docs/` folder
3. Done! You get an instant URL

---

### Option B: Leanpub

**GitHub Mode (Recommended):**
1. Sign up at https://leanpub.com
2. Create book → Choose "GitHub" mode
3. Connect this repository
4. Set manuscript folder: `manuscript`
5. Generate preview → Publish

**Dropbox Mode:**
1. Sign up at https://leanpub.com
2. Create book → Choose "Dropbox" mode
3. Copy `manuscript/*` to your Leanpub Dropbox folder
4. Generate preview → Publish

---

### Option C: Amazon Kindle

1. Go to https://kdp.amazon.com
2. Create new Kindle eBook
3. Upload `build/VID-Methodology.epub`
4. Add metadata and cover
5. Publish (live in 24-72 hours)

---

## 3. Update Your Book

When you edit chapters:

```bash
# 1. Edit your chapters
vim chapters/01-the-inversion.md

# 2. Rebuild
./build-book.sh

# 3. Deploy updates
git add .
git commit -m "Update chapter 1"
git push  # Website auto-updates!

# 4. For Leanpub: Generate new preview (auto or manual)
# 5. For Kindle: Re-upload EPUB to KDP
```

---

## Publishing Strategies

### Strategy 1: Free First (Recommended)
1. ✅ **Website** - Get it out there immediately
2. Later: Add Leanpub for PDF/EPUB downloads
3. Later: Add Kindle for maximum reach

### Strategy 2: All Three Platforms
- **Website**: Free access, always current
- **Leanpub**: Premium PDF/EPUB, early updates (80% royalty)
- **Amazon**: Maximum distribution (35-70% royalty)

### Strategy 3: Free Forever
- Just use the **Website** - no setup, instant sharing, always free

---

## File Overview

```
├── build/                      # Generated books
│   ├── VID-Methodology.pdf     # → Share or print
│   ├── VID-Methodology.epub    # → Upload to Amazon KDP
│   └── VID-Complete.md         # → Combined source
│
├── manuscript/                 # → Upload to Leanpub
│   ├── Book.txt                # Full book structure
│   ├── Sample.txt              # Free preview
│   ├── Subset.txt              # Dev testing
│   └── *.md                    # All chapters
│
├── docs/                       # → Deploy as website
│   ├── index.html              # Docsify config
│   ├── _sidebar.md             # Navigation
│   └── chapters/*.md           # All chapters
│
└── chapters/                   # Source of truth
    └── *.md                    # Edit these files
```

---

## Need Help?

- **Website deployment**: See [WEBSITE.md](technical/WEBSITE.md)
- **Complete publishing guide**: See [PUBLISHING.md](technical/PUBLISHING.md)
- **Leanpub structure**: See [manuscript/README.md](manuscript/README.md)

---

## What's Next?

**Must do:**
1. ✅ Run `./build-book.sh`
2. ✅ Deploy website (5 minutes)
3. ✅ Share the URL

**Optional:**
- [ ] Create cover image (1600x2560px) → save as `cover.png`
- [ ] Set up Leanpub
- [ ] Set up Amazon KDP
- [ ] Add custom domain to website
- [ ] Set up Google Analytics

---

**Your book can be live on the web in under 5 minutes!** 🚀

Start with the website, add other platforms later as needed.
