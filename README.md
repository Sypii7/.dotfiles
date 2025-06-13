# Dotfiles for ARCH

Remember to install and configure zsh and p10k manually first.

install zsh
```bash
sudo pacman -S zsh
```
Install [Oh My Zsh](https://ohmyz.sh/)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```
Open `~/.zshrc` and change `ZSH_THEME` to `"powerlevel10k/powerlevel10k"`, then restart zsh with
```bash
exec zsh
```
Configure p10k with
```bash
p10k configure
```

Clone this repo
```bash
git clone https://github.com/Sypii7/.dotfiles
cd .dotfiles
chmod +x install.sh
./install.sh
```
