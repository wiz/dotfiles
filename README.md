# wiz's dotfiles for daily development use

* Awesome WM config
* neovim + plugins
* nodejs/npm (nvm)
* golang (gvm)
* zsh prompt
* wallpaper

## Installation

For example, starting with a fresh Ubuntu 18 LTS lite install

# update latest stuff
```
apt-get update
apt-get upgrade
```

# install vm tools
```
apt-get install open-vm-tools open-vm-tools-desktop
```

# install basic stuff
```
apt-get install zsh vim screen git gcc terminator awesome awesome-extra compton feh mutt gnupg2 pcscd scdaemon pinentry-gtk2
```

# install dotfiles
```
cd
git clone --recursive https://github.com/wiz/dotfiles ~/.dotfiles
ln -s ~/.dotfiles/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -s ~/.dotfiles/.gitconfig
ln -s ~/.dotfiles/.zshrc
ln -s ~/.dotfiles/.config
```

### install neovim with python
```
sudo apt-get install python python3 python-pip python3-pip
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get install -y neovim
```

