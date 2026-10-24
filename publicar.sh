#!/bin/sh
# Publica o site: coincubo.com (GitHub Pages, branch gh-pages = pasta public/) e o Worker de reserva.
set -e
cd "$(dirname "$0")"
git push -q origin main
git push -qf origin "$(git subtree split --prefix public main)":refs/heads/gh-pages
npx wrangler deploy >/dev/null && echo "Publicado em https://coincubo.com"
