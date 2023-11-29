#!/bin/bash

parameters_is_missing () {
  echo "Ошибка: Отсутствуют параметры"
  exit 1
}

few_parameters () {
  echo "Ошибка: Введено менее 4 параметров"
  exit 1
}

many_parameters () {
  echo "Ошибка: Введено более 4 параметров"
  exit 1
}

colors_is_match () {
  echo "Ошибка: Цвета фона и текста совпадают"
  exit 1
}

invalid_parameter () {
  echo "Ошибка: Некорректное значение параметра"
}

text_in_patameter () {
  echo "Ошибка: В параметре символ, отличный от цифры"
  exit 1
}