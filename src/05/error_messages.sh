#!/bin/bash

parameter_is_missing () {
  echo "Ошибка: отсутствует параметр"
}

many_parameters () {
  echo "Ошибка: указано более одного параметра"
}

parameter_is_not_folder () {
  echo "Ошибка: введенный параметр не является каталогом"
}

missing_slash () {
  echo "Ошибка: в конце пути отсутствует '/'"
}

directory_does_not_exist () {
  echo "Ошибка: директории не существует"
}