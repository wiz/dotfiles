# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/wiz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# don't confirm history expansion (like !$ or !!)
unsetopt hist_verify
# don't share history between sessions
unsetopt share_history

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
#export LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# retina plz
export GDK_SCALE=2

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# screen
alias sr='screen -r'

# gitk
alias gitk='gitk --all'

# openssl connect
alias stelnet='openssl s_client -CAfile /etc/ssl/certs/ca-certificates.crt -connect'

# git
alias d='git diff'
alias dc='git diff --cached'
alias s='git status'
alias a='git add'

# vim with tmux
function vim_tmux() { tmux new -d "vim $*" \; attach; }
alias vim='vim_tmux'
alias vi='vim_tmux'

# gpg-agent
if [ -z "${SSH_AUTH_SOCK}" ];then
	export SSH_AUTH_SOCK=`gpgconf --list-dirs agent-ssh-socket`
fi

# nvm
export HOME="`cd $HOME && pwd -P`" # workaround symlink bug in nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# gvm
export GVM_DIR="$HOME/.gvm"
[ -s "$GVM_DIR/scripts/gvm" ] && source "$GVM_DIR/scripts/gvm"
gvm use go1.12

