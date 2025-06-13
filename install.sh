#!/bin/bash

# Update system
sudo pacman -Syu --noconfirm

# Install yay if missing
if ! sudo pacman -Q "yay"; then 
  cd $HOME
  sudo pacman -S --needed base-devel git
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd $HOME
  echo "yay has been installed succesfully"
fi

# Fonts
sudo pacman -S $(pacman -Ssq nerd-fonts)
sudo pacman -S $(pacman -Ssq noto-fonts)

# themes
if [[ ! -d ~/.themes ]]; then
  sudo mkdir -p $HOME/.themes
fi
sudo cp -r $HOME/.dotfiles/.themes/* $HOME/.themes/


# Zsh history file
if [[ ! -f ~/.zsh_history ]]; then
  touch $HOME/.zsh_history
fi


# File with programs and dependencies
list="dependencies.txt"

if [ ! -f "$list" ];then
  cd $HOME/.dotfiles
  list="dependencies.txt"
fi

while IFS= read -r pkg; do
  if  [[ -z "$pkg" || "pkg" =~ ^# ]] then
    continue
  fi
    
  if ! sudo pacman -Q "$pkg"; then
    echo "Installing $pkg..."
    sudo pacman -S --noconfirm "$pkg"
    echo "$pkg has been installed"
  else
    echo "$pkg is already installed, skipping it."
  fi
done < "$list"


# ZSH plugins
dir="/usr/share/zsh/plugins"

if [ ! -d "$dir" ]; then
  sudo mkdir -p "$dir"
  echo "created $dir directory"
fi

plugins=(
  "zsh-autosuggestions"
  "zsh-syntax-highlighting"
  "zsh-sudo"
)

for plugin in "${plugins[@]}"; do 
 if [[ ! -d "$dir/$plugin" ]]; then
   sudo mkdir -p "$dir/$plugin"
   sudo cp -r "$HOME/.dotfiles/zsh_plugins/$plugin" "$dir/"
   echo "$plugin installed"
 fi
done


# simple sddm theme, now i use Ly as greeter
#if [ ! -d "/usr/share/sddm/themes" ]; then
#  sudo mkdir -p "/usr/share/sddm/themes"
#  sudo cp -r "/home/sypii/.dotfiles/simple-sddm" "/usr/share/sddm/themes/"
#  echo "simple-sddm theme installed."
#fi


