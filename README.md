# My dev environment

## Setting up dotfiles

* Clone the repo 

  ```console
  $ git --recursive git@github.com:adriangonz/dotfiles.git
  ```

* Get `brew` (just follow [instructions](https://brew.sh))

* Get `Monaco for Powerline` from [here](https://gist.github.com/baopham/1838072/raw/616d338cea8b9dcc3a5b17c12fe3070df1b738c0/Monaco%2520for%2520Powerline.otf) and set it up on `iTerm` and patch it to add [devicons](https://github.com/ryanoasis/nerd-fonts#font-patcher)

  ```console
    $ brew install fontforge
    $ git clone ryanoasis/nerd-fonts
    $ fontforge -script font-patcher ~/Library/Fonts/Monaco%20for%20Powerline.otf
  ```

* Link `.editorconfig`

  ```console
  $ ln -s ~/dotfiles/editorconfig ~/.editorconfig
  ```


## Vim

* Link `.vimrc` and `.vim`
  
  ```console
  $ ln -s ~/dotfiles/vimrc ~/.vimrc
  $ ln -s ~/dotfiles/vim ~/.vim
  ```

* Get latest vim
  
  ```console
  $ brew install vim
  ```

* Install [ripgrep](https://github.com/BurntSushi/ripgrep) and [fzf](https://github.com/junegunn/fzf)

  ```console
  $ brew install ripgrep fzf
  ```

* Install all plugins with `:PlugInstall`

## Tmux

* Install `tmux`

  ```console
  $ brew install tmux
  ```

* Link `.tmux.conf` and `tmuxinator`

  ```console
  $ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
  ```

* Enable pane navigation on tmux as on vim (Based on [https://gist.github.com/mislav/5189704](https://gist.github.com/mislav/5189704))

  ```console
  $ curl -fsSL https://gist.github.com/mislav/5189704/raw/install.sh | bash -e
  ```

## Prompt

We generate our prompt from `vim` (thanks to [`edkolev/promptline.vim`](https://github.com/edkolev/promptline.vim)). That way we ensure the style is consistent accross `vim`/`tmux`/`bash`.

To edit it, checkout the `promptline_preset` variable on `vimrc` and re-generate it as:

```console
$ vim +PromptlineSnapshot functions/prompt.sh
```

## Extra stuff

* Install `bash-completion`

  ```console
  $ brew install bash-completion
  $ brew tap homebrew/completions
  ```
* Set up proper `git lg`

  ```console
  $ git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
  ```
