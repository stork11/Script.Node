#!/bin/bash

country = $0

# 打开bbr
bash <(curl -Ls neko.nnr.moe/iiii.sh)
# 安装Docker
curl -fsSL https://get.docker.com/ | sh
# 安装探针
wget -N --no-check-certificate https://gitlab.com/xx.stork/script/-/raw/master/ws2.sh && bash ws2.sh
# 安装git
apt install git -y
# 下载对应脚本
mkdir /root/stork
git clone -b $country https://github.com/stork11/Script.Node.git /root/stork

runXrayrs
runHysterias

runXrayrs(){
	xrayrs=$(ls "/root/stork/xrayr")
	for filename in $xrayrs
	do
		xr="/root/stork/xrayr/$filename"
		echo $xr
		docker run --restart=always --name xr-$filename -d -v $xr/config.yml:/etc/XrayR/config.yml --network=host ghcr.io/rebecca554owen/xrayr:master
	done
}

runHysterias(){
	hys=$(ls "/root/stork/hy")
	for filename in $hys
	do
		hy="/root/stork/hy/$filename"
		echo $hy
		cd $hy
		docker compose up -d
	done
}