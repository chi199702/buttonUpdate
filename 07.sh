#!/bin/bash
# author: ChiWeiming
# version: v1
# date: 2024-03-29

<<COMMANT
有一台 WEB 服务器上的目录，不定时有用户往该目录上传文件，现在需要每隔 5 分钟检查一下是否有新文件上传，有的话需要将新文件的列表输出到一个按年月日时分的日志文件中。
COMMANT

file_suffix=$(date +%Y%m%d%H%M)
dir="/data/web/attachment"

find ${dir} -type f -mmin -5 > /tmp/newf.txt

if [[ -s /tmp/newf.txt ]]; then
  /bin/mv /tmp/newf.txt /tmp/${file_suffix}
fi
