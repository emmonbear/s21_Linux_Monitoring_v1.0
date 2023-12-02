#!/bin/bash

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
  local tmp_1=$(df -BK / | awk 'NR==2 {printf "%.2f", $2 / 1024} ')
  local tmp_2="Mb"
  local result="$tmp_1 $tmp_2"
  echo "$result"
}

get_space_root_used () {
  local tmp_1=$(df -BK / | awk 'NR==2 {printf "%.2f", $3 / 1024} ')
  local tmp_2="Mb"
  local result="$tmp_1 $tmp_2"
  echo "$result"
}

get_space_root_free () {
  local tmp_1=$(df -BK / | awk 'NR==2 {printf "%.2f", $4 / 1024} ')
  local tmp_1=$(df -BK / | awk 'NR==2 {printf "%.2f", $4 / 1024} ')
  local tmp_2="Mb"
  local result="$tmp_1 $tmp_2"
  echo "$result"
}

print_report () {
  echo "HOSTNAME = $HOSTNAME"
  echo "TIMEZONE = $TIMEZONE"
  echo "USER = $USER"
  echo "OS = $OS"
  echo "DATE = $DATE"
  echo "UPTIME = $UPTIME"
  echo "UPTIME_SEC = $UPTIME_SEC"
  echo "IP = $IP"
  echo "MASK = $MASK"
  echo "GATEWAY = $GATEWAY"
  echo "RAM_TOTAL = $RAM_TOTAL"
  echo "RAM_USED = $RAM_USED"
  echo "RAM_FREE = $RAM_FREE"
  echo "SPACE_ROOT = $SPACE_ROOT"
  echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
  echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"
}

write_report_to_file () {
  read -p "Сохранить данные в файл? (Y/N): " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    file_name=$(date +"%d_%m_%y_%H_%M_%S.status")
    print_report > "$file_name"
    echo "Данные сохранены в файл: $file_name"
  else
    echo "Данные не сохранены"
  fi
}

