#!/bin/bash

parameter_is_missing () {
  echo "Ошибка: Отсутствует параметр"
}

many_parameters () {
  echo "Ошибка: Задано более 1 параметра"
}

invalid_parameter () {
  echo "Ошибка: Некорректный параметр. Введите текст"
}

