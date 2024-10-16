
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

# Backup existing .zshrc
if [ -f "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
  echo "Backed up existing .zshrc to .zshrc.backup."
fi

# Link Zhoosh .zshrc template to the user's home directory
ln -s "$ZHOOSH_DIR/.zshrc_template" "$HOME/.zshrc"
echo "Linked Zhoosh configuration to .zshrc."

# Reload Zsh
exec zsh
echo "All set! Enjoy your Zhooshed terminal."
