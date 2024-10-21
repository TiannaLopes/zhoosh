#!/bin/bash

echo "Welcome to Zhoosh! 🚀 Let's zhoosh up your terminal."

# Define Zhoosh directory
ZHOOSH_DIR="$HOME/.zhoosh"

# Clone the Zhoosh repository
if [ -d "$ZHOOSH_DIR" ]; then
  echo "Zhoosh is already installed at $ZHOOSH_DIR."
else
  git clone https://github.com/TiannaLopes/zhoosh.git "$ZHOOSH_DIR"
  echo "Cloned Zhoosh into $ZHOOSH_DIR."
fi

# Prompt for OpenWeather API key
read -p "Enter your OpenWeather API key: " OPENWEATHER_API_KEY

# Replace the API key in the weather plugin
sed -i.bak "s/OPENWEATHER_API_KEY=\"[^\"]*\"/OPENWEATHER_API_KEY=\"$OPENWEATHER_API_KEY\"/" "$ZHOOSH_DIR/plugins/weather.plugin.zsh"

# Backup existing .zshrc
if [ -f "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
  echo "Backed up existing .zshrc to .zshrc.backup."
fi

# Link Zhoosh .zshrc template to the user's home directory
ln -s "$ZHOOSH_DIR/.zshrc_template" "$HOME/.zshrc"
echo "Linked Zhoosh configuration to .zshrc."

# Theme options
echo "Please select a theme for your terminal:"
echo "1) Purple"
echo "2) Blue"
echo "3) Green"

# Read user input
read -p "Enter the number of your choice: " theme_choice

# Set theme based on user input
case $theme_choice in
    1)
        echo "You selected Purple!"
        THEME_FILE="purple.zsh-theme"
        ;;
    2)
        echo "You selected Blue!"
        THEME_FILE="blue.zsh-theme"
        ;;
    3)
        echo "You selected Green!"
        THEME_FILE="green.zsh-theme"
        ;;
    *)
        echo "Invalid choice, defaulting to Purple."
        THEME_FILE="purple.zsh-theme"
        ;;
esac

# Add the selected theme to .zshrc
echo "source $ZHOOSH_DIR/themes/$THEME_FILE" >> ~/.zshrc
echo "Theme applied! Please restart your terminal or run 'source ~/.zshrc' to apply the changes."

# Reload Zsh
exec zsh
echo "All set! Enjoy your Zhooshed terminal."
