#!/bin/bash

function silent_install() {
  echo "Installing $1..."
  yay -Syu --noconfirm $1 1>/dev/null 2>/dev/null
}

echo "Enabling superuser commands..."
sudo echo "done."

GIT_USER=RaisonBlue

# Install my favorite softwares
softwares=('zsh' 'git' 'kitty' 'firefox' 'gedit' 'visual-studio-code-bin' 'spotify' 'zip' 'unzip' 'docker' 'blueman' 'docker-compose' 'duc' 'filezilla' 'flameshot' 'imagemagick' 'nitrogen' 'telegram-desktop')
for s in $softwares;
do silent_install $s;
done


# Add nuclear capacity with Zplugin shell
sudo pacman -S yay --noconfirm
yay -Syu zsh git kitty firefox gedit --noconfirm
sudo chsh -s /bin/zsh
sudo chsh -s /bin/zsh $USER
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/i3/config" > ~/.i3/config
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/.profile" > ~/.profile
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zprofile" > ~/.zprofile
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zaliases" > ~/.zaliases
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zshrc" >> ~/.zshrc
sudo pacman -S otf-fira-code --noconfirm
mkdir ~/.config/fontconfig
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/font.conf" > ~/.config/fontconfig/fonts.conf
