#!/bin/bash

function silent_install() {
  echo "Installing $1..."
  yay -Syu --noconfirm $1 1>/dev/null 2>/dev/null
}

echo "Enabling superuser commands..."
sudo echo "done."

GIT_USER=RaisonBlue

sudo pacman -S yay --noconfirm

# Machine optim
yay -Syu intel-ucode systemd-swap ttf-ms-fonts 

# Video codecs
yay -Syu exfat-utils fuse-exfat a52dec faac faad2 flac jasper \
lame libdca libdv gst-libav libmad libmpeg2 libtheora libvorbis \
libxv wavpack x264 xvidcore gstreamer0.10-plugins flashplugin \
libdvdcss libdvdread libdvdnav gecko-mediaplayer dvd+rw-tools \
dvdauthor dvgrab

# Improve download debit (machine must have >= 4GO RAM)
echo net.ipv4.tcp_rmem=40960 873800 62914560 | sudo tee -a /etc/sysctl.d/99-sysctl.conf
echo net.core.rmem_max=25000000 | sudo tee -a /etc/sysctl.d/99-sysctl.conf
sudo sysctl -p /etc/sysctl.d/99-sysctl.conf

# Printer Support
yay -Syu manjaro-printer cups cups-filters cups-pdf cups-pk-helper system-config-printer

# Install my favorite softwares
yay -Syu zsh git kitty firefox gedit visual-studio-code-bin spotify zip unzip docker blueman \
docker-compose duc filezilla flameshot imagemagick nitrogen telegram-desktop vlc --noconfirm

# Add nuclear capacity with Zplugin shell
# Zsh with zplugin; Configure special keys bindings (history, Suppr, end, etc.); 
# History to be 10000 entries, persisted and shared between all terms.
sudo chsh -s /bin/zsh
sudo chsh -s /bin/zsh $USER
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/i3/config" > ~/.i3/config
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/.profile" > ~/.profile
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zprofile" > ~/.zprofile
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zaliases" > ~/.zaliases
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zshrc" >> ~/.zshrc
sudo pacman -S otf-fira-code --noconfirm
mkdir -p ~/.config/fontconfig
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/fonts.conf" > ~/.config/fontconfig/fonts.conf
