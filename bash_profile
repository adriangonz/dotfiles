# Some env vars (and setting up PATH)
export GREP_OPTIONS='--color=auto'
export EDITOR=vim
export PATH="$PATH:/usr/local/sbin"
export PATH="~/.gem/ruby/2.0.0/bin:$PATH"
export PATH="~/.vim/bundle/powerline/scripts:$PATH"

_update_ps1() {
    export PS1="$(~/Stuff/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}
           
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh

# Config bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# Some alias...
alias mdtool="/Applications/Xamarin\ Studio.app/Contents/MacOS/mdtool"
alias ls="ls -G"

