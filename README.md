# Dotfiles for ARCH

Remember to install and configure zsh and p10k manually first.

install zsh
```bash
sudo pacman -S zsh
```
Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```
restart zsh with
```bash
exec zsh
```
Configure p10k with
```bash
p10k configure
```

Clone this repo
```bash
cd
git clone https://github.com/Sypii7/.dotfiles
cd .dotfiles
chmod +x install.sh
./install.sh
```
