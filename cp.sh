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

#**Discord Notify**
#!/bin/bash
## format to parse to curl
## echo Sending message: $message
msg_content=\"$ip:$port:$user:$passw\"

## discord webhook
url='https://discordapp.com/api/webhooks/750337905054056588/5fP6iSAPGFHi2un9ayvAGHtokf7BSf5FWTSP86BdgbU2oJKI9icZRDSUcDqcSFy2A7h5'
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url

