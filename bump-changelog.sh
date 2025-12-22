#!/bin/bash
# bump-changelog.sh
# Automatically bumps the version in CHANGE.md and moves [Unreleased] changes to a new version section
# Usage: ./bump-changelog.sh <new-version>
# Example: ./bump-changelog.sh 1.1.0

set -euo pipefail

CHANGELOG="CHANGE.md"

if [ $# -ne 1 ]; then
  echo "Usage: $0 <new-version>"
  exit 1
fi

NEW_VERSION=$1
DATE=$(date +%Y-%m-%d)

# Check if CHANGE.md exists
if [ ! -f "$CHANGELOG" ]; then
  echo "Error: $CHANGELOG not found in current directory"
  exit 1
fi

# Ensure [Unreleased] exists
if ! grep -q "\[Unreleased\]" "$CHANGELOG"; then
  echo "Error: [Unreleased] section not found in $CHANGELOG"
  exit 1
fi

# Insert new version header after [Unreleased]
# This uses awk to preserve formatting
awk -v version="$NEW_VERSION" -v date="$DATE" '
  BEGIN { unreleased_found=0 }
  {
    print $0
    if ($0 ~ /\[Unreleased\]/ && unreleased_found==0) {
      print ""
      print "## [" version "] - " date
      unreleased_found=1
    }
  }
' "$CHANGELOG" > "$CHANGELOG.tmp"

mv "$CHANGELOG.tmp" "$CHANGELOG"

echo "[SUCCESS] Bumped CHANGE.md to version $NEW_VERSION on $DATE"
echo "Remember to edit the new section with release-specific details and remove [Unreleased] content if needed."

