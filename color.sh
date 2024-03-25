#!/bin/bash

FG_BLACK="\e[1;30m"
FG_RED="\e[1;31m"
FG_GREEN="\e[1;32m"
FG_YELLOW="\e[1;33m"
FG_BLUE="\e[1;34m"
FG_MAGENTA="\e[1;35m"
FG_CYAN="\e[1;36m"
FG_WHILE="\e[1;37m"
FG_NONE="\e[0m"

function FMT_COLOR_PRINT() {
  echo -e "${1}${2}${FG_NONE}"
}
