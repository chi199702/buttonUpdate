#!/bin/bash
# author: Chiweiming
# version: v1
# date: 2024-03-25

<<COMMENT
创建 10 个用户，并给他们设置随机密码，密码记录到一个文件userinfo.txt中，用户从 user_00 到 user_09
COMMENT

if [[ -f /tmp/userinfo.txt ]]; then
  rm -f /tmp/userinfo.txt
fi

if ! which chpasswd; then
  apt install -y chpasswd
fi

for user_id in $(seq -w 0 09)
do
  password=$(pwgen 8 1)
  useradd "user${user_id}" && echo "user${user_id}:${password}" | chpasswd
  echo -e "user${user_id}\t${password}" >> /tmp/userinfo.txt
done
