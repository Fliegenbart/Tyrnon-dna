#!/bin/sh
set -eu

test -f index.html
test -f styles.css
test -f script.js

grep -q 'href="styles.css"' index.html
grep -q 'src="script.js"' index.html
grep -q 'name="description"' index.html
grep -q 'TYRN.ON. Das ist kein Zufall.' index.html
grep -q 'Drei Tage Code schlagen drei Wochen Konzept.' index.html
grep -q 'Heute PPTX-to-PDF/UA mit lokalen Qwen-Modellen.' index.html
grep -q 'Wer bei uns arbeitet, erkennt man daran:' index.html
grep -q 'Das ist kein Tagline-Spruch.' index.html
grep -q 'prefers-reduced-motion: reduce' styles.css
