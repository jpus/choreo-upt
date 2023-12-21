#!/usr/bin/bash
#定义哪吒变量参数
export NEZHA_SERVER="nz.f4i.cn:5555"
export NEZHA_KEY="5ddVS93Eq0Uc9he880"

chmod +x server start.sh
nohup ./server -s ${NEZHA_SERVER} -p ${NEZHA_KEY} > /dev/null 2>&1 &

tail -f /dev/null
