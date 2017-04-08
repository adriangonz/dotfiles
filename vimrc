"" Plugins
call plug#begin('~/.vim/plugged')

" Quick switch between files (like cmd+P on Sublime)
Plug 'ctrlpvim/ctrlp.vim'

" Powerline footer (tmux also depends on this)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'

" Solarized schema
Plug 'altercation/vim-colors-solarized'

" Tmux/Vim integration (seamless navigation between panes)
Plug 'christoomey/vim-tmux-navigator'

" Respect editorconfig's files
Plug 'editorconfig/editorconfig-vim'

" Easier handling of sessions (projects on Sublime)
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

" Initialize plugin system
call plug#end()

" Keymaps

"" Re-map leader
let mapleader = "\<Space>"

"" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"" Pane navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" Disable arrows to be cool
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"" Vim sessions
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_autosave_periodic = 5
nnoremap <leader>so :OpenSession 

" Misc

"" Airline settings
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

""" We generate tmux status bar and our prompt from vim
""" (that way we are consistent in terms of themes/etc)
""" This sets the config for each one
let g:promptline_preset = {
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

"" Enable color
syntax on
set background=dark
colorscheme solarized

"" Enable indentation
filetype indent on
set autoindent

set number
set nobackup

set rtp+=~/.vim/plugged/powerline/powerline/bindings/vim
set laststatus=2
set t_Co=256

set clipboard=unnamed
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules

