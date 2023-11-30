#!/bin/bash

source ./colors.conf

validation () {
  if [ -f colors.conf ]; then
    source ./colors.conf
    if [[ ! $column1_background =~ ^[0-9]+$ || $column1_background -lt 1 || $column1_background -gt 6 ]]; then
      column1_background=0
      sed -i 's/^column1_background=.*/column1_background=0/' ./colors.conf
    fi
    if [[ ! $column1_font_color =~ ^[0-9]+$ || $column1_font_color -lt 1 || $column1_font_color -gt 6 ]]; then
      column1_font_color=7
      sed -i 's/^column1_font_color=.*/column1_font_color=7/' ./colors.conf
    fi
    if [[ ! $column2_background =~ ^[0-9]+$ || $column2_background -lt 1 || $column2_background -gt 6 ]]; then
      column2_background=0
      sed -i 's/^column2_background=.*/column2_background=0/' ./colors.conf
    fi
    if [[ ! $column2_font_color =~ ^[0-9]+$ || $column2_font_color -lt 1 || $column2_font_color -gt 6 ]]; then
      column2_font_color=7
      sed -i 's/^column2_font_color=.*/column2_font_color=7/' ./colors.conf
    fi
  else
    column1_background=0
    column1_font_color=7
    column2_background=0
    column2_font_color=7
  fi
}
