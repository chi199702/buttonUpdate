#!/bin/bash
# author: ChiWeiming
# version: v1
# date: 2024-03-24

<<COMMENT
备份指定目录下的指定类型的文件，在所有指定文件的后面加上日期。
例如，备份 /data 目录下的所有 .log 文件，system.log -> system.log_20240324
COMMENT

source color.sh

# check the number of parameters
if (($# != 2)); then
  FMT_COLOR_PRINT ${FG_RED} "error:  "
  echo "usage: command filepath filetype"
  exit
fi

# check if the file path exists
if [[ ! -d $1 ]]; then
  echo "$1 : file path no exist"
  exit 1
fi

date=$(date +%Y%m%d)
for filepath in $(find $1 -type f -name "*.$2")
do
  cp ${filepath} ${filepath}_${date}
done
