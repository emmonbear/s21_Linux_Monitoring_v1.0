#!/bin/bash

parameters_is_missing () {
  echo "Ошибка: Отсутствуют параметры"
}

few_parameters () {
  echo "Ошибка: Введено менее 4 параметров"
}

many_parameters () {
  echo "Ошибка: Введено более 4 параметров"
}

colors_is_match () {
  echo "Ошибка: Цвета фона и текста совпадают"
}

invalid_parameter () {
  echo "Ошибка: Некорректное значение параметра"
}

text_in_patameter () {
  echo "Ошибка: В параметре символ, отличный от цифры"
}