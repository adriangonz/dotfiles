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

# Antigen config
## TODO: Make it cross-platform
source /usr/share/zsh/share/antigen.zsh
#
## Load the oh-my-zsh's library.
antigen use oh-my-zsh
#
## Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
#
#
## Other bundles
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme denysdovhan/spaceship-prompt
#
## Apply
antigen apply
