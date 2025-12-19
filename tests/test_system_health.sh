#!/bin/bash

OUTPUT=$(../scripts/system_health.sh)

echo "$OUTPUT" | grep -q "SYSTEM HEALTH CHECK" || exit 1
echo "$OUTPUT" | grep -q "CPU LOAD" || exit 1
echo "$OUTPUT" | grep -q "MEMORY USAGE" || exit 1
echo "$OUTPUT" | grep -q "DISK USAGE" || exit 1

echo "All tests passed "

