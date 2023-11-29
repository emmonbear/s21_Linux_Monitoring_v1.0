#!/bin/bash

parameter_is_missing () {
  echo "Ошибка: Отсутствует параметр"
  exit 1
}

many_parameters () {
  echo "Ошибка: Задано более 1 параметра"
  exit 1
}

invalid_parameter () {
  echo "Ошибка: Некорректный параметр. Введите текст"
  exit 1
}

