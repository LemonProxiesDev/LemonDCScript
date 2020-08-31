#!/bin/bash
# Get Datacenter IP ()^M
ip=$(wget -O - -q https://icanhazip.com/)^M

# Get Datacenter Port ( Default )^M
port=3128^M

# Get Datacenter username ( Default )
user=lemonproxies^M

# Genarate Random psw
passw=$(pwgen -A 4 1)^M

sudo htpasswd -b -c /etc/squid/passwd ${user} ${passw}^M
echo -e "\e[1;93mUSER CREATED! \e[0m"^M

echo -e "\e[1;93mDONE ! \e[0m"^M
echo -e "\e[1;93mYour Proxy is : ${ip}:${port}:${user}:${passw}\e[0m"^M
