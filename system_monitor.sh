#!/bin/bash
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

#check CPU usage 

echo "CPU Usage: $CPU_USAGE"

if (( $(echo "$CPU_USAGE > 75" | bc -l) )); then
    echo "WARNING: CPU usage is criticlly high!"
elif (( $(echo "$CPU_USAGE >= 50" | bc -l) )); then
    echo "CPU usage is moderate."
else 
    echo "CPU usage is normal."

fi

#check Memory usage 

SCALE=3
USED_MEMORY=$(free | awk '/Mem/ {print $3}')
TOTAL_MEMORY=$(free | awk '/Mem/ {print $2}')
MEMORY_USAGE=$(echo "scale=$SCALE; ($USED_MEMORY / $TOTAL_MEMORY) * 100" | bc -l)

echo "USED_MEMORY: $USED_MEMORY"
echo "TOTAL_MEMORY: $TOTAL_MEMORY"
echo "MEMORY_USAGE: $MEMORY_USAGE"

if (( $(echo "$MEMORY_USAGE > 75" | bc -l) )); then
    echo "WARNING: Memory usage is high!"
else
    echo "Memory usage is under control."
fi

#check Disk usage

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | cut -d% -f1)

echo "Disk Usage: $DISK_USAGE%"

if [ "DISK_USAGE" > 85 ]; then
    echo "CRITICAL: Disk almost full!"
elif [ "DISK_USAGE" >= 60 ]; then
    echo "Disk usage is getting high."
else
    echo "Disk usage is healthy."
fi

# to check system status 

if [ "$CPU_USAGE" > 80 ] | [ "$MEMORY_USAGE" > 75 ] | [ "$DISK_USAGE" > 85 ]; then
    echo "SYSTEM STATUS: CRITICAL"
else
    echo "SYSTEM STATUS: STABLE"
fi
