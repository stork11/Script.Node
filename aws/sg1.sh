#!/bin/bash

# 加载 BBR 模块
modprobe tcp_bbr

# 修改内核参数
sysctl -w net.core.default_qdisc=fq
sysctl -w net.ipv4.tcp_congestion_control=bbr

wget -O install.sh --no-check-certificate https://pass.wocao.one/client/7ASrUJOnvQI7jKjh/install.sh && bash install.sh && rm install.sh -f
apt update -y
apt install cron -y
curl -L -o /usr/local/bin/cf.ddns.2.sh https://raw.githubusercontent.com/stork11/Script.Node/master/cf.ddns.mm.interesting2026.blog.sh && \
chmod +x /usr/local/bin/cf.ddns.2.sh && /usr/local/bin/cf.ddns.2.sh && \
(crontab -l 2>/dev/null; echo "* * * * * /usr/local/bin/cf.ddns.2.sh >/dev/null 2>&1") | crontab -

S=nyanpass bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient "-t f147baff-285e-4179-a7f5-cd9a769ccb17 -u https://ny.wocao.one"
S=nyanpass2 bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient "-o -t ec2adbf9-b2db-41c5-a9fc-154ee9372fa8 -u https://ny.wocao.one"