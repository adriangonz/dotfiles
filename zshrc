unsetopt beep

# History config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Vim bindings
bindkey -v

zstyle :compinstall filename '/home/agm/.zshrc'

# Completions 
autoload -Uz compinit
compinit

# Alias
alias grep='grep --color=auto'

# Oh My Zsh plugins
plugins=(
  git
)
