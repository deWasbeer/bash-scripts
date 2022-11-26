#!/bin/bash
sudo echo $(date) - old ip: $(wget http://ipecho.net/plain -O - -q;echo)
sleep 1
cd /etc/openvpn
sleep 1
echo $(date) - cd to openvpn folder
sleep 1
echo $(date) - getting new ip...
sudo service openvpn restart server
#sleep 2
#sudo service openvpn start server
sleep 3
sudo openvpn --daemon --config /etc/openvpn/ovpn_tcp/nl883.nordvpn.com.tcp.ovpn --auth-user-pass /etc/openvpn/client/nordvpnlogin.txt
sleep 5
echo $(date) - new ip: $(wget http://ipecho.net/plain -O - -q;echo)
echo done!
