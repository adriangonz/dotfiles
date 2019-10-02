# Some env vars
export EDITOR=nvim

# Python config 
#
## pyenv config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
#
## virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(which python)
source /usr/bin/virtualenvwrapper.sh

# Import handy functions
export PATH="$HOME/bin:$PATH"
for f in ~/dotfiles/functions/*; do source $f; done

# Locales
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Go config
export GOPATH=~/.golang
export PATH=$PATH:$GOPATH/bin

# KIND config
export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"
