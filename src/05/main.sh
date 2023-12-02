#!/bin/bash

source ./validation.sh

time_start=$(date +%s.%N)
validation $@
if [ $? -eq 1 ]; then
  exit 1
else
  source ./sys_info.sh 
  print_report $1
  echo "Script execution time (in seconds) = $(echo "$(date +%s.%N) $time_start" | awk '{printf "%.2f", $1 - $2}')"
fi