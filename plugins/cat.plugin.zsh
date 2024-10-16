
# https://catfact.ninja/

#Display a cat fact
function cat_fact() {
  local fact=$(curl -s https://catfact.ninja/fact | jq -r '.fact')
  echo -e "🐱 Cat Fact: \033[1;34m${fact}\033[0m"
}