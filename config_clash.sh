#!/bin/bash
colors_On_Red='\033[41m' 
colors_Normal='\e[0m' 
argNums=$#
if [ $argNums -eq 0 ]
then
    echo "没有发现 架构 ，支持 AMD64 ARMv8"
    echo "使用示例:./config_clash.sh AMD64"
    exit
fi
url=$(cat ./clash_link.txt)
if [ -z $url ];then
    echo "请先创建clash_link.txt,并将 链接放入txt中"
    exit
fi
# 使用须知
sed -n '1, 5p' ./PROMPT.txt
read -n 1 -s -r -p "Press any key to continue..." key


echo "快结束前需要输出密码。systemctl 需要"
sleep 2
arch=$1
echo "删除之前的 clash"
rm -rf clash
mkdir -p clash
mkdir -p clash/configs
cd clash
if [ $arch = ARMv8 ]
then
echo "下载 Clash armv8"
wget https://gitee.com/wangdaochuan/auto-clash-cli/releases/download/dependenciesv0.1/clash-linux-armv8-v1.11.8.gz -O clash.gz
elif [ $arch = AMD64 ]
then
echo "下载 Clash amd64"
wget https://gitee.com/wangdaochuan/auto-clash-cli/releases/download/dependenciesv0.1/clash-linux-amd64-v3-v1.11.4.gz -O clash.gz
fi

gunzip clash.gz
chmod +x clash
echo "下载Country.mmdb"
wget https://gitee.com/wangdaochuan/auto-clash-cli/releases/download/dependenciesv0.1/Country.mmdb -O configs/Country.mmdb 
cd ..
echo "下载config.yaml"
wget $(cat ./clash_link.txt) -O clash/configs/config.yaml


sleep 1


clash_exec="$(pwd)/clash/clash"
clash_config="$(pwd)/clash/configs"
echo $clash_exec
echo $clash_config
echo remove old clash.service
rm clash.service >> /dev/null
echo -e "[unit]\n\
Description=clash\n\
After=multi-user.targe\n\
[Service]\n\
TimeoutStartSec=30\n\
ExecStart=$clash_exec -d $clash_config" >> clash.service
echo -e 'ExecStop=/bin/kill $MAINPID
Restart=always
RestartSec=10s
[Install]
WantedBy=multi-user.target
' >> clash.service


echo -e "$colors_On_Red 注意这里需要密码 $colors_Normal"
sudo mv clash.service /etc/systemd/system/clash.service
sudo systemctl daemon-reload
sudo systemctl start clash
sudo systemctl enable clash


echo "set Auto_start success!!"

echo "
if [ -f $(pwd)/clash.bashrc ]; then
    source $(pwd)/clash.bashrc 
fi
">> ~/.bashrc

echo -e "alias clash_help='bash $(pwd)/clash_help.sh'">> ~/.bashrc

echo "clash 配置完成，，请在新终端中使用"
sed -n '7, 8p' ./PROMPT.txt

bash ./clash_help.sh