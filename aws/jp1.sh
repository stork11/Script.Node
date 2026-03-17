#!/bin/bash

wget -O install.sh --no-check-certificate https://pass.wocao.one/client/9CaCNonogdEEIqrf/install.sh && bash install.sh && rm install.sh -f
apt update -y
apt install cron -y

curl -L -o /usr/local/bin/cf.ddns.2.sh https://raw.githubusercontent.com/stork11/Script.Node/master/cf.ddns.tt.interesting2026.blog.sh && \
chmod +x /usr/local/bin/cf.ddns.2.sh && /usr/local/bin/cf.ddns.2.sh && \
(crontab -l 2>/dev/null; echo "* * * * * /usr/local/bin/cf.ddns.2.sh >/dev/null 2>&1") | crontab -

S=nyanpass bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient "-t d081d59a-4a90-46d9-9974-2ae10135e08a -u https://ny.wocao.one"
S=nyanpass2 bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient "-o -t ec2adbf9-b2db-41c5-a9fc-154ee9372fa8 -u https://ny.wocao.one"