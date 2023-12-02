#!/bin/bash

source ./error_messages.sh

validation () {
  local error_code=0
  if [ $# -eq 0 ]; then
    parameter_is_missing
    error_code=1
  elif [ $# -gt 1 ]; then
    many_parameters
    error_code=1
  elif [[ ! -d "$1" ]]; then
    directory_does_not_exist
    error_code=1
  else
    parameter_validation $1
    error_code=$?
  fi
  return $error_code
}

parameter_validation () {
  local error_code=0
  if [[ $1 != */ ]]; then
    missing_slash
    error_code=1
  elif [[ ! -d "$1" ]] && [[ $1 == */ ]]; then
    parameter_is_not_folder
    error_code=1
  fi
  return $error_code
}