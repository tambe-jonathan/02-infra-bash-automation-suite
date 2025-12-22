#!/bin/bash

# 1. Get the absolute path of the directory where THIS test script is located
TEST_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# 2. Define the path to the actual script relative to this test file
# Note: Ensure the folder name (system-health-maintenance) matches your GitHub exactly!
TARGET_SCRIPT="$TEST_DIR/../scripts/system-health-maintenance/system_health.sh"

# 3. Execute the script using the absolute path
OUTPUT=$("$TARGET_SCRIPT")

echo "$OUTPUT" | grep -q "SYSTEM HEALTH CHECK" || { echo "Failed: SYSTEM HEALTH CHECK not found"; exit 1; }
echo "$OUTPUT" | grep -q "CPU LOAD" || { echo "Failed: CPU LOAD not found"; exit 1; }
echo "$OUTPUT" | grep -q "MEMORY USAGE" || { echo "Failed: MEMORY USAGE not found"; exit 1; }
echo "$OUTPUT" | grep -q "DISK USAGE" || { echo "Failed: DISK USAGE not found"; exit 1; }

echo "All tests passed"
