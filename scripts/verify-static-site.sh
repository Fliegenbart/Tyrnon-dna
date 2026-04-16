#!/bin/sh
set -eu

test -f index.html
test -f styles.css
test -f script.js

grep -q 'href="styles.css"' index.html
grep -q 'src="script.js"' index.html
grep -q 'name="description"' index.html
grep -q 'Wir sind TYRN.ON.' index.html
grep -q 'Wir verzetteln uns nicht.' index.html
grep -q 'Kunden-Call' index.html
grep -q 'Wir kennen Approval-Prozesse und Vibe-Coding.' index.html
grep -q 'prefers-reduced-motion: reduce' styles.css
