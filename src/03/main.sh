#!/bin/bash

answer_1=0
count=0
while [ 1 ]; do
  source ./validation.sh
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
    source ./colors.sh 
    print_report $answer_1
    break
  else
    source ./colors.sh 
    print_report $@
    break
  fi
done