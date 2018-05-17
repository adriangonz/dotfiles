# Some env vars (and setting up PATH)
export GREP_OPTIONS='--color=auto'
export EDITOR=nvim
export PATH="$PATH:/usr/local/sbin"

# Config bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Some alias...
alias mdtool="/Applications/Xamarin\ Studio.app/Contents/MacOS/mdtool"
alias ls="ls -G"

# Ruby config
export PATH="~/.gem/ruby/2.0.0/bin:$PATH"

# Python config 
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# Go config
export GOPATH=~/.golang
export PATH=$PATH:$GOPATH/bin

# iOS config
export PATH="$HOME/.fastlane/bin:$PATH"

# NVM config
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Rust config
export PATH="$HOME/.cargo/bin:$PATH"

# Android config
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# Import handy functions
export PATH="$HOME/bin:$PATH"
for f in ~/dotfiles/functions/*; do source $f; done
