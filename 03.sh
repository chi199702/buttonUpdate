#!/bin/bash
# author: Chiweiming
# version: v1
# date: 2024-03-26

<<COMMAND
写一个检测脚本，用来检测本机所有磁盘分区读写是否正常。
做法：遍历每一个挂载点，在每一个挂载点新建一个文件，然后再删除该文件，如果一切正常则说明该分区没问题
COMMAND

for path in $(df | grep -v "tmpfs" | sed '1d' | awk '{print $NF}')
do
  touch ${path}/test.txt && rm -f ${path}/test.txt
  if (( $? == 0 )); then
    echo "${path} is nice"
  else
    echo "${path} is error"
  fi
done

