# My dev environment

## Setting up dotfiles

* Clone the repo (with `--recursive` to get the submodules)

  ```console
  $ git --recursive git@github.com:adriangonz/dotfiles.git
  ```

* Link `.vimrc` and `.vim`
  
  ```console
  $ ln -s ~/dotfiles/vimrc ~/.vimrc
  $ ln -s ~/dotfiles/vim ~/.vim
  ```

* Get `brew`
* Install `tmux`

  ```console
  $ brew install tmux
  ```

* Install `tmuxinator` (you may need *sudo* if `gem` is installed system-wide)

  ```console
  $ gem install tmuxinator
  ```

* Link `.tmux.conf` and `tmuxinator`

  ```console
  $ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
  $ ln -s ~/dotfiles/tmuxinator ~/.tmuxinator
  ```

* Enable pane navigation on tmux as on vim (Based on [https://gist.github.com/mislav/5189704](https://gist.github.com/mislav/5189704))

  ```console
  $ curl -fsSL https://gist.github.com/mislav/5189704/raw/install.sh | bash -e
  ```

* Get `Monaco for Powerline` from [here](https://gist.github.com/baopham/1838072/raw/616d338cea8b9dcc3a5b17c12fe3070df1b738c0/Monaco%2520for%2520Powerline.otf) and set it up on `iTerm`

* Link `.editorconfig`

  ```console
  $ ln -s ~/dotfiles/editorconfig ~/.editorconfig
  ```

## Prompt

We generate our prompt from `vim` (thanks to [`edkolev/promptline.vim`](https://github.com/edkolev/promptline.vim)). That way we ensure the style is consistent accross `vim`/`tmux`/`bash`.

To edit it, checkout the `promptline_preset` variable on `vimrc` and re-generate it as:

```console
$ vim +PromptlineSnapshot functions/prompt.sh
```

## Sublime config

* Link `subl`

  ```console
  $  ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
  ``` 

* Install [Package Control](https://packagecontrol.io/installation#st3)
* Install `Material Theme`, `Anaconda` and `EditorConfig`

> TODO: Configure `Anaconda` properly

* Add these settings as default

  ```json
  {
    "tab_size": 4,
    "translate_tabs_to_spaces": true,
    "file_exclude_patterns":
    [
        ".DS_Store",
        "*.pid",
        "*.pyc"
    ],
    "folder_exclude_patterns":
    [
        ".git",
        "__pycache__",
    ],
    “scroll_past_end”: true
  }
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
