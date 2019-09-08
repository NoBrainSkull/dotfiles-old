#!/bin/bash

echo "Enabling superuser commands..."
sudo echo "done."

GIT_USER = RaisonBlue

# ZSH Installation
sudo pacman -S zsh yay git kitty firfox gedit --noconfirm
yay -Syu --noconfirm
sudo chsh -s /bin/zsh
chsh -s /bin/zsh
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/i3/config" > ~/.i3/config
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/.profile" > ~/.profile
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zprofile" > ~/.zprofile
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zaliases" > ~/.zaliases
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zshrc" > ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
source ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comp} )) && _comps[zplugin]=_zplugin
zplugin self-update
zplugin snippet OMZ::lib/git.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
setopt promptsubst
zplugin light denysdovhan/spaceship-prompt

sudo pacman -S otf-fira-code --noconfirm
mkdir ~/.config/fontconfig
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/font.conf" > ~/.config/fontconfig/fonts.conf
