# Publishing Guide for VID Book

This guide covers how to publish "Verified Intent Development" on Leanpub, Amazon Kindle, and as a free website.

## Quick Start

1. **Build the book**: `./build-book.sh`
2. **Choose your platform**: Website (free), Leanpub, Amazon KDP, or all three
3. **Follow the platform-specific instructions** below

## Generated Files

After running `./build-book.sh`, you'll have:

```
build/
├── VID-Methodology.pdf    # PDF version (313 KB)
├── VID-Methodology.epub   # EPUB for Kindle/readers (91 KB)
└── VID-Complete.md        # Combined markdown source

manuscript/
├── Book.txt               # Full book (28 chapters)
├── Sample.txt             # Free preview (4 chapters)
├── Subset.txt             # Dev preview (2 chapters)
├── resources/             # Assets folder
├── README.md              # Publishing guide
└── *.md                   # All chapter files

docs/
├── index.html             # Website configuration
├── README.md              # Homepage
├── _sidebar.md            # Navigation
└── chapters/              # All 28 chapter files
```

## Platform 1: Website (Free & Recommended)

**Docsify-powered website** - No build process, works directly with markdown files.

### Quick Preview

```bash
npx serve docs
# Or: python3 -m http.server 3000 --directory docs
```

Then open http://localhost:3000

### Deploy (Choose One)

**GitHub Pages** (Easiest, Free):
1. Push to GitHub: `git push origin master`
2. Go to Settings → Pages
3. Select branch `master`, folder `/docs`
4. Your book is live at `https://yourusername.github.io/repo-name/`

**Netlify** (Fastest):
1. Drag `docs/` folder to https://app.netlify.com/drop
2. Instantly live!

See [WEBSITE.md](technical/WEBSITE.md) for complete deployment guide with Vercel, Cloudflare Pages, and custom domains.

### Advantages
- ✅ **Free hosting** (GitHub Pages, Netlify, Vercel, Cloudflare)
- ✅ **Automatic updates** when you push changes
- ✅ **Built-in search** and navigation
- ✅ **Mobile-friendly** responsive design
- ✅ **No build process** needed
- ✅ **Shareable link** for immediate access

## Platform 2: Leanpub

### Setup (One Time)

1. Create account at https://leanpub.com
2. Click "Create a Book"
3. Choose writing mode:
   - **Dropbox**: Easier for beginners
   - **GitHub**: Better for version control

### Option A: Dropbox Writing Mode

1. Select "Dropbox" during book creation
2. Authorize Leanpub to access your Dropbox
3. Leanpub creates a folder: `Dropbox/Apps/Leanpub/your-book-name/`
4. Copy all files from `manuscript/` to that folder
5. Go to your Leanpub book dashboard
6. Click "Create Preview" to generate your book

### Option B: GitHub Writing Mode

1. Select "GitHub" during book creation
2. Authorize Leanpub to access this repository
3. Configure these settings:
   - **Repository**: This repo
   - **Branch**: `master` (or your publishing branch)
   - **Manuscript folder**: `manuscript`
4. Click "Create Preview" to generate your book

### Leanpub Preview Options

- **Subset Preview**: Uses `Subset.txt` (2 chapters) - fastest, for testing
- **Sample Preview**: Uses `Sample.txt` (4 chapters) - for sample generation
- **Full Preview**: Uses `Book.txt` (28 chapters) - complete book

### Publishing on Leanpub

1. Generate a successful preview
2. Set your pricing (minimum $0 for free, Leanpub suggests $9.99+)
3. Write your book description
4. Add author bio
5. Upload cover image (1600x2560px recommended)
6. Click "Publish" - your book goes live immediately!

### Book Sample (Free Preview)

The `Sample.txt` file controls what readers get in the free sample:
- Currently includes: Preface + first 3 chapters
- Readers download this before buying
- Update `Sample.txt` to change what's included

## Platform 3: Amazon Kindle (KDP)

### Setup (One Time)

1. Create account at https://kdp.amazon.com
2. Complete tax information (required for royalties)
3. Set up payment method

### Publishing to KDP

1. Click "Create New Kindle eBook"
2. **Enter Kindle eBook Details**:
   - Title: "Verified Intent Development"
   - Subtitle: "A Methodology for the Age of AI-Augmented Software Development"
   - Author: "SEMCL.ONE Community"
   - Description: (write compelling description)
   - Publishing Rights: You own the copyright
   - Keywords: software development, AI, methodology, etc.
   - Categories: Select 2 relevant categories

3. **Upload eBook Content**:
   - Upload `build/VID-Methodology.epub`
   - Amazon converts EPUB to Kindle format automatically
   - Preview the converted book using Kindle Previewer

4. **Set Pricing & Distribution**:
   - Select territories (Worldwide recommended)
   - Choose royalty option (35% or 70%)
   - Set price (minimum $2.99 for 70% royalty)
   - Enable Kindle Unlimited (optional)

5. **Publish**:
   - Review all information
   - Click "Publish Your Kindle eBook"
   - Book goes live within 72 hours

