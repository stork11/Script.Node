#!/bin/bash

wget -N --no-check-certificate "https://raw.githubusercontent.com/stork11/Script.Node/master/run.sh" && bash run.sh sg
apt install cron -y
curl -L -o /usr/local/bin/cf.ddns.sh https://raw.githubusercontent.com/stork11/Script.Node/master/cf.ddns.sg1.lovehonor.top.sh && \
chmod +x /usr/local/bin/cf.ddns.sh && \
(crontab -l 2>/dev/null; echo "* * * * * /usr/local/bin/cf.ddns.sh >/dev/null 2>&1") | crontab -

S=nyanpass2 bash <(curl -fLSs https://dl.nyafw.com/download/nyanpass-install.sh) rel_nodeclient "-o -t ec2adbf9-b2db-41c5-a9fc-154ee9372fa8 -u https://ny.wocao.one"