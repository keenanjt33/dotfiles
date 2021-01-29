# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:$HOME/Library/Python/3.7/bin:$PATH:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH=$PATH:'/usr/local/go/bin'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias py='python3.7'

# todoist cli (https://github.com/sachaos/todoist)
# source "$HOME/.oh-my-zsh/custom/todoist_function.sh"

# nvm sruff
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

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="theunraveler"
# ZSH_THEME="geometry/geometry"
# ZSH_THEME="miekg/lean"

# https://github.com/itchyny/lightline.vim
# export TERM=xterm-256color

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
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    lean
    z
    fzf
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'    
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# source /usr/share/fzf/key-bindings.zsh
export FZF_COMPLETION_TRIGGER='##' # change ** to whatever you like

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

alias n='cd ~/Documents/notes'

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# # load zgen
# source "${HOME}/.zgen/zgen.zsh"
#
# # if the init script doesn't exist
# if ! zgen saved; then
#
#     # specify plugins here
#     zgen oh-my-zsh
#     git
#     zsh-syntax-highlighting
#     zsh-autosuggestions
#     lean
#     z
#
#     # generate the init script from plugins above
#     zgen save
# fi
#
# zgen load miekg/lean

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# function homestead() {
#     ( cd ~/Homestead && vagrant $* )
# }
#
# removecontainers() {
#     docker stop $(docker ps -aq)
#     docker rm $(docker ps -aq)
# }
#
# armageddon() {
#     removecontainers
#     docker network prune -f
#     docker rmi -f $(docker images --filter dangling=true -qa)
#     docker volume rm $(docker volume ls --filter dangling=true -q)
#     docker rmi -f $(docker images -qa)
# }

export GOPATH=$HOME/gopath
export PATH=$GOPATH:$GOPATH/bin:$PATH
