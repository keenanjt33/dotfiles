alias weather='curl wttr.in/@umich.edu'

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/keenantullis/google-cloud-sdk/path.bash.inc' ]; then source '/Users/keenantullis/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/keenantullis/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/keenantullis/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Iterm fix: https://github.com/christoomey/vim-tmux-navigator/issues/71
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\177/' > $TERM.ti
tic $TERM.ti
