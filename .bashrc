alias config='/usr/bin/git --git-dir=/Users/keenantullis/.cfg/ --work-tree=/Users/keenantullis'

# nvm stuff
export NVM_DIR="$HOME/.nvm"
NVM_HOMEBREW="/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_HOMEBREW" ] && \. "$NVM_HOMEBREW"
[ -x "$(command -v npm)" ] && export NODE_PATH=$NODE_PATH:`npm root -g`

### Git customization #########################################################
alias gs='git status'
alias gd='git diff'
alias gr='git rebase'
alias gf='git fetch -p'

# Alias "g" to "git" and don't break bash completion
alias g=git
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
  || complete -o default -o nospace -F _git g

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
