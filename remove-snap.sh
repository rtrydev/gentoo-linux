#!/bin/bash

snap remove --purge firefox;
snap remove --purge snap-store;
snap remove --purge gnome-3-38-2004;
snap remove --purge gtk-common-themes;
snap remove --purge snapd-desktop-integration;
snap remove --purge bare;
snap remove --purge core20;
snap remove --purge snapd;

apt remove --autoremove snapd -y;

echo "Package: snapd" > /etc/apt/preferences.d/nosnap.pref;
echo "Pin: release a=*" >> /etc/apt/preferences.d/nosnap.pref;
echo "Pin-Priority: -10" >> /etc/apt/preferences.d/nosnap.pref;

apt update;

add-apt-repository ppa:mozillateam/ppa -y;

echo "Package: firefox*" > /etc/apt/preferences.d/mozillateamppa;
echo "Pin: release o=LP-PPA-mozillateam" >> /etc/apt/preferences.d/mozillateamppa;
echo "Pin-Priority: 1001" >> /etc/apt/preferences.d/mozillateamppa;

apt update;
apt install firefox -y;

