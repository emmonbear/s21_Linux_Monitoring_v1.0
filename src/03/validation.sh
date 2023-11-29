#!/bin/bash

source ./error_messages.sh

validation () {
  local error_code=0
  if [ $# -eq 0 ]; then
    parameters_is_missing
  elif [ $# -gt 0 ] && [ $# -lt 4 ]; then
    few_parameters
  elif [ $# -gt 4 ]; then
    many_parameters
  fi
  patameter_is_not_number $@
  if [ $1 -eq $2 ] || [ $3 -eq $4 ]; then
    colors_is_match
  elif [ $# -eq 4 ]; then
    if [ $1 -lt 1 ] || [ $1 -gt 6 ]; then
      invalid_parameter
      error_code=1
    elif [ $2 -lt 1 ] || [ $2 -gt 6 ]; then
      invalid_parameter
      error_code=1
    elif [ $3 -lt 1 ] || [ $3 -gt 6 ]; then
      invalid_parameter
      error_code=1
    elif [ $4 -lt 1 ] || [ $4 -gt 6 ]; then
      invalid_parameter
      error_code=1
    fi
    if [ $error_code -eq 1 ]; then
      exit 1
    fi
  fi
}

patameter_is_not_number () {
  for arg in "$@"; do
    if ! [[ $arg =~ ^[0-9]+$ ]]; then
      echo "Ошибка: Параметр задан не числом"
      exit 1
    fi
  done
}