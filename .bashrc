alias config='/usr/bin/git --git-dir=/Users/keenantullis/.cfg/ --work-tree=/Users/keenantullis'

### Git customization #########################################################
alias gs='git status'
alias gd='git diff'
alias gr='git rebase'
alias gf='git fetch -p'

# Alias "g" to "git" and don't break bash completion
alias g=git
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
  || complete -o default -o nospace -F _git g
