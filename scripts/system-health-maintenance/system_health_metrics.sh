#!/bin/bash

CPU_LOAD=$(uptime | awk -F'load average:' '{print $2}' | cut -d, -f1)
MEM_USED=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')
DISK_USED=$(df / | awk 'END{print $5}' | tr -d '%')

cat <<EOF
# HELP system_cpu_load CPU load average
# TYPE system_cpu_load gauge
system_cpu_load $CPU_LOAD

# HELP system_memory_usage Memory usage percentage
# TYPE system_memory_usage gauge
system_memory_usage $MEM_USED

# HELP system_disk_usage Disk usage percentage
# TYPE system_disk_usage gauge
system_disk_usage $DISK_USED
EOF

