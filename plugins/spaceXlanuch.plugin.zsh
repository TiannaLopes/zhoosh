
# https://github.com/r-spacex/SpaceX-API

# Display Space X Launch Data
function spacex_launch() {
  local launch=$(curl -s https://api.spacexdata.com/v4/launches/next | jq -r '.name')
  local date=$(curl -s https://api.spacexdata.com/v4/launches/next | jq -r '.date_utc')
  echo -e "🚀 Next SpaceX Launch: \033[1;33m${launch}\033[0m"
  echo -e "🗓️  Launch Date: \033[1;34m${date}\033[0m"
}
