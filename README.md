# Zhoosh Terminal Styling Package

Zhoosh is a terminal styling package that brings customizable themes, weather information, jokes, and more to your terminal. It's designed to work with Zsh and provides easy-to-use commands for various APIs.

## Features
- **Weather Commands**: Get live weather information using OpenWeather API.
- **Fun Commands**: Get random jokes, facts, and trivia.
- **Custom Themes**: Customize your terminal prompt with cool themes.

## Installation

### Prerequisites
- Zsh (Z shell)
- jq (Install via `brew install jq`)

### Steps to Install

1. **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/zhoosh.git ~/.zhoosh
    ```

2. **Run the installation script**:
    ```bash
    ~/.zhoosh/install.sh
    ```

    The script will:
    - Prompt you for your OpenWeather API key (you can get one from [OpenWeatherMap](https://home.openweathermap.org/users/sign_up)).
    - Backup your existing `.zshrc`.
    - Link the Zhoosh configuration to your `.zshrc`.

3. **Reload your terminal**:
    After installation, Zhoosh will automatically reload your Zsh session. You should now see the new custom prompt and have access to various commands.

## Usage

### Weather Commands:
- `weather`: Show basic weather information.
- `weatherall`: Show all weather details, including temperature, humidity, wind, sunrise, and sunset times.
- `humidity`, `wind`, `pressure`: Get specific weather information.

### Fun Commands:
- `catfact`: Get a random cat fact.
- `dadjoke`: Get a random dad joke.
- `chucknorris`: Get a random Chuck Norris joke.

### Customizing Zhoosh
To customize Zhoosh, edit the `.zshrc_template` file in `~/.zhoosh`. You can change the theme, add or remove plugins, and tweak the command aliases.
