#!/bin/bash

source ./colors.sh

get_timezone () {
  local tmp_1=$(timedatectl | awk '/Time zone:/ {print $3}')
  local tmp_2=$(timedatectl | awk '/Universal time:/ {print $6}')
  local tmp_3=$(timedatectl | awk '/Time zone:/ {print $4}' | sed 's/[(,]//g')
  local result="$tmp_1 $tmp_2 $tmp_3"
  echo "$result"
}

get_os () {
  local result=$(cat /etc/*release | awk 'NR==1')
  echo "$result"
}

get_ip () {
  local result=$(ifconfig | awk '/broadcast/ {print $2}')
  echo "$result"
}

get_mask () {
  local result=$(ifconfig | awk '/broadcast/ {print $4}')
  echo "$result"
}

get_gateway () {
  local result=$(ip route | awk '/via/ {print $3}')
  echo "$result"
}

get_ram_total () {
  local tmp_1=$(free --mega | awk '/Mem:/ {printf "%.3f", $2 / 1024} ')
  local tmp_2="Gb"
  local result="$tmp_1 $tmp_2"
  echo "$result"
}

get_ram_used () {
  local tmp_1=$(free --mega | awk '/Mem:/ {printf "%.3f", $3 / 1024} ')
  local tmp_2="Gb"
  local result="$tmp_1 $tmp_2"
  echo "$result"
}

get_ram_free () {
  local tmp_1=$(free --mega | awk '/Mem:/ {printf "%.3f", $4 / 1024} ')
  local tmp_2="Gb"
  local result="$tmp_1 $tmp_2"
  echo "$result"
}

get_space_root () {
  local tmp_1=$(df | awk 'NR==2 {printf "%.2f", $2 / 1024} ')
  local tmp_2="Mb"
  local result="$tmp_1 $tmp_2"
  echo "$result"
}

get_space_root_used () {
  local tmp_1=$(df | awk 'NR==2 {printf "%.2f", $3 / 1024} ')
  local tmp_2="Mb"
  local result="$tmp_1 $tmp_2"
  echo "$result"
}

get_space_root_free () {
  local tmp_1=$(df | awk 'NR==2 {printf "%.2f", $4 / 1024} ')
  local tmp_2="Mb"
  local result="$tmp_1 $tmp_2"
  echo "$result"
}

print_report () {
  echo -e "${column_1}HOSTNAME${reset}        = ${column_2}$HOSTNAME${reset}"
  echo -e "${column_1}TIMEZONE${reset}        = ${column_2}$TIMEZONE${reset}"
  echo -e "${column_1}USER${reset}            = ${column_2}$USER${reset}"
  echo -e "${column_1}OS${reset}              = ${column_2}$OS${reset}"
  echo -e "${column_1}DATE${reset}            = ${column_2}$DATE${reset}"
  echo -e "${column_1}UPTIME${reset}          = ${column_2}$UPTIME${reset}"
  echo -e "${column_1}UPTIME_SEC${reset}      = ${column_2}$UPTIME_SEC${reset}"
  echo -e "${column_1}IP${reset}              = ${column_2}$IP${reset}"
  echo -e "${column_1}MASK${reset}            = ${column_2}$MASK${reset}"
  echo -e "${column_1}GATEWAY${reset}         = ${column_2}$GATEWAY${reset}"
  echo -e "${column_1}RAM_TOTAL${reset}       = ${column_2}$RAM_TOTAL${reset}"
  echo -e "${column_1}RAM_USED${reset}        = ${column_2}$RAM_USED${reset}"
  echo -e "${column_1}RAM_FREE${reset}        = ${column_2}$RAM_FREE${reset}"
  echo -e "${column_1}SPACE_ROOT${reset}      = ${column_2}$SPACE_ROOT${reset}"
  echo -e "${column_1}SPACE_ROOT_USED${reset} = ${column_2}$SPACE_ROOT_USED${reset}"
  echo -e "${column_1}SPACE_ROOT_FREE${reset} = ${column_2}$SPACE_ROOT_FREE${reset}"
}
