# Website Deployment Guide

The VID book is available as a website using **Docsify** - a lightweight documentation site generator that works directly with your markdown files.

## What is Docsify?

Docsify generates your documentation website **on the fly**. Unlike static site generators that build HTML files, Docsify:
- Loads markdown files dynamically in the browser
- Requires no build process
- Is super lightweight (~21kB gzipped)
- Works with pure markdown files
- Includes search, navigation, and syntax highlighting out of the box

## Quick Start - Local Preview

To preview the website locally, you have several options:

### Option 1: Using npx (Recommended)
```bash
npx serve docs
```
Then open http://localhost:3000

### Option 2: Using Python
```bash
python3 -m http.server 3000 --directory docs
```
Then open http://localhost:3000

### Option 3: Using Node's http-server
```bash
npx http-server docs -p 3000
```
Then open http://localhost:3000

### Option 4: Using PHP
```bash
cd docs && php -S localhost:3000
```
Then open http://localhost:3000

## Structure

The `docs/` folder contains:

```
docs/
├── index.html         # Main HTML file (Docsify configuration)
├── README.md          # Home page content
├── _sidebar.md        # Navigation sidebar
└── chapters/          # All book chapters (28 files)
    ├── 00-preface.md
    ├── 01-the-inversion.md
    └── ...
```

## Deployment Options

### Option 1: GitHub Pages (Free, Easiest)

**Steps:**

1. **Push to GitHub** (if not already done):
   ```bash
   git add docs/
   git commit -m "Add website files"
   git push origin master
   ```

2. **Enable GitHub Pages**:
   - Go to your repository on GitHub
   - Click **Settings** → **Pages**
   - Under **Source**, select:
     - Branch: `master` (or `main`)
     - Folder: `/docs`
   - Click **Save**

3. **Access your site**:
   - Your site will be live at: `https://yourusername.github.io/verified-intent-development/`
   - Wait 1-2 minutes for initial deployment

**Advantages:**
- ✅ Free hosting
- ✅ Automatic updates when you push changes
- ✅ Custom domain support
- ✅ HTTPS included
- ✅ No build process needed

### Option 2: Netlify (Free, Fast)

**Steps:**

1. **Drag & Drop Method**:
   - Go to https://app.netlify.com/drop
   - Drag the `docs/` folder onto the page
   - Your site is live instantly!
   - Get a random URL like `random-name-123.netlify.app`

2. **GitHub Integration** (Recommended):
   - Sign up at https://netlify.com
   - Click **Add new site** → **Import from Git**
   - Connect your GitHub repository
   - Configure:
     - **Branch**: `master`
     - **Publish directory**: `docs`
     - Leave **Build command** empty (no build needed!)
   - Click **Deploy site**

3. **Custom domain** (optional):
   - Site settings → Domain management
   - Add your custom domain

**Advantages:**
- ✅ Free tier is generous
- ✅ Instant deploys (faster than GitHub Pages)
- ✅ Deploy previews for pull requests
- ✅ Easy custom domains
- ✅ Form handling and serverless functions available

### Option 3: Vercel (Free, Fast)

**Steps:**

1. Sign up at https://vercel.com
2. Click **Add New** → **Project**
3. Import your GitHub repository
4. Configure:
   - **Framework Preset**: Other
   - **Root Directory**: `docs`
   - **Build Command**: (leave empty)
   - **Output Directory**: (leave empty)
5. Click **Deploy**

**Advantages:**
- ✅ Free tier is generous
- ✅ Excellent performance
- ✅ Automatic deployments
- ✅ Preview deployments for PRs
- ✅ Easy custom domains

### Option 4: Cloudflare Pages (Free, Fast)

**Steps:**

1. Sign up at https://pages.cloudflare.com
2. Click **Create a project**
3. Connect your GitHub repository
4. Configure:
   - **Production branch**: `master`
   - **Build command**: (leave empty)
   - **Build output directory**: `docs`
5. Click **Save and Deploy**

**Advantages:**
- ✅ Free unlimited bandwidth
- ✅ Cloudflare's global CDN
- ✅ DDoS protection
- ✅ Automatic deployments
- ✅ Web Analytics included

### Option 5: Custom Server

If you have your own server:

1. **Copy files to your server**:
   ```bash
   rsync -avz docs/ user@yourserver.com:/var/www/html/vid/
   ```

2. **Configure your web server** (nginx example):
   ```nginx
   server {
       listen 80;
       server_name yourdomain.com;
       root /var/www/html/vid;
       index index.html;

       location / {
           try_files $uri $uri/ /index.html;
       }
   }
   ```

