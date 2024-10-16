# plugins/weather.plugin.zsh

OPENWEATHER_API_KEY="ca5c1225a721701fe8a57073576345fe"  # Replace with your API key

# Fetch the weather data
function fetch_weather_data() {
  local city=$(curl -s ipinfo.io/city)  # Auto-detect city from IP location
  api_response=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${OPENWEATHER_API_KEY}&units=metric")

  # Debugging: Print the raw API response (uncomment to debug)
  # echo "API Response: $api_response"
}

# Display current weather
function show_weather() {
  fetch_weather_data
  local temperature=$(echo "$api_response" | jq '.main.temp')
  local condition=$(echo "$api_response" | jq -r '.weather[0].description')
  local icon=$(echo "$api_response" | jq -r '.weather[0].icon')

  declare -A icons
  icons=( ["01d"]="☀️" ["02d"]="⛅" ["03d"]="☁️" ["09d"]="🌧️" ["10d"]="🌦️" ["13d"]="❄️" ["50d"]="🌫️" )

  local weather_icon=${icons[$icon]:-"🌡️"}

  echo -e "\n${weather_icon} \033[1;36mWeather in $(curl -s ipinfo.io/city):\033[0m"
  echo -e "🌡️  Temperature: \033[1;33m${temperature}°C\033[0m"
  echo -e "☁️  Condition: \033[1;34m${condition}\033[0m\n"
}

# Display humidity
function show_humidity() {
  fetch_weather_data
  local humidity=$(echo "$api_response" | jq '.main.humidity')
  echo -e "💧 Humidity: \033[1;34m${humidity}%\033[0m"
}

# Display wind speed
function show_wind() {
  fetch_weather_data
  local wind_speed=$(echo "$api_response" | jq '.wind.speed')
  echo -e "🍃 Wind Speed: \033[1;34m${wind_speed} m/s\033[0m"
}

# Display air pressure
function show_pressure() {
  fetch_weather_data
  local pressure=$(echo "$api_response" | jq '.main.pressure')
  echo -e "🔄 Air Pressure: \033[1;34m${pressure} hPa\033[0m"
}

# Display sunrise time
function show_sunrise() {
  fetch_weather_data
  local sunrise=$(echo "$api_response" | jq '.sys.sunrise')
  local sunrise_time=$(date -r "$sunrise" +"%H:%M %p")
  echo -e "🌅 Sunrise: \033[1;33m${sunrise_time}\033[0m"
}

# Display sunset time
function show_sunset() {
  fetch_weather_data
  local sunset=$(echo "$api_response" | jq '.sys.sunset')
  local sunset_time=$(date -r "$sunset" +"%H:%M %p")
  echo -e "🌇 Sunset: \033[1;33m${sunset_time}\033[0m"
}

# Display feels like temperature
function show_feels_like() {
  fetch_weather_data
  local feels_like=$(echo "$api_response" | jq '.main.feels_like')
  echo -e "🌡️  Feels Like: \033[1;33m${feels_like}°C\033[0m"
}

# Display visibility
function show_visibility() {
  fetch_weather_data
  local visibility=$(echo "$api_response" | jq '.visibility')
  echo -e "👁️  Visibility: \033[1;34m${visibility} meters\033[0m"
}

# Display rain levels
function show_rain() {
  fetch_weather_data
  local rain=$(echo "$api_response" | jq '.rain["3h"]')
  [ -n "$rain" ] && echo -e "🌧️  Rainfall: \033[1;34m${rain} mm\033[0m" || echo -e "🌧️  No rainfall data"
}

# Display snow levels
function show_snow() {
  fetch_weather_data
  local snow=$(echo "$api_response" | jq '.snow["3h"]')
  [ -n "$snow" ] && echo -e "❄️  Snowfall: \033[1;34m${snow} mm\033[0m" || echo -e "❄️  No snowfall data"
}

# Display UV index (separate request needed)
function show_uv_index() {
  local lat=$(echo "$api_response" | jq '.coord.lat')
  local lon=$(echo "$api_response" | jq '.coord.lon')
  local uv_response=$(curl -s "http://api.openweathermap.org/data/2.5/uvi?appid=${OPENWEATHER_API_KEY}&lat=${lat}&lon=${lon}")
  local uv_index=$(echo "$uv_response" | jq '.value')

  echo -e "🌞 UV Index: \033[1;33m${uv_index}\033[0m"
}

# Show all weather details with ASCII art for a cool display
function show_all_weather() {
  fetch_weather_data

  local city=$(curl -s ipinfo.io/city)
  local temperature=$(echo "$api_response" | jq '.main.temp')
  local feels_like=$(echo "$api_response" | jq '.main.feels_like')
  local condition=$(echo "$api_response" | jq -r '.weather[0].description')
  local humidity=$(echo "$api_response" | jq '.main.humidity')
  local wind_speed=$(echo "$api_response" | jq '.wind.speed')
  local pressure=$(echo "$api_response" | jq '.main.pressure')
  local visibility=$(echo "$api_response" | jq '.visibility')
  local sunrise_time=$(date -r "$(echo "$api_response" | jq '.sys.sunrise')" +"%H:%M %p")
  local sunset_time=$(date -r "$(echo "$api_response" | jq '.sys.sunset')" +"%H:%M %p")

  # Cool ASCII art for weather
  echo "         .--.              "
  echo "      .-(    ).            "
  echo "     (___.__)__)           "
  echo "      ~  ~  ~  ~           "
  echo -e "🌍 \033[1;36mWeather in ${city}\033[0m"
  echo -e "🌡️  \033[1;33mTemperature: ${temperature}°C\033[0m"
  echo -e "🌡️  \033[1;33mFeels Like: ${feels_like}°C\033[0m"
  echo -e "☁️  \033[1;34mCondition: ${condition}\033[0m"
  echo -e "💧 \033[1;34mHumidity: ${humidity}%\033[0m"
  echo -e "🍃 \033[1;34mWind Speed: ${wind_speed} m/s\033[0m"
  echo -e "🔄 \033[1;34mPressure: ${pressure} hPa\033[0m"
  echo -e "👁️  \033[1;34mVisibility: ${visibility} meters\033[0m"
  echo -e "🌅 \033[1;33mSunrise: ${sunrise_time}\033[0m"
  echo -e "🌇 \033[1;33mSunset: ${sunset_time}\033[0m"
  echo "         ~  ~  ~  ~           "
}
