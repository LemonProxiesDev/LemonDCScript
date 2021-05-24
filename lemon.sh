#!/bin/bash
echo -e "\e[1;93mLemonProxies DC Script Started! \e[0m"
sudo apt install jq
chmod +x discord.sh
info=$(hostname) && ./discord.sh --webhook-url="https://discord.com/api/webhooks/842161142687203379/NRMLHXni1nk7144WK4Ou12rkjqFKPu32Wb7OUo8SNF2pw-tC8f9dpPDDAvve5EOINqZU" --username "TheDuke - logs" --avatar "https://cdn.discordapp.com/attachments/748529672589017119/838760716524978186/LemonProxies-01.png" --title "LemonProxies DC Script Started on ${info}" --color "0xffa500" --footer "Debug System by TheDuke" --footer-icon "https://cdn.discordapp.com/attachments/774306541934215180/839872064646676500/image0.gif" --timestamp

echo -e "\e[1;93mUpdating Servers ! \e[0m"

# update package list and upgrade new versions of packages existing on the machine.
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential

# Installing Squid


echo -e "\e[1;93mServers is Now Updated ! \e[0m"
info=$(hostname) && ./discord.sh --webhook-url="https://discord.com/api/webhooks/842161142687203379/NRMLHXni1nk7144WK4Ou12rkjqFKPu32Wb7OUo8SNF2pw-tC8f9dpPDDAvve5EOINqZU" --username "TheDuke - logs" --avatar "https://cdn.discordapp.com/attachments/748529672589017119/838760716524978186/LemonProxies-01.png" --title "Server ${info} in now Updated !" --color "0xffa500" --footer "Debug System by TheDuke" --footer-icon "https://cdn.discordapp.com/attachments/774306541934215180/839872064646676500/image0.gif" --timestamp

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
sudo cp banned.txt /etc/squid

echo -e "\e[1;93mSquidService INSTALLED! \e[0m"
info=$(hostname) && ./discord.sh --webhook-url="https://discord.com/api/webhooks/842161142687203379/NRMLHXni1nk7144WK4Ou12rkjqFKPu32Wb7OUo8SNF2pw-tC8f9dpPDDAvve5EOINqZU" --username "TheDuke - logs" --avatar "https://cdn.discordapp.com/attachments/748529672589017119/838760716524978186/LemonProxies-01.png" --title "Squid is now Installed on ${info}" --color "0xffa500" --footer "Debug System by TheDuke" --footer-icon "https://cdn.discordapp.com/attachments/774306541934215180/839872064646676500/image0.gif" --timestamp
info=$(hostname) && ./discord.sh --webhook-url="https://discord.com/api/webhooks/842161142687203379/NRMLHXni1nk7144WK4Ou12rkjqFKPu32Wb7OUo8SNF2pw-tC8f9dpPDDAvve5EOINqZU" --username "TheDuke - logs" --avatar "https://cdn.discordapp.com/attachments/748529672589017119/838760716524978186/LemonProxies-01.png" --title "Setting up the right Sauce for SG/AU on ${info}" --color "0xffa500" --footer "Debug System by TheDuke" --footer-icon "https://cdn.discordapp.com/attachments/774306541934215180/839872064646676500/image0.gif" --timestamp
echo -e "\e[1;93mInstalling Custom Squid by LemonProxies! \e[0m"

wget http://www.squid-cache.org/Versions/v4/squid-4.14.tar.gz

tar xvf squid-4.14.tar.gz

echo -e "\e[1;93mCustom Squid - 30% \e[0m"

sudo cp PortCfg.h squid-4.14/src/anyp

cd

echo -e "\e[1;93mCustom Squid - 60% \e[0m"

cd LemonDCScript/squid-4.14/ 

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

cd && cd LemonDCScript && chmod +x discord.sh

info=$(hostname) && ip=$(wget -O - -q -4 https://icanhazip.com/) && ./discord.sh --webhook-url="https://discord.com/api/webhooks/842161142687203379/NRMLHXni1nk7144WK4Ou12rkjqFKPu32Wb7OUo8SNF2pw-tC8f9dpPDDAvve5EOINqZU" --username "TheDuke - logs" --avatar "https://cdn.discordapp.com/attachments/748529672589017119/838760716524978186/LemonProxies-01.png" --title "LemonProxies Sauce has been Successfully Installed !" --description " > Server : ${info}\n\n> IP: ${ip}" --color "0xf5f90b" --thumbnail "https://sistema.srl/media/zoo/images/Server-600_7c031b2b27cc40c37f48944d96cbce29.gif"  --footer "Debug System by TheDuke" --footer-icon "https://cdn.discordapp.com/attachments/774306541934215180/839872064646676500/image0.gif" --timestamp


echo -e "\e[1;93mCustom Squid - 100% \e[0m"
sudo systemctl restart squid && sudo systemctl status squid