3. **Enable HTTPS** (recommended):
   ```bash
   sudo certbot --nginx -d yourdomain.com
   ```

## Custom Domain Setup

### For GitHub Pages:
1. Add `CNAME` file to `docs/` folder:
   ```bash
   echo "book.yourdomain.com" > docs/CNAME
   ```
2. Configure DNS:
   - Add CNAME record: `book` → `yourusername.github.io`

### For Netlify/Vercel/Cloudflare:
1. Go to domain settings in platform dashboard
2. Add your custom domain
3. Update DNS records as instructed
4. Wait for DNS propagation (5 minutes - 24 hours)

## Updating the Website

After making changes to chapters:

1. **Update source files**:
   ```bash
   # Edit your chapter files in chapters/
   vim chapters/01-the-inversion.md
   ```

2. **Rebuild** (this updates docs/):
   ```bash
   ./build-book.sh
   ```

3. **Commit and push**:
   ```bash
   git add chapters/ docs/
   git commit -m "Update chapter 1"
   git push
   ```

4. **Automatic deployment**:
   - GitHub Pages: Redeploys automatically (1-2 min)
   - Netlify/Vercel/Cloudflare: Redeploys automatically (30 sec - 1 min)
   - Manual server: Re-run rsync command

## Customization

### Change Theme Color

Edit `docs/index.html`:
```css
:root {
  --theme-color: #2c3e50;  /* Change this color */
}
```

### Add Google Analytics

Edit `docs/index.html`, add to `window.$docsify`:
```javascript
ga: 'UA-XXXXXXXX-X',  // Your Google Analytics ID
```

Then uncomment the GA plugin at the bottom of `index.html`.

### Customize Navigation

Edit `docs/_sidebar.md` to change the sidebar structure.

### Add Images

1. Create `docs/images/` folder
2. Add images there
3. Reference in markdown: `![Alt text](images/your-image.png)`

### Change Homepage

Edit `docs/README.md` - this is your landing page.

## SEO Optimization

### Add Meta Tags

Edit `docs/index.html` to add more meta tags:
```html
<meta property="og:title" content="Verified Intent Development">
<meta property="og:description" content="A methodology for AI-augmented software development">
<meta property="og:image" content="https://yoursite.com/cover.png">
<meta name="twitter:card" content="summary_large_image">
```

### Add Sitemap

For better SEO, add a sitemap to `docs/sitemap.xml`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://yoursite.com/</loc>
    <priority>1.0</priority>
  </url>
  <!-- Add more URLs for each chapter -->
</urlset>
```

### robots.txt

Add `docs/robots.txt`:
```
User-agent: *
Allow: /
Sitemap: https://yoursite.com/sitemap.xml
```

## Performance Tips

1. **CDN**: All platforms mentioned use CDN by default
2. **Images**: Optimize images before adding (use ImageOptim, TinyPNG)
3. **Caching**: Docsify files are cached automatically by browsers
4. **Lazy Loading**: Docsify loads chapters on-demand

## Troubleshooting

### Issue: 404 errors when navigating
**Solution**: Make sure your web server serves `index.html` for all routes.

### Issue: Sidebar not showing
**Solution**: Check that `_sidebar.md` exists and `loadSidebar: true` is in `index.html`.

### Issue: Search not working
**Solution**: Ensure search plugin is loaded in `index.html`.

### Issue: Styles broken
**Solution**: Check browser console for CDN loading errors. May need to self-host docsify files.

## Advanced: Self-Hosting Docsify Assets

If you want to avoid CDN dependencies:

1. Download Docsify files:
   ```bash
   mkdir -p docs/vendor
   cd docs/vendor
   wget https://cdn.jsdelivr.net/npm/docsify@4/lib/docsify.min.js
   wget https://cdn.jsdelivr.net/npm/docsify@4/lib/themes/vue.css
   # Download other plugins similarly
   ```

2. Update `docs/index.html` to reference local files:
   ```html
   <link rel="stylesheet" href="vendor/vue.css">
   <script src="vendor/docsify.min.js"></script>
   ```

## Recommended Deployment

**For public book**: GitHub Pages (free, easy, trusted)
**For professional site**: Netlify or Vercel (faster, more features)
**For maximum control**: Cloudflare Pages (great performance, unlimited bandwidth)

## Next Steps

1. Choose a deployment platform
2. Deploy your site (takes 5-10 minutes)
3. Share the URL with readers
4. Consider adding a custom domain
5. Set up analytics to track readership
6. Keep chapters updated - deployment is automatic!

---

**Your book website will be live and shareable in minutes!** 🚀
