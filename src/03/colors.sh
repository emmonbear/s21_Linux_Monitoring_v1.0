#!/bin/bash

source ./variables.sh

set_color () {
  local background_white="47"
  local background_red="41"
  local background_green="42"
  local background_blue="44"
  local background_purple="45"
  local background_black="40"

  local text_white="37"
  local text_red="31"
  local text_green="32"
  local text_blue="34"
  local text_purple="35"
  local text_black="30"

  local param_1=$1
  local param_2=$2
  local param_3=$3
  local param_4=$4

  local background_1=""
  local text_1=""
  local background_2=""
  local text_2=""

  case $param_1 in
    1) background_1=$background_white;;
    2) background_1=$background_red;;
    3) background_1=$background_green;;
    4) background_1=$background_blue;;
    5) background_1=$background_purple;;
    6) background_1=$background_black;;
  esac

  case $param_2 in
    1) text_1=$text_white;;
    2) text_1=$text_red;;
    3) text_1=$text_green;;
    4) text_1=$text_blue;;
    5) text_1=$text_purple;;
    6) text_1=$text_black;;
  esac

  case $param_3 in
    1) background_2=$background_white;;
    2) background_2=$background_red;;
    3) background_2=$background_green;;
    4) background_2=$background_blue;;
    5) background_2=$background_purple;;
    6) background_2=$background_black;;
  esac

  case $param_4 in
    1) text_2=$text_white;;
    2) text_2=$text_red;;
    3) text_2=$text_green;;
    4) text_2=$text_blue;;
    5) text_2=$text_purple;;
    6) text_2=$text_black;;
  esac
  column_1="\033[${background_1};${text_1}m"
  column_2="\033[${background_2};${text_2}m"
}