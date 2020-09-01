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
# -X POST - use POST method.
# -H "Content-Type: application/json" - header tells server you're sending JSON data.
# -d '{"username": "test", "content": "hello"}' - sets request data.
curl -X POST -H "Content-Type: application/json" -d '{"username": "test", "content": "hello"}' "https://discordapp.com/api/webhooks/750307253541797960/8GkGqqlZhfUfJH-PthUq7LraaCYoMYknP9iFMYBRiM0iyATYonATNsDqfGVN7qJ1HvKf"

# To make command more readable you can split it to multiple lines using backslash `\`
# and set webhook url as variable, so you don't need to paste it over and over again.
# Also you can add the variable to your `.*rc` file, so it persists on console reloads.
export WEBHOOK_URL="https://discordapp.com/api/webhooks/750307253541797960/8GkGqqlZhfUfJH-PthUq7LraaCYoMYknP9iFMYBRiM0iyATYonATNsDqfGVN7qJ1HvKf"
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"username": "test", "content": "Your Proxy is : ${ip}:${port}:${user}:${passw}"}' \
  $WEBHOOK_URL
