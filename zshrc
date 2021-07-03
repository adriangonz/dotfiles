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
alias tb='taskbook'
alias k='kubectl'

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
antigen bundle gcloud
antigen bundle zsh
export ASDF_DIR=/opt/asdf-vm 
antigen bundle asdf
antigen bundle networkmanager
antigen bundle bluetoothctl
antigen bundle gcloud
antigen bundle istioctl
# antigen bundle vi-mode

#
#
## Other bundles
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
#
## Apply
antigen apply

# Python config 
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(asdf which python)
source $(asdf where python)/bin/virtualenvwrapper.sh
export PYTHONBREAKPOINT=ipdb.set_trace

# Java config
. ~/.asdf/plugins/java/set-java-home.zsh

# Go / K8s config
export KO_DOCKER_REPO=kind.local
