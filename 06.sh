#!/bin/bash
# author: Chiweiming
# version: v1
# date: 2024-03-28

<<COMMAND
监控系统负载，如果系统负载超过 10，记录系统状态信息
1）系统负载命令使用 uptime 看，过去 1 分钟的平均负载
2）系统状态使用如下工具标记：top、vmstat、ss
3）要求每隔 20s 监控一次
4）系统状态信息需要保存到指定目录下，保留 1 个月，文件名建议带有 date +%s 后缀或者前缀
COMMAND

[[ -d /tmp/logs ]] || mkdir -p /tmp/logs
while true
do
  load=$(uptime | awk -F 'average: ' '{print $2}'| awk -F ',' '{print $1}' | awk -F '.' '{print $1}')  
  if [[ ${load} -gt 10 ]]; then
    top -bn1 | head -n 100 > /tmp/logs/top.$(date +%s)
    vmstat 1 10 > /tmp/logs/vmstat.$(date + %s)
    ss -an > /tmp/logs/ss.$(date +%s)

    sleep 20
    find /tmp/logs \( -name "top*" -o -name "vmstat*"  -o -name "ss*" \) -mtime +30 | xargs rm -f
  fi
done
