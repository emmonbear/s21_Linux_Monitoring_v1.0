#!/bin/bash

source ./error_messages.sh

validation () {
  local error_code=0
  if [ $# -eq 0 ]; then
    parameter_is_missing
    error_code=1
  elif [ $# -eq 1 ]; then
    validation_text $1
    error_code=$?
  else
    many_parameters
    error_code=1
  fi
  return $error_code
}

validation_text () {
  local error_code=0
  if [[ $1 =~ ^[a-zA-Z]+$ ]]; then
    error_code=0
  else
    invalid_parameter
    error_code=1
  fi
  return $error_code
}
