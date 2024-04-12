#!/bin/bash
# author: ChiWeiming
# version: v1
# date: 2024-04-12

<<COMMANT
输入一个数字，然后运行对应的一个命令。
显示命令如下：
*cmd meau** 1-date 2-ls 3-who 4-pwd
当输入 1 时，执行 date 命令，输入 2 时执行 ls 命令，依此类推
COMMANT

echo "*cmd meau** 1-date 2-ls 3-who 4-pwd"

while :
do
  read -p "please input a number 1-4: " n
  case ${n} in
    1)
      date
      break
      ;;
    2)
      ls
      break
      ;;
    3)
      who
      break
      ;;
    4)
      pwd
      break
      ;;
    *)
      echo "Wrong input, try again!"
      ;;
  esac
done
