#!/bin/bash

if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install vim tmux zsh git alacritty

echo "Make sure to install OhMyZsh";

# Symlink configuration files
mkdir -p ~/.config/alacritty

ln -sf "$(pwd)/nvim" ~/.config/nvim
ln -sf "$(pwd)/tmux/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/zshell/.zshrc" ~/.zshrc
ln -sf "$(pwd)/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml

source ~/.zshrc

echo "Dotfiles setup completed!"
