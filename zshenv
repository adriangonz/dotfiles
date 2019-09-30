# Some env vars (and setting up PATH)
export GREP_OPTIONS='--color=auto'
export EDITOR=vim


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
