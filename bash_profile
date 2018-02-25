# Some env vars (and setting up PATH)
export GREP_OPTIONS='--color=auto'
export EDITOR=nvim
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export PATH="~/.gem/ruby/2.0.0/bin:$PATH"

# Config bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# Some alias...
alias mdtool="/Applications/Xamarin\ Studio.app/Contents/MacOS/mdtool"
alias ls="ls -G"

# virtualenvwrapper config
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
source /usr/local/bin/virtualenvwrapper.sh

export GOPATH=~/.golang
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# NVM config
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Import handy functions
for f in ~/dotfiles/functions/*; do source $f; done

export PATH="$HOME/.cargo/bin:$PATH"

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

eval "$(pyenv init -)"
