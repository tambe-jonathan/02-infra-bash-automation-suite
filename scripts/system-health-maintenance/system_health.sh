#!/bin/bash

echo "=== SYSTEM HEALTH CHECK ==="
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "---------------------------"

echo "[CPU LOAD]"
uptime

echo "[MEMORY USAGE]"
free -h

echo "[DISK USAGE]"
df -h

echo "[TOP 5 PROCESSES]"
ps aux --sort=-%cpu | head -n 6

