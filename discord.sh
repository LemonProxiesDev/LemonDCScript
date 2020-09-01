#!/bin/bash
message="$@"
## format to parse to curl
## echo Sending message: $message
msg_content=\"$message TESTS\"

## discord webhook
url='https://discordapp.com/api/webhooks/750307253541797960/8GkGqqlZhfUfJH-PthUq7LraaCYoMYknP9iFMYBRiM0iyATYonATNsDqfGVN7qJ1HvKf'
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
