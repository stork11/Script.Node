#!/bin/bash

wget -N --no-check-certificate "https://raw.githubusercontent.com/stork11/Script.Node/master/run.sh" && bash run.sh nc.sg
wget -O install.sh --no-check-certificate https://pass.wocao.one/client/OEvndFZgXZTg2cxP/install.sh && bash install.sh && rm install.sh -f

apt install cron -y
curl -L -o /usr/local/bin/cf.ddns.sh https://raw.githubusercontent.com/stork11/Script.Node/master/cf.ddns.sg2.lovehonor.top.sh && \
chmod +x /usr/local/bin/cf.ddns.sh && \
(crontab -l 2>/dev/null; echo "* * * * * /usr/local/bin/cf.ddns.sh >/dev/null 2>&1") | crontab -

