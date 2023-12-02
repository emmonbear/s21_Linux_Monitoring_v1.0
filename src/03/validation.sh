#!/bin/bash

validation () {
  local error_code=0
  if [ $# -eq 0 ]; then
    echo "Ошибка: Отсутствуют параметры"
    error_code=1
  elif [ $# -gt 0 ] && [ $# -lt 4 ]; then
    echo "Ошибка: Введено менее 4 параметров"
    error_code=1
  elif [ $# -gt 4 ]; then
    echo "Ошибка: Введено более 4 параметров"
    error_code=1
  else
    patameter_is_not_number $@
    if [ $? -eq 1 ]; then
      error_code=1
    elif [ $1 -eq $2 ] || [ $3 -eq $4 ]; then
      echo "Ошибка: Цвета фона и текста совпадают"
      error_code=1
    else [ $# -eq 4 ]
      parameter_validation $@
      if [ $? -eq 1 ]; then
        error_code=1
      fi
    fi
  fi
  return $error_code
}

patameter_is_not_number () {
  local error_code=0
  for arg in "$@"; do
    if ! [[ $arg =~ ^[0-9]+$ ]]; then
      echo "Ошибка: Параметр задан не числом"
      error_code=1
      break
    fi
  done
  return $error_code
}

parameter_validation () {
  local error_code=0
  for param in "$1" "$2" "$3" "$4"; do
    if [ "$param" -lt 1 ] || [ "$param" -gt 6 ]; then
      echo "Ошибка: Некорректное значение параметра"
      error_code=1
      break
    fi
  done
  return $error_code
}