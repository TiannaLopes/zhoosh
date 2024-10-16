# https://docs.coingecko.com/reference/introduction

# Display Crypto Price 
function crypto_price() {
  local coin=$1
  local price=$(curl -s "https://api.coingecko.com/api/v3/simple/price?ids=${coin}&vs_currencies=usd" | jq -r ".[\"$coin\"].usd")
  echo -e "💰 ${coin^} Price: \033[1;33m$${price} USD\033[0m"
}
