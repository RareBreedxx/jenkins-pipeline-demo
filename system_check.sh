#!/bin/bash

echo "Running system check..." > system_check.log

echo "Hostname: $(hostname)" >> system_check.log
echo "Date: $(date)" >> system_check.log

# CPU Load
CPU_LOAD=$(uptime | awk -F 'load average:' '{ print $2 }' | cut -d',' -f1)
echo "CPU Load: $CPU_LOAD" >> system_check.log

echo "System check complete!"
