#!/bin/bash

echo "Enabling superuser commands..."
sudo echo "done."

GIT_USER=RaisonBlue

# ZSH Installation
sudo pacman -S zsh yay git kitty firfox gedit --noconfirm
yay -Syu --noconfirm
sudo chsh -s /bin/zsh
sudo chsh -s /bin/zsh $USER
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/i3/config" > ~/.i3/config
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/.profile" > ~/.profile
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zprofile" > ~/.zprofile
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zaliases" > ~/.zaliases
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zshrc" > ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
