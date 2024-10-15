#!/bin/bash

echo "Welcome to Zhoosh! 🚀 Let's zhoosh up your terminal."

# Clone the Zhoosh repository
ZHOOSH_DIR="$HOME/.zhoosh"
if [ -d "$ZHOOSH_DIR" ]; then
  echo "Zhoosh is already installed at $ZHOOSH_DIR."
else
  git clone https://github.com/your-username/zhoosh.git "$ZHOOSH_DIR"
  echo "Cloned Zhoosh into $ZHOOSH_DIR."
fi

# Backup existing .zshrc
if [ -f "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
  echo "Backed up existing .zshrc to .zshrc.backup."
fi

# Link Zhoosh .zshrc template
ln -s "$ZHOOSH_DIR/.zshrc_template" "$HOME/.zshrc"
echo "Linked Zhoosh configuration to .zshrc."

# Reload Zsh
exec zsh
echo "All set! Enjoy your Zhooshed terminal."
