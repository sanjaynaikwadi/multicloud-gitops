#!/bin/bash
set -e

TARGET="/etc/multipath.conf"
SOURCE="/usr/local/share/multipath.conf.desired"

echo "[multipath-merge] TARGET: $TARGET"
echo "[multipath-merge] SOURCE: $SOURCE"

if [ ! -f "$SOURCE" ]; then
  echo "[multipath-merge] Source file $SOURCE not found, exiting"
  exit 1
fi

# If target does not exist, just copy it
if [ ! -f "$TARGET" ]; then
  echo "[multipath-merge] $TARGET not found, creating from $SOURCE"
  cp "$SOURCE" "$TARGET"
  exit 0
fi

# Append only lines from SOURCE that are not already in TARGET (exact line match)
tmpfile=$(mktemp)
grep -Fvx -f "$TARGET" "$SOURCE" > "$tmpfile" || true

if [ -s "$tmpfile" ]; then
  echo "[multipath-merge] Appending new lines to $TARGET"
  cat "$tmpfile" >> "$TARGET"
else
  echo "[multipath-merge] No new lines to append"
fi

rm -f "$tmpfile"
exit 0

