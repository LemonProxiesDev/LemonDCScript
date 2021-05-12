#!/bin/bash
echo -e "\e[1;93mLemonProxies DC Script Started! \e[0m"

echo -e "\e[1;93mUpdating Servers ! \e[0m"

# update package list and upgrade new versions of packages existing on the machine.
sudo apt update && sudo apt upgrade -y

# Installing Squid


echo -e "\e[1;93mServers is Now Updated ! \e[0m"

echo -e "\e[1;93minstalling Normal Squid ! \e[0m"
# install psw genarator.
sudo apt-get install -y pwgen

echo -e "\e[1;93mPasswordGen INSTALLED! \e[0m"

# install Squid Proxy Server.
sudo apt install squid -y

# start and enable squid service.
sudo systemctl start squid
sudo systemctl enable squid

# install apache utils.
sudo apt install apache2-utils -y

# create a passwd file in a same dir. to squid.conf.
sudo touch /etc/squid/passwd

# change the ownership to proxy user.
# sudo chown proxy /etc/squid/passwd

# replace old squid.conf with new conf. file.
sudo cp squid.conf /etc/squid

# restart squid service.
sudo systemctl restart squid

# Verify Squid Status
sudo systemctl status squid

echo -e "\e[1;93mSquidService INSTALLED! \e[0m"

echo -e "\e[1;93mInstalling Custom Squid by LemonProxies! \e[0m"

sudo wget http://www.squid-cache.org/Versions/v4/squid-4.14.tar.gz

sudo tar xvf squid-4.14.tar.gz

echo -e "\e[1;93mCustom Squid - 30% \e[0m"

sudo cp PortCfg.h squid-4.14/src/anyp

cd

sudo apt install build-essentials

echo -e "\e[1;93mCustom Squid - 60% \e[0m"

cd squid-4.14 

./configure --prefix=/usr \
--localstatedir=/var \
--libexecdir=${prefix}/lib/squid \
--datadir=${prefix}/share/squid \
--sysconfdir=/etc/squid \
--with-default-user=proxy \
--with-logdir=/var/log/squid \
--with-pidfile=/var/run/squid.pid

echo -e "\e[1;93mCustom Squid - 80% \e[0m"

sudo make 

sudo make install

echo -e "\e[1;93mCustom Squid - 90% \e[0m"

# restart squid service.
sudo systemctl restart squid

# Verify Squid Status
sudo systemctl status squid

echo -e "\e[1;93mCustom Squid - 100% \e[0m"
