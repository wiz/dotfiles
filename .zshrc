# gpg-agent
export SSH_AUTH_SOCK=`gpgconf --list-dirs agent-ssh-socket`

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# gvm
[[ -s "/home/wiz/.gvm/scripts/gvm" ]] && source "/home/wiz/.gvm/scripts/gvm"
