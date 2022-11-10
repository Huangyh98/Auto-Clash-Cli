#!/bin/bash
echo "删除 之前的 配置文件 "
rm clash/configs/config.yaml
sleep 1
wget $(cat ./clash_link.txt) -O clash/configs/config.yaml