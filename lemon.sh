#!/bin/bash
# Get Datacenter IP
ip=$(wget -O - -q https://icanhazip.com/)
# Get Datacenter Port ( Default )
port=3128
# Get Datacenter username ( Default )
user=lemonproxies
# Genarate Random psw
passw=$(pwgen -A -0 -s  1 4)
# Get Datacenter password
passw1=$(echo"{passw}")

echo"╭╮╱╱╱╱╱╱╱╱╱╱╱╱╭━━━╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━━━┳━━━╮╭━━━╮╱╱╱╱╱╱╱╱╭╮"
echo"┃┃╱╱╱╱╱╱╱╱╱╱╱╱┃╭━╮┃╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰╮╭╮┃╭━╮┃┃╭━╮┃╱╱╱╱╱╱╱╭╯╰╮"
echo"┃┃╭━━┳╮╭┳━━┳━╮┃╰━╯┣━┳━━┳╮╭┳┳━━┳━━╮╱┃┃┃┃┃╱╰╯┃╰━━┳━━┳━┳┳━┻╮╭╯"
echo"┃┃┃┃━┫╰╯┃╭╮┃╭╮┫╭━━┫╭┫╭╮┣╋╋╋┫┃━┫━━┫╱┃┃┃┃┃╱╭╮╰━━╮┃╭━┫╭╋┫╭╮┃┃"      
echo"┃╰┫┃━┫┃┃┃╰╯┃┃┃┃┃╱╱┃┃┃╰╯┣╋╋┫┃┃━╋━━┃╭╯╰╯┃╰━╯┃┃╰━╯┃╰━┫┃┃┃╰╯┃╰╮"
echo"╰━┻━━┻┻┻┻━━┻╯╰┻╯╱╱╰╯╰━━┻╯╰┻┻━━┻━━╯╰━━━┻━━━╯╰━━━┻━━┻╯╰┫╭━┻━╯"
echo"╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱┃┃"
echo"╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰╯"

# update package list and upgrade new versions of packages existing on the machine.
sudo apt update && sudo apt upgrade -y

# install Squid Proxy Server.
sudo apt install squid -y

# start and enable squid service.
sudo systemctl start squid
sudo systemctl enable squid

# install apache utils.
sudo apt install apache2-utils -y

# install psw genarator.
sudo apt-get install -y pwgen

# create a passwd file in a same dir. to squid.conf.
sudo touch /etc/squid/passwd

# change the ownership to proxy user.
sudo chown proxy /etc/squid/passwd

# create user for proxy service.

/usr/bin/htpasswd -b -c /etc/squid/passwd ${user} "${passw}"

echo"╭╮╱╭┳━━━┳━━━┳━━━╮╭━━━┳━━━┳━━━┳━━━┳━━━━┳━━━┳━━━╮╭╮"
echo"┃┃╱┃┃╭━╮┃╭━━┫╭━╮┃┃╭━╮┃╭━╮┃╭━━┫╭━╮┃╭╮╭╮┃╭━━┻╮╭╮┃┃┃"
echo"┃┃╱┃┃╰━━┫╰━━┫╰━╯┃┃┃╱╰┫╰━╯┃╰━━┫┃╱┃┣╯┃┃╰┫╰━━╮┃┃┃┃┃┃"
echo"┃┃╱┃┣━━╮┃╭━━┫╭╮╭╯┃┃╱╭┫╭╮╭┫╭━━┫╰━╯┃╱┃┃╱┃╭━━╯┃┃┃┃╰╯"
echo"┃╰━╯┃╰━╯┃╰━━┫┃┃╰╮┃╰━╯┃┃┃╰┫╰━━┫╭━╮┃╱┃┃╱┃╰━━┳╯╰╯┃╭╮"
echo"╰━━━┻━━━┻━━━┻╯╰━╯╰━━━┻╯╰━┻━━━┻╯╱╰╯╱╰╯╱╰━━━┻━━━╯╰╯"
# replace old squid.conf with new conf. file.
sudo cp squid.conf /etc/squid

# restart squid service.
sudo systemctl restart squid

# Verify Squid Status
sudo systemctl status squid

# done
echo"╭━━━┳━━━┳━╮╱╭┳━━━╮╭╮"
echo"╰╮╭╮┃╭━╮┃┃╰╮┃┃╭━━╯┃┃"
echo"╱┃┃┃┃┃╱┃┃╭╮╰╯┃╰━━╮┃┃"
echo"╱┃┃┃┃┃╱┃┃┃╰╮┃┃╭━━╯╰╯"
echo"╭╯╰╯┃╰━╯┃┃╱┃┃┃╰━━╮╭╮"
echo"╰━━━┻━━━┻╯╱╰━┻━━━╯╰╯"
echo"Your Proxy is : ${ip}:${port}:${user}:${passw1}"
