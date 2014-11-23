#!/bin/bash

DIR=$(pwd);
echo "Script de instalacion xway"
sudo su
#Obtenemos los drivers de la tarjeta de red
wget https://github.com/jenssegers/RTL8188-hostapd/archive/v1.1.tar.gz
tar -zxvf v1.1.tar.gz
cd RTL8188-hostapd-1.1/hostapd
make
make install
cd $DIR

#Intalamos los archivos para la configuracion del Ad-hoc y del servidor dhcp
cp udhcpd.conf /etc/
cp udhcpd /etc/default
cp interfaces /etc/network/
cp hostapd.conf /etc/hostapd
cp hostapd /etc/default
cp local.rc /etc/
cp iptables.xway /etc/
cp sysctl.conf /etc/

sudo update-rc.d hostapd enable
sudo update-rc.d udhcpd enable

