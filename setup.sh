#!/bin/bash

if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

git clone https://github.com/hannadrehman/dotfiles.git ~/dotfiles

cd ~/dotfiles

brew install vim tmux zsh git alacritty

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symlink configuration files
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim/ ~/.config/nvim/
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/zshell/.zshrc ~/.zshrc
ln -sf ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

source ~/.zshrc

echo "Dotfiles setup completed!"
