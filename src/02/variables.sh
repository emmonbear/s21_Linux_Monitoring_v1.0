#!/bin/bash

source ./functions.sh

HOSTNAME=$(hostname)
TIMEZONE=$(get_timezone)
USER=$(whoami)
OS=$(get_os)
DATE=$(date +"%d %b %Y %T")
UPTIME=$(uptime -p)
UPTIME_SEC=$(awk '{print int($1)}' /proc/uptime)
IP=$(get_ip)
MASK=$(get_mask)
GATEWAY=$(get_gateway)
RAM_TOTAL=$(get_ram_total)
RAM_USED=$(get_ram_used)
RAM_FREE=$(get_ram_free)
SPACE_ROOT=$(get_space_root)
SPACE_ROOT_USED=$(get_space_root_used)
SPACE_ROOT_FREE=$(get_space_root_free)