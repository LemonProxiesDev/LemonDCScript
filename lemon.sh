echo "LemonProxies Script STARTED!"
# update package list and upgrade new versions of packages existing on the machine.
sudo apt update && sudo apt upgrade -y

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
sudo chown proxy /etc/squid/passwd

# create user for proxy service.
# sudo htpasswd /etc/squid/passwd-PROXY_USER

/usr/bin/htpasswd -b -c /etc/squid/passwd lemonproxies premium

echo "LemonProxies user created !"

# replace old squid.conf with new conf. file.
sudo cp squid.conf /etc/squid

# restart squid service.
sudo systemctl restart squid

# done
echo "LemonProxies Script DONE !"
