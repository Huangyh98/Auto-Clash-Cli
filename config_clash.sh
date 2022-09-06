#!/bin/bash
rm -rf clash
mkdir -p clash
mkdir -p clash/configs
cd clash
wget https://github.com/Dreamacro/clash/releases/download/v1.11.4/clash-linux-amd64-v3-v1.11.4.gz -O clash.gz
gunzip clash.gz
chmod +x clash
wget https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb -O configs/Country.mmdb 
cd ..
wget $(cat ./clash_link.txt) -O clash/configs/config.yaml

echo download success!


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