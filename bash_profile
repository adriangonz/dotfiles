# Some env vars (and setting up PATH)
export GREP_OPTIONS='--color=auto'
export EDITOR=nvim
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

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
## pyenv config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
export VIRTUALENVWRAPPER_PYTHON=$(which python)
source /usr/local/bin/virtualenvwrapper.sh

# Go config
export GOPATH=~/.golang
export PATH=$PATH:$GOPATH/bin

# iOS config
export PATH="$HOME/.fastlane/bin:$PATH"

# NVM config
export NVM_DIR="$HOME/.nvm"
. "/$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Rust config
export PATH="$HOME/.cargo/bin:$PATH"

# Android config
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# Import handy functions
export PATH="$HOME/bin:$PATH"
for f in ~/dotfiles/functions/*; do source $f; done

export CHAMBER_NO_PATHS=1
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Force to use python3
export CLOUDSDK_PYTHON=python

# Update PATH for the Google Cloud SDK
if [ -f ~/google-cloud-sdk/path.bash.inc ]; then
  . ~/google-cloud-sdk/path.bash.inc
fi

# Enable shell command completion for gcloud
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
if [ -f ~/google-cloud-sdk/completion.bash.inc ]; then
  . ~/google-cloud-sdk/completion.bash.inc
fi

# KIND config
export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/kaseyo/.sdkman"
[[ -s "/Users/kaseyo/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/kaseyo/.sdkman/bin/sdkman-init.sh"

# Export GPG Key
export GPG_TTY=\$(tty)

# Set up prompt
eval "$(starship init bash)"
