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
  -d '{"username": "test", "content": "hello"}' \
  $WEBHOOK_URL
