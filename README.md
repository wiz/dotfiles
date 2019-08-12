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

### install vm tools
```
apt-get install -y open-vm-tools open-vm-tools-desktop
```

### install basic stuff
```
apt-get install -y zsh vim screen git gcc terminator awesome awesome-extra compton feh mutt gnupg2 pcscd scdaemon pinentry-gtk2
```

### install dotfiles
```
cd
git clone --recursive https://github.com/wiz/dotfiles ~/.dotfiles
ln -s ~/.dotfiles/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -s ~/.dotfiles/.gitconfig
ln -s ~/.dotfiles/.config
```

### install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### install oh-my-zsh theme powerlevel9k
```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | zsh
(cd ~/.dotfiles && git checkout .zshrc)
source .zshrc
nvm install node
```

### install gvm
```
sudo apt-get install -y curl git mercurial make binutils bison gcc build-essential
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
(cd ~/.dotfiles && git checkout .zshrc)
source .zshrc
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.12
gvm use go1.12
```

### install neovim with python
```
sudo apt-get install -y python python3 python-pip python3-pip
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get install -y neovim
pip3 install neovim
pip3 install pynvim
```

### install vim-plug
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### re-login
```
exit
```

### in a fresh new shell, check everything
```
which node
which npm
which go
which nvim
```

### if all good, proceed to install plugins 
nvim
:PlugInstall
```

