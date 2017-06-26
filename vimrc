"" Plugins
call plug#begin('~/.vim/plugged')

" Some base settings
Plug 'tpope/vim-sensible'
Plug 'myusuf3/numbers.vim'

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

" Local vimrc
Plug 'embear/vim-localvimrc'

" Linters/etc
Plug 'sbdchd/neoformat'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'

" Handy tools for editing files
Plug 'andrewradev/sideways.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'

" Languages
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'fatih/vim-go'
Plug 'vim-scripts/nginx.vim'
Plug 'wavded/vim-stylus'
Plug 'jmcantrell/vim-virtualenv'

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

"" Sideways
nnoremap <leader>sl :SidewaysLeft<CR>
nnoremap <leader>sr :SidewaysRight<CR>

" Misc

"" numbers.vim
set number

"" sw* files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

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

"" Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

"" vim-go
let g:go_metalinter_autosave = 1

"" Airline settings
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1

""" We generate tmux status bar and our prompt from vim
""" (that way we are consistent in terms of themes/etc)
""" This sets the config for each one
let g:promptline_preset = {
        \'a' : [ promptline#slices#python_virtualenv() ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'x' : [ promptline#slices#vcs_branch() ],
        \'y' : [ promptline#slices#git_status() ],
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
        \ 'dir': 'vendor$\|node_modules$\|DS_Store$\|\.git$\|\.coffee$\|\.tmp$\|bower_components$'}
let g:ctrlp_follow_symlinks = 1

"" Enable color
set t_Co=256
set background=dark
colorscheme solarized

"" Shared clipboard
set clipboard=unnamed

