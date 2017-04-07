call plug#begin('~/.vim/plugged')

Plug 'powerline/powerline'
Plug 'altercation/vim-colors-solarized'

" Initialize plugin system
call plug#end()

set backspace=2 
syntax on
filetype indent on
set autoindent
set number
set background=dark

colorscheme solarized

set nobackup

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set rtp+=~/.vim/plugged/powerline/powerline/bindings/vim
set laststatus=2
set t_Co=256

set clipboard=unnamed

" NERDTree Config

let NERDTreeIgnore = ['\.pyc$']
