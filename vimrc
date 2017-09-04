"" Plugins
call plug#begin('~/.vim/plugged')

" Some base settings
Plug 'tpope/vim-sensible'
Plug 'myusuf3/numbers.vim'

" Quick switch between files (like cmd+P on Sublime)
Plug 'junegunn/fzf'

" Powerline footer (tmux also depends on this)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'

" Solarized schema
Plug 'arcticicestudio/nord-vim'

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
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'

" Handy tools for editing files
Plug 'andrewradev/sideways.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'

" Languages
Plug 'sheerun/vim-polyglot'

" Autocomplete
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'calebeby/ncm-css'
Plug 'ervandew/supertab'

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

"" Enable color
set termguicolors
set background=dark
colorscheme nord

""" Fix for true color https://github.com/lifepillar/vim-solarized8#troubleshooting
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"" numbers.vim
set number

"" NERDCommenter
let g:NERDSpaceDelims = 1

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
let g:airline_theme = 'deus'
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

"" ALE config
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'html': [],
\   'javascript': ['eslint'],
\   'go': ['gofmt', 'gometalinter'],
\}
let g:ale_go_gometalinter_options = '--fast'

"" Neoformat config
let g:neoformat_javascript_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin'],
    \ 'stdin': 1
    \ }

"" Autocomplete config
let g:SuperTabDefaultCompletionType = "<c-n>"
set completeopt-=preview

"" fzf config
nmap <C-p> :FZF<cr>
imap <c-x><c-l> <plug>(fzf-complete-line)

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
  \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

"" Shared clipboard
set clipboard^=unnamed
set nowrap