### KDP Notes

- **No MOBI needed**: EPUB is the standard (MOBI deprecated Feb 2025)
- **Cover required**: Upload a 1600x2560px cover during setup
- **Preview first**: Use Amazon's previewer before publishing
- **Updates**: You can publish new versions anytime

## Multi-Platform Strategy

You can publish on **all three platforms** simultaneously!

### Recommended Approach

1. **Website (Free)**: Primary distribution, always up-to-date
2. **Leanpub**: For readers who want PDF/EPUB, living book with frequent updates
3. **Amazon Kindle**: For maximum reach and Kindle users

### Platform Comparison

| Feature | Website | Leanpub | Amazon KDP |
|---------|---------|---------|------------|
| **Cost** | Free | Free to publish | Free to publish |
| **Royalties** | N/A | 80% | 35-70% |
| **Updates** | Instant (git push) | Manual/Auto | Manual upload |
| **Formats** | Web | PDF, EPUB, MOBI | Kindle (from EPUB) |
| **Distribution** | Global (instant) | Direct to readers | Amazon ecosystem |
| **Discoverability** | SEO + sharing | Leanpub marketplace | Amazon search |

### Update Workflow

When you update chapters:

1. Edit markdown files in `chapters/`
2. Run `./build-book.sh`
3. **Website**: Push to GitHub → auto-deploys (instant)
4. **Leanpub**: Auto-sync (GitHub mode) or copy to Dropbox → generate preview
5. **Amazon**: Upload new EPUB through KDP dashboard (24-72hr review)

## Cover Image Requirements

Both platforms need a cover image:

### Specifications
- **Size**: 1600 x 2560 pixels (ratio 1:1.6)
- **Format**: PNG or JPEG
- **Color**: RGB color mode
- **Content**: Title, subtitle, author, relevant imagery

### Where to Place It
- Save as `cover.png` in the project root
- Build script will automatically include it
- Upload separately to Leanpub/KDP dashboards

### Design Options
- Design yourself (Canva, Photoshop, etc.)
- Hire on Fiverr/99designs ($5-$200)
- Use Leanpub's built-in cover generator (basic)

## License Considerations

This book uses **CC BY-SA 4.0** license:
- ✅ Commercial use allowed
- ✅ Can sell on Leanpub and Amazon
- ✅ Readers can share/remix with attribution
- ℹ️ Consider mentioning license in book description

## Marketing Your Book

### On Leanpub
- Share your Leanpub landing page
- Use "Variable pricing" to let readers pay what they want
- Offer free sample to build interest
- Build email list of readers for updates

### On Amazon
- Optimize keywords for discoverability
- Encourage reviews (critical for ranking)
- Run promotions (countdown deals, free days if in KDP Select)
- Use Amazon Author Central for author page

### Both Platforms
- Blog about the methodology
- Share on social media
- Engage with developer communities
- Present at conferences/meetups

## Revenue & Royalties

### Leanpub
- **80% royalty** on all sales
- Variable pricing: reader chooses price
- No minimum price requirement
- Pay out monthly via PayPal

### Amazon KDP
- **70% royalty**: $2.99-$9.99 price range, certain territories
- **35% royalty**: All other prices and territories
- Paid 60 days after month end
- Distribution to global Kindle stores

## Updating Your Book

### Minor Updates (typos, small fixes)
1. Edit markdown chapters
2. Run `./build-book.sh`
3. Publish updated version

### Major Updates (new chapters, rewrites)
1. Consider version numbers (v2.0, v2.1, etc.)
2. Update copyright year/version in metadata
3. Notify existing readers of major changes
4. Leanpub: readers get free updates automatically
5. Amazon: readers can re-download updated version

## Analytics & Tracking

### Leanpub
- Dashboard shows: sales, readers, completion rate
- Geographic distribution
- Sample downloads vs purchases
- Reader feedback and reviews

### Amazon KDP
- Sales reports (daily, monthly)
- Kindle Unlimited page reads
- Geographic sales data
- Review ratings and count

## Support Resources

### Leanpub
- Help Center: https://help.leanpub.com
- Manual: https://leanpub.com/help/manual
- Contact: hello@leanpub.com

### Amazon KDP
- KDP Help: https://kdp.amazon.com/help
- Community Forums: https://kdp.amazon.com/community
- Contact: Through KDP dashboard

## Next Steps

1. ✅ Run `./build-book.sh` to ensure all files are generated
2. ☐ Create cover image (1600x2560px)
3. ☐ Write compelling book description
4. ☐ Choose platform(s): Leanpub, Amazon, or both
5. ☐ Set up account on chosen platform(s)
6. ☐ Upload manuscript and metadata
7. ☐ Generate preview and review
8. ☐ Publish!
9. ☐ Market your book
10. ☐ Iterate based on reader feedback

---

**Good luck with your publishing journey!** 🚀

For technical issues with the build script, see the main README.md
For manuscript structure questions, see manuscript/README.md
