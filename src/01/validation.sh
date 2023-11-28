#!/bin/bash

source ./error_messages.sh

validation () {
  if [ $# -eq 0 ]; then
    parameter_is_missing
  elif [ $# -eq 1 ]; then
    validation_text $1
  else
    many_parameters
  fi
}

validation_text () {
  if [[ $1 =~ ^[a-zA-Z]+$ ]]; then
    echo "$1"
  else
    invalid_parameter
  fi
}
