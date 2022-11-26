#!/bin/bash
sudo echo $(date) - old ip: $(wget http://ipecho.net/plain -O - -q;echo)
sleep 1
cd /etc/openvpn
sleep 1
echo $(date) - cd to openvpn folder
sleep 1
echo $(date) - quitting openvpn service...
sleep 1
sudo killall -s KILL openvpn
sleep 1
echo $(date) - new ip: $(wget http://ipecho.net/plain -O - -q;echo)
sleep 1
echo $(date) - stopping nordvpn service...
sleep 1
sudo systemctl stop openvpn.service
echo done!
