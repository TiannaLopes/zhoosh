# https://icanhazdadjoke.com/

# Display a dad joke
function dad_joke() {
  local joke=$(curl -s -H "Accept: application/json" https://icanhazdadjoke.com/ | jq -r '.joke')
  echo -e "🤣 Dad Joke: \033[1;34m${joke}\033[0m"
}