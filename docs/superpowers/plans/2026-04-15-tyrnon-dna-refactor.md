# Tyrnon DNA Refactor Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Die bestehende Landingpage in einfache, getrennte Dateien aufteilen und dabei die bestehende Wirkung erhalten.

**Architecture:** Die HTML-Datei wird auf Struktur und Inhalte reduziert. Styling und Interaktion wandern in eigene Dateien. Eine kleine Shell-Pruefung stellt sicher, dass die neue Grundstruktur und die wichtigsten Verbesserungen vorhanden sind.

**Tech Stack:** HTML, CSS, JavaScript, POSIX-Shell

---

### Task 1: Struktur absichern

**Files:**
- Create: `scripts/verify-static-site.sh`
- Modify: `index.html`

- [ ] **Step 1: Write the failing test**

```sh
#!/bin/sh
set -eu

test -f index.html
test -f styles.css
test -f script.js
grep -q 'href="styles.css"' index.html
grep -q 'src="script.js"' index.html
```

- [ ] **Step 2: Run test to verify it fails**

Run: `sh scripts/verify-static-site.sh`
Expected: FAIL because `styles.css` and `script.js` do not exist yet.

- [ ] **Step 3: Wire the new file references into `index.html`**

```html
<link rel="stylesheet" href="styles.css">
...
<script src="script.js"></script>
```

- [ ] **Step 4: Run test to verify it passes**

Run: `sh scripts/verify-static-site.sh`
Expected: PASS with exit code `0`.

### Task 2: Styling auslagern

**Files:**
- Create: `styles.css`
- Modify: `index.html`

- [ ] **Step 1: Move the inline `<style>` block into `styles.css`**

```css
:root {
  --black: #0a0a0a;
  --white: #f0f0ec;
}
```

- [ ] **Step 2: Add small quality improvements**

```css
@media (prefers-reduced-motion: reduce) {
  html {
    scroll-behavior: auto;
  }
}
```

- [ ] **Step 3: Keep `index.html` focused on content**

```html
<head>
  ...
  <link rel="stylesheet" href="styles.css">
</head>
```

- [ ] **Step 4: Re-run the structure test**

Run: `sh scripts/verify-static-site.sh`
Expected: PASS with exit code `0`.

### Task 3: JavaScript auslagern und robuster machen

**Files:**
- Create: `script.js`
- Modify: `index.html`

- [ ] **Step 1: Move the inline script into `script.js`**

```js
const dots = document.querySelectorAll('.circuit-dot');
```

- [ ] **Step 2: Make the scroll logic more defensive**

```js
const maxScroll = Math.max(document.documentElement.scrollHeight - window.innerHeight, 1);
const scrollProgress = window.scrollY / maxScroll;
```

- [ ] **Step 3: Keep first-load behavior explicit**

```js
if (dots[0]) {
  dots[0].classList.add('active');
}
```

- [ ] **Step 4: Re-run the structure test**

Run: `sh scripts/verify-static-site.sh`
Expected: PASS with exit code `0`.

### Task 4: Lokale Verifikation und Veroeffentlichung

**Files:**
- Modify: `index.html`
- Modify: `styles.css`
- Modify: `script.js`

- [ ] **Step 1: Start a local static server**

```bash
python3 -m http.server 4173
```

- [ ] **Step 2: Check the page in the browser**

Run: open `http://127.0.0.1:4173`
Expected: Layout intact, animations visible, no obvious breakage.

- [ ] **Step 3: Verify the structure test once more**

Run: `sh scripts/verify-static-site.sh`
Expected: PASS with exit code `0`.

- [ ] **Step 4: Initialize git, push, and deploy**

```bash
git init
git remote add origin git@github.com:Fliegenbart/Tyrnon-dna.git
git add .
git commit -m "Refactor landing page structure"
git branch -M main
git push -u origin main
vercel deploy -y
```
