#!/usr/bin/env bash
# Builds the LandingScreen animation and copies its output into landing/,
# which index.html embeds in an iframe.
#
# By default this clones github.com/dggrunzweig/LandingScreen at its latest
# commit. Set LANDING_SRC to build from a local checkout instead:
#   LANDING_SRC=../LandingScreen npm run sync:landing
set -euo pipefail

SITE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$SITE_DIR/landing"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

if [[ -n "${LANDING_SRC:-}" ]]; then
  echo "Copying LandingScreen from $LANDING_SRC"
  rsync -a --exclude node_modules --exclude dist --exclude .git "$LANDING_SRC/" "$WORK/src/"
else
  echo "Cloning dggrunzweig/LandingScreen"
  git clone --quiet --depth 1 https://github.com/dggrunzweig/LandingScreen.git "$WORK/src"
fi

cd "$WORK/src"
npm ci --silent
npm run build

rm -rf "$DEST"
cp -R dist "$DEST"
echo "Updated $DEST"
