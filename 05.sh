#/bin/bash
# autuor: ChiWeiming
# version: v1
# date: 2024-03-27

<<COMMAND
针对某个目录，该目录下有数百个子目录，
比如 /data/att/chiweiming /data/att/linux
然后再深入一层是以日期命名的目录，比如 /data/att/linux/20240324，每天都会生成一个日期新目录，由于磁盘空间快满了，所以需要讲老文件（一年以前的）挪到另一个目录 /data1/att 下
示例： mv /data/att/linux/20240324 /data1/att/linux/20240324
挪完之后，还需要做软链接
ln -s /data1/att/linux/20240324 /data/att/linux/20240324
需要有日志信息
COMMAND

function main() {
  cd data/att
  for dir in $(ls)  
  do
    for subdir in $(find ${dir} -maxdepth 1 -type d)
    do
      rsync -aR ${subdir}/ /tmp/att/
      if (( $? == 0 )); then
        rm -rf ${subdir}
        echo "${subdir} move successful"
        ln -s /tmp/att/${subdir} data/att/${subdir} && echo "software link create successful"
        echo ""
      fi
    done
  done
}

main &> /tmp/move_old_data_$(date +%F).log
