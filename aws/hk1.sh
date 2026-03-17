#!/bin/bash

# 入口
wget -O install.sh --no-check-certificate https://pass.wocao.one/client/6fTb1GZlXWjtCC8p/install.sh && bash install.sh && rm install.sh -f
apt install cron -y
curl -L -o /usr/local/bin/cf.ddns.2.sh https://raw.githubusercontent.com/stork11/Script.Node/master/cf.ddns.nn.interesting2026.blog.sh && \
chmod +x /usr/local/bin/cf.ddns.2.sh && \
(crontab -l 2>/dev/null; echo "* * * * * /usr/local/bin/cf.ddns.2.sh >/dev/null 2>&1") | crontab -

# nyanpass

S=nyanpass bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient "-t 400ac14a-c6f7-4f0b-9761-7ce8c76235bc -u https://ny.wocao.one"
S=nyanpass2 bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient "-o -t ec2adbf9-b2db-41c5-a9fc-154ee9372fa8 -u https://ny.wocao.one"