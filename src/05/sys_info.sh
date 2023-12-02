#!/bin/bash

source ./variables.sh

print_report () {
  echo "Total number of folders (including all nested ones) = $total_folders"
  echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
  echo "$top_size_folders"
  echo "Total number of files = $total_files"
  echo "Number of:"
  echo "Configuration files (with the .conf extension) = $total_configuration_files"
  echo "Text files = $total_text_files"
  echo "Executable files = $total_executable_files"
  echo "Log files (with the extension .log) = $total_log_files"
  echo "Archive files = $total_archive_files"
  echo "Symbolic links = $total_symbolic_links"
  echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
  print_top_10_files $path
  echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
  print_top_10_executive_files $path
}

print_top_10_files () {
  local file_name=($total_top_files_name)
  local file_size=($total_top_files_size)
  local file_type=($total_top_files_type)
  local count=$(echo -n "$total_top_files_name" | grep -c '^')
  for ((i = 1; i <= $count; i++)); do
    echo "$i - ${file_name[$i - 1]}, ${file_size[$i - 1]}, ${file_type[$i - 1]}"
  done
}

print_top_10_executive_files () {
  local executive_file_name=($total_top_executable_name)
  local executive_file_size=($total_top_executable_size)
  local count=$(echo -n "$total_top_executable_name" | grep -c '^')
  for ((i = 1; i <= $count; i++)); do
    echo "$i - ${executive_file_name[$i - 1]}, ${executive_file_size[$i - 1]}, $(md5sum ${executive_file_name[$i - 1]} | awk '{print $1}')"
  done
}

