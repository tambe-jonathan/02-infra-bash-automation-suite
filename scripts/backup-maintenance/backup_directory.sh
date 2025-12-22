#!/bin/bash

SOURCE=$1
DEST="/backup"
DATE=$(date +%F)

if [ -z "$SOURCE" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

mkdir -p "$DEST"
tar -czf "$DEST/backup-$DATE.tar.gz" "$SOURCE"
echo "[SUCCESS] Backup created at $DEST/backup-$DATE.tar.gz"

