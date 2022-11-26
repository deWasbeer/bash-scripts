#!/bin/bash

sudo chown -R planet:video /external2/Play/Play
sudo chmod -R 774 /external2/Play/Play
sudo chown -R planet:video /external2/Play/PlayNew
sudo chmod -R 774 /external2/Play/PlayNew
sudo chown -R planet:video /external/Movies
sudo chmod -R 774 /external/Movies
sudo chown -R planet:video /external/Series
sudo chmod -R 774 /external/Series
sudo chown -R planet:video /external/Music
sudo chmod -R 774 /external/Music
sudo chown -R planet:video /external/NewMusic
sudo chmod -R 774 /external/NewMusic
#sudo chown -R plex:plex /home/plexdir/transcoder
sudo chown -R planet:video /external2/NintendoSwitch
sudo chmod -R 774 /external2/NintendoSwitch
sudo chown -R planet:video /external2/Megapack
sudo chmod -R 774 /external2/Megapack
echo "Ownerships succesfully set"
