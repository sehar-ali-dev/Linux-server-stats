#!/bin/bash

echo "========================================="
echo "         SERVER PERFORMANCE STATS        "
echo "========================================="

# 1. Total CPU Usage
echo -e "\n--- Total CPU Usage ---"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'

# 2. Total Memory Usage (Free vs Used including percentage)
echo -e "\n--- Memory Usage ---"
free -m | awk 'NR==2{printf "Used: %sMB | Free: %sMB | Total: %sMB (%.2f%%)\n", $3, $4, $2, $3*100/$2 }'

# 3. Total Disk Usage (Free vs Used including percentage)
echo -e "\n--- Disk Usage ---"
df -h --total | grep 'total' | awk '{printf "Used: %s | Free: %s | Total: %s (%s)\n", $3, $4, $2, $5}'

# 4. Top 5 Processes by CPU Usage
echo -e "\n--- Top 5 Processes by CPU Usage ---"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# 5. Top 5 Processes by Memory Usage
echo -e "\n--- Top 5 Processes by Memory Usage ---"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo -e "\n========================================="
