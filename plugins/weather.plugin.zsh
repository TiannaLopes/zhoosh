# Weather Plugin for Zhoosh

OPENWEATHER_API_KEY="ca5c1225a721701fe8a57073576345fe"  # Replace with your API key

function show_weather() {
  local city=$(curl -s ipinfo.io/city)  # Auto-detect city from IP location
  local api_response=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$OPENWEATHER_API_KEY&units=metric")

  # Extract temperature and weather description
  local temperature=$(echo $api_response | jq '.main.temp')
  local condition=$(echo $api_response | jq -r '.weather[0].description')
  local icon=$(echo $api_response | jq -r '.weather[0].icon')

  # Map weather icons to terminal symbols (optional)
  declare -A icons
  icons=(["01d"]="☀️" ["02d"]="⛅" ["03d"]="☁️" ["09d"]="🌧️" ["10d"]="🌦️" ["13d"]="❄️" ["50d"]="🌫️")

  local weather_icon=${icons[$icon]:-"🌡️"}

  # Display the weather in a stylish format
  echo -e "\n${weather_icon} \033[1;36mWeather i
