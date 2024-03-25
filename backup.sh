#!/bin/bash
# author: ChiWeiming
# version: v1
# date: 2024-03-24

source color.sh

# check the number of parameters
if (($# != 2)); then
  FMT_COLOR_PRINT ${FG_RED} "error:  "
  echo "usage: command filepath filetype"
  exit
fi

# check if the file path exists
if [[ !(-d $(1)) ]]; then
  echo "file path "

date=$(date +%Y%m%d)
for filepath in $(find $1 -type f -name "*.$2")
do
  cp ${filepath} ${filepath}_${date}
done
