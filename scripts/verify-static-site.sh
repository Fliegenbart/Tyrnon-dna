#!/bin/sh
set -eu

test -f index.html
test -f styles.css
test -f script.js

grep -q 'href="styles.css"' index.html
grep -q 'src="script.js"' index.html
grep -q 'name="description"' index.html
grep -q 'prefers-reduced-motion: reduce' styles.css
