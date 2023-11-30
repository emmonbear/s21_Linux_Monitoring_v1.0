#!/bin/bash

source ./variables.sh
source ./validation.sh
source ./colors.sh
answer_1=0
count=0
while [ 1 ]; do
  if [ $count -eq 0 ]; then
    validation $@
  else
    validation $answer_1
  fi
  if [ $? -eq 1 ]; then
    count=1
    read -p "Попробуете еще раз?(Y/N)" answer
    if [[ $answer =~ ^[yY]$ ]]; then
        read -p "Пожалуйста, введите 4 параметра: " answer_1
      continue
    else
      break
    fi
  elif [ $count -ne 0 ]; then
    print_report $answer_1
    break
  else
    print_report $@
    break
  fi
done