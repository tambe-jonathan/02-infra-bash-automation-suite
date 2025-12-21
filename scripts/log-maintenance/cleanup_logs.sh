#!/bin/bash
LOG_DIR="/var/log"
DAYS=3

echo "[INFO] Cleaning logs older than $DAYS days in $LOG_DIR"
sudo find "$LOG_DIR" -type f -mtime +"$DAYS" -exec rm -f {} \;
echo "[SUCCESS] Log cleanup completed"

