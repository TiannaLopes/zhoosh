# Display ISS location
function iss_location() {
  local position=$(curl -s http://api.open-notify.org/iss-now.json | jq -r '.iss_position')
  local latitude=$(echo "$position" | jq -r '.latitude')
  local longitude=$(echo "$position" | jq -r '.longitude')
  echo -e "🛰️ ISS Current Location: \033[1;33mLat: $latitude, Lon: $longitude\033[0m"
}