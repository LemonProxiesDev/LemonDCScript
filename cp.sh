#!/bin/bash
# Get Datacenter IP ()^M
ip=$(wget -O - -q -4 https://icanhazip.com/)

# Get Datacenter Port ( Default )^M
port=3128

# Get Datacenter username ( Default )
user=lemonproxies

# Genarate Random psw
passw=$(pwgen -A 4 1)

sudo htpasswd -b -c /etc/squid/passwd ${user} ${passw}
echo -e "\e[1;93mUSER CREATED! \e[0m"

echo -e "\e[1;93mDONE ! \e[0m"
echo -e "\e[1;93mYour Proxy is : ${ip}:${port}:${user}:${passw}\e[0m"
