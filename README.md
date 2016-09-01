# My dev environment

## Setting up dotfiles

1. Clone the repo (with `--recursive` to get the submodules)

  ```console
  $ git --recursive git@github.com:adriangonz/dotfiles.git
  ```

2. Link `.vimrc` and `.vim`
  
  ```console
  $ ln -s ~/dotfiles/vimrc ~/.vimrc
  $ ln -s ~/dotfiles/vim ~/.vim
  ```

3. Get `brew`
4. Install `tmux`

  ```console
  $ brew install tmux
  ```

6. Install `tmuxinator` (you may need *sudo* if `gem` is installed system-wide)

  ```console
  $ gem install tmuxinator
  ```

7. Link `.tmux.conf` and `tmuxinator`

  ```console
  $ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
  $ ln -s ~/dotfiles/tmuxinator ~/.tmuxinator
  ```

8. Get `Monaco for Powerline` from [here](https://gist.github.com/baopham/1838072/raw/616d338cea8b9dcc3a5b17c12fe3070df1b738c0/Monaco%2520for%2520Powerline.otf) and set it up on `iTerm`
9. Link `.powerline-shell` and the `config.py` file

  ```console
  $ ln -s ~/dotfiles/powerline-shell.config.py ~/dotfiles/powerline-shell/config.py
  $ ln -s ~/dotfiles/powerline-shell ~/.powerline-shell
  ```
10. Generate `powerline-shell` py script:

  ```console
  $ cd ~/dotfiles/powerline-shell
  $ ./install.py
  ```

## Sublime config

1. Link `subl`

  ```console
  $  ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
  ``` 

2. Install [Package Control](https://packagecontrol.io/installation#st3)
3. Install `Material Theme` and `Anaconda`

> TODO: Configure `Anaconda` properly

4. Add these settings

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
    ]
  }
  ```

## Extra stuff

1, Install `bash-completion`

  ```console
  $ brew install bash-completion
  $ brew tap homebrew/completions
  ```
