background_white="15"
background_red="9"
background_green="10"
background_blue="12"
background_purple="13"
background_black="0"

text_white="15"
text_red="9"
text_green="10"
text_blue="12"
text_purple="13"
text_black="0"

reset="\033[0m"

case $1 in
  1) background_1=$background_white;;
  2) background_1=$background_red;;
  3) background_1=$background_green;;
  4) background_1=$background_blue;;
  5) background_1=$background_purple;;
  6) background_1=$background_black;;
esac

case $2 in
  1) text_1=$text_white;;
  2) text_1=$text_red;;
  3) text_1=$text_green;;
  4) text_1=$text_blue;;
  5) text_1=$text_purple;;
  6) text_1=$text_black;;
esac

case $3 in
  1) background_2=$background_white;;
  2) background_2=$background_red;;
  3) background_2=$background_green;;
  4) background_2=$background_blue;;
  5) background_2=$background_purple;;
  6) background_2=$background_black;;
esac

case $4 in
  1) text_2=$text_white;;
  2) text_2=$text_red;;
  3) text_2=$text_green;;
  4) text_2=$text_blue;;
  5) text_2=$text_purple;;
  6) text_2=$text_black;;
esac

column_1="\033[48;5;${background_1}m\033[38;5;${text_1}m"
column_2="\033[48;5;${background_2}m\033[38;5;${text_2}m"