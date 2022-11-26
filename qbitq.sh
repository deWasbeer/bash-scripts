#!/bin/bash

sudo systemctl stop qbittorrent-nox
sleep 3
sudo ufw deny 59692
sleep 3
sudo systemctl start qbittorrent-nox
sleep 3
/usr/bin/curl 'http://127.0.0.1:8080/api/v2/torrents/pause' --data 'hashes=all'
sleep 3
echo done
