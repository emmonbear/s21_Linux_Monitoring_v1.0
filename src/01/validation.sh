#!/bin/bash

validation () {
  local error_code=0
  if [ $# -eq 0 ]; then
    echo "Ошибка: Отсутствует параметр"
    error_code=1
  elif [ $# -eq 1 ]; then
    validation_text $1
    error_code=$?
  else
    echo "Ошибка: Задано более 1 параметра"
    error_code=1
  fi
  return $error_code
}

validation_text () {
  local error_code=0
  if [[ $1 =~ ^[a-zA-Z]+$ ]]; then
    error_code=0
  else
    echo "Ошибка: Некорректный параметр. Введите текст"
    error_code=1
  fi
  return $error_code
}
