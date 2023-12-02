#!/bin/bash

path=$1
total_folders=$(ls -R -r -l $path 2>/dev/null | grep ^d | wc -l)
top_size_folders=$(du -h $path 2>/dev/null | head -n -1 | sort -hr | head -5 | awk '{print "-",$2",", $1"B"}' | nl -w1 -s' ')
total_files=$(find $path -type f 2>/dev/null | wc -l)
total_configuration_files=$(find $path -name "*.conf" 2>/dev/null | wc -l)
total_text_files=$(find $path -name "*.txt" 2>/dev/null | wc -l)
total_executable_files=$(find $path -type f -executable 2>/dev/null | wc -l)
total_log_files=$(find $path -name "*.log" 2>/dev/null | wc -l)
total_archive_files=$(find $path -name '*.tar' -o -name '*.zip' -o -name '*.7z' -o -name '*.rar' -o -name '*.gz'  2> /dev/null | wc -l)
total_symbolic_links=$(find $path -type l  2>/dev/null | wc -l)

total_top_files_name=$(find $path -type f -exec du -h {} + 2>/dev/null | sort -hr | head -10 | awk '{print $2}')
total_top_files_size=$(find $path -type f -exec du -h {} + 2>/dev/null | sort -hr | head -10 | awk '{print $1}')
total_top_files_type=$(find $path -type f -exec du -h {} + 2>/dev/null | sort -hr | head -10 | awk 'BEGIN{FS=OFS="."} {print $NF}')

total_top_executable_name=$(find $path -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $2}')
total_top_executable_size=$(find $path -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $1}')
