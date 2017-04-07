"" Plugins
call plug#begin('~/.vim/plugged')

" Quick switch between files (like cmd+P on Sublime)
Plug 'ctrlpvim/ctrlp.vim'

" Powerline footer (tmux also depends on this)
Plug 'powerline/powerline'

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

" Syntax defaults

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

