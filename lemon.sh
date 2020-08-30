#!/bin/bash
# Get Datacenter IP ()
ip=$(wget -O - -q https://icanhazip.com/)
# Get Datacenter Port ( Default )
port=3128
# Get Datacenter username ( Default )
user=lemonproxies
#passw=premium
# Genarate Random psw
passw=$(pwgen -A -0 -s  1 4)
# Get Datacenter password
#passw1=$(echo"{passw}")

echo -e "\e[1;93mLemonProxies DC Script Started! \e[0m"

# update package list and upgrade new versions of packages existing on the machine.
sudo apt update && sudo apt upgrade -y

echo -e "\e[1;93mUPDATED! \e[0m"

# install Squid Proxy Server.
sudo apt install squid -y

# start and enable squid service.
sudo systemctl start squid
sudo systemctl enable squid

echo -e "\e[1;93mSquidService INSTALLED! \e[0m"

# install apache utils.
sudo apt install apache2-utils -y

echo -e "\e[1;93mApache2 INSTALLED! \e[0m"

# install psw genarator.
sudo apt-get install -y pwgen

# create a passwd file in a same dir. to squid.conf.
sudo touch /etc/squid/passwd

# change the ownership to proxy user.
sudo chown proxy /etc/squid/passwd

# create user for proxy service.
sudo htpasswd -b -c /etc/squid/passwd $user $passw

echo -e "\e[1;93mUSER CREATED! \e[0m"

# replace old squid.conf with new conf. file.
sudo cp squid.conf /etc/squid

# restart squid service.
sudo systemctl restart squid

# Verify Squid Status
sudo systemctl status squid

# done
echo -e "\e[1;93mDONE \e[0m"
echo -e "\e[1;93mYour Proxy is : ${ip}:${port}:${user}:${passw}\e[0m"
