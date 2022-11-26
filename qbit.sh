#!/bin/bash

sudo systemctl stop qbittorrent-nox
sleep 3
sudo ufw allow 59692
sleep 3
sudo systemctl start qbittorrent-nox
sleep 3
/bin/curl 'http://127.0.0.1:8080/api/v2/torrents/resume' --data 'hashes=all'
sleep 3
echo done
