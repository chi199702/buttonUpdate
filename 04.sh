#!/bin/bash
# author: Chiweiming
# version: v1
# date: 2024-03-26

<<COMMAND
检查某个目录下的所有文件和目录，看是否满足下面条件：
1）所有文件权限为 644
2）所有目录权限为 755
3）文件和目录所有者为 xxx，所属组为 xxx
如果不满足，改成符合要求
注意：不要直接修改权限，一定要有判断的过程
COMMAND

cd data
for file in $(find .)
do
  f_p=$(stat -c %a "${file}")
  f_u=$(stat -c %U "${file}")
  f_g=$(stat -c %G "${file}")

  if [[ -d ${file} ]]; then
    [[ ${f_p} != '755' ]] && chmod 755 "${file}"
  else
    [[ ${f_p} != '644' ]] && chmod 644 "${file}"
  fi

  [[ ${f_u} != "chiweiming" ]] && chown chiweiming "${file}"
  [[ ${f_g} != "chiweiming" ]] && chown :chiweiming "${file}"
done
