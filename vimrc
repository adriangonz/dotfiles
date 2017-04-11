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

" Git
Plug 'tpope/vim-fugitive'

" Linters/etc
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'

" Handy tools for editing files
Plug 'andrewradev/sideways.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'

" Languages
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Initialize plugin system
call plug#end()

" Keymaps

"" Re-map leader
let mapleader = "\<Space>"

"" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"" CtrlSF
nnoremap <leader>sf :CtrlSF<Space>

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
nnoremap <leader>so :OpenSession<Space>

" Misc

"" Vim sessions
let g:session_autoload = "no"
let g:session_autosave = "yes"
let g:session_autosave_periodic = 1
let g:session_autosave_silent = 1
set exrc

"" JSX
let g:jsx_ext_required = 0

"" CtrlSF
let g:ctrlsf_ackprog = 'ack'

"" Prettier support
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd BufWritePre *.js :normal gggqG

"" Airline settings
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1

""" We generate tmux status bar and our prompt from vim
""" (that way we are consistent in terms of themes/etc)
""" This sets the config for each one
let g:promptline_preset = {
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

"" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

"" CtrlP Config
let g:ctrlp_dotfiles = 1
let g:ctrlp_custom_ignore = {
        \ 'dir': 'node_modules\|DS_Store\|git\|\.coffee'}

"" Enable color
syntax on
set background=dark
colorscheme solarized

"" Enable indentation
filetype indent on
filetype plugin on
set autoindent

set number
set nobackup
set noswapfile

set rtp+=~/.vim/plugged/powerline/powerline/bindings/vim
set laststatus=2
set t_Co=256

set clipboard=unnamed

set secure
