# Tyrnon DNA Refactor Design

## Ziel

Die bestehende Landingpage soll technisch aufgeräumt werden, ohne ihren visuellen Charakter zu verlieren. Der Code soll fuer einen Einsteiger leichter lesbar sein und sich einfacher erweitern lassen.

## Geplante Struktur

- `index.html` behaelt nur die Seitenstruktur und die Inhalte.
- `styles.css` enthaelt das gesamte Styling inklusive kleiner Verbesserungen fuer Barrierefreiheit und Responsiveness.
- `script.js` enthaelt die Scroll- und Sichtbarkeitslogik.
- `scripts/verify-static-site.sh` prueft die neue Grundstruktur automatisiert.

## Wichtige Entscheidungen

1. Das Design bleibt bewusst sehr nah am aktuellen Stand.
2. Es werden nur kleine inhaltliche und technische Verbesserungen vorgenommen:
   - Meta Description im Head
   - Ruecksicht auf Nutzer mit reduzierter Bewegungs-Praeferenz
   - defensiveres JavaScript fuer Scroll-Status
3. Es wird kein Framework eingefuehrt, damit das Projekt einfach bleibt.

## Erfolgskriterien

- Die Seite sieht nach dem Umbau weiterhin wie vorher aus.
- HTML, CSS und JavaScript sind getrennt.
- Die einfache Pruefroutine ist gruen.
- Die Seite laedt lokal im Browser ohne Fehler.
