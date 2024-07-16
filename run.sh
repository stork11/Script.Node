#!/bin/bash

country=$1

echo "start script with country $country"

runXrayrs(){
	xrayrs=$(ls "/root/stork/xrayr")
	for filename in $xrayrs
	do
		xr="/root/stork/xrayr/$filename"
		echo $xr
		docker run --restart=always --name xr-$filename -d -v $xr/config.yml:/etc/XrayR/config.yml --network=host --log-opt max-size=10m --log-opt max-file=3 ghcr.io/rebecca554owen/xrayr:master
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

# 打开bbr
bash <(curl -Ls neko.nnr.moe/iiii.sh)

# 安装Docker
if [ ! "$(command -v docker)" ]; then
  echo "docker 没有安装" >&2
  curl -fsSL https://get.docker.com/ | sh
fi

# 安装探针
wget -N --no-check-certificate https://gitlab.com/xx.stork/script/-/raw/master/ws2.sh

# 安装git
apt install git -y

# 下载对应脚本
if [ -d "/root/stork" ];then
	rm -rf "/root/stork"
else
	mkdir /root/stork
fi
git clone -b "$country" https://github.com/stork11/Script.Node.git /root/stork

runXrayrs
runHysterias

# bash /root/ws2.sh

