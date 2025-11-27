#!/bin/bash

wget -N --no-check-certificate "https://raw.githubusercontent.com/stork11/Script.Node/master/run.sh" && bash run.sh jp
wget -O install.sh --no-check-certificate https://pass.wocao.one/client/9CaCNonogdEEIqrf/install.sh && bash install.sh && rm install.sh -f
docker run -d --name ddns -e ZONE=lovehonor.top -e SUBDOMAIN=jp1 xwhales/ddns:go

