#!/bin/bash

source ./validation.sh

validation $@
if [ $? -eq 0 ]; then
  echo "$1"
else
  exit 1
fi