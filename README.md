# wiz's dotfiles for daily development use

* Awesome WM config
* neovim + plugins
* nodejs/npm (nvm)
* golang (gvm)
* zsh prompt
* wallpaper

## Installation

For example, starting with a fresh Ubuntu 18 LTS lite install

### update latest stuff
```
apt-get update
apt-get upgrade
```

### install vm tools (optional)
```
sudo apt-get install -y open-vm-tools open-vm-tools-desktop
sudo apt-get install -y terminator awesome awesome-extra compton feh mutt gnupg2 pcscd scdaemon pinentry-gtk2
```

### install basic stuff
```
sudo apt-get install -y zsh vim screen curl git mercurial make binutils bison gcc build-essential
sudo apt-get install -y python-dev python-pip
sudo apt-get install -y python3-dev python3-pip
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get install -y neovim
```

### set python3 as default
```
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1
```

### install dotfiles
```
cd
git clone --recursive https://github.com/wiz/dotfiles ~/.dotfiles
ln -s ~/.dotfiles/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -s ~/.dotfiles/.gitconfig
ln -s ~/.dotfiles/.config
```

### init zsh
```
rm .zshrc
ln -s ~/.dotfiles/.zshrc
(cd ~/.dotfiles && git checkout .zshrc)
source .zshrc
```

### install nvm
```
unset NVM_DIR
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | zsh
(cd ~/.dotfiles && git checkout .zshrc)
source .zshrc
nvm install node
```

### install gvm
```
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
(cd ~/.dotfiles && git checkout .zshrc)
source .zshrc
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.12
gvm use go1.12
```

### install neovim and pynvim
```
pip2 install neovim --user
pip2 install pynvim --user
pip3 install neovim --user
pip3 install pynvim --user
```

### install vim-plug
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### open a fresh new shell, check everything
```
zsh
which node
which npm
which go
which nvim
```

### open nvim and check everything
```
nvim
:CheckHealth
```
### if all good, proceed to install plugins 
```
:PlugInstall
:UpgradeRemotePlugins
```

### ruby
```
apt-get install ruby ruby-dev
gem install bundler
gem update --system
```
