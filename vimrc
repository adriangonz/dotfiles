"" Plugins
call plug#begin('~/.vim/plugged')

" Some base settings
Plug 'tpope/vim-sensible'
Plug 'myusuf3/numbers.vim'
Plug 'romainl/vim-qf'

" Quick switch between files (like cmd+P on Sublime)
Plug 'junegunn/fzf'

" Powerline footer (tmux also depends on this)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"" Temporarily while https://github.com/edkolev/promptline.vim/pull/79
"" doesn't get merged
Plug 'adriangonz/promptline.vim', { 'branch': 'kubernetes-support' }
Plug 'edkolev/tmuxline.vim'

" Nord schema
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
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" Local vimrc
Plug 'embear/vim-localvimrc'

" Linters/etc
Plug 'Yggdroot/indentLine'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Handy tools for editing files
Plug 'andrewradev/sideways.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-abolish'
Plug 'kshenoy/vim-signature'
Plug 'tmhedberg/SimpylFold'
Plug 'godlygeek/tabular'
Plug 'lingnand/pandoc-preview.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'lukas-reineke/lsp-format.nvim'

" Languages
let g:polyglot_disabled = ['latex']
Plug 'sheerun/vim-polyglot'
Plug 'amadeus/vim-mjml'
Plug 'kchmck/vim-coffee-script'
Plug 'lervag/vimtex'
Plug 'djpohly/vim-gvpr'
" Plug 'szymonmaszke/vimpyter'
" Plug 'plasticboy/vim-markdown'
" Plug 'artur-shaik/vim-javacomplete2'
Plug 'neoclide/jsonc.vim'
Plug 'towolf/vim-helm'
Plug 'google/vim-jsonnet'

" Autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'sirver/ultisnips'
Plug 'ervandew/supertab'
Plug 'folke/trouble.nvim'
Plug 'creativenull/efmls-configs-nvim'

" Initialize plugin system
call plug#end()

" Keymaps

"" Re-map leader
let g:mapleader = "\<Space>"

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

"" Latex
nnoremap <leader>tc :VimtexCompile<CR>

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
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 1
let g:session_autosave_silent = 1
set exrc

"" LaTex and Markdown
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
  \ 'sections' : {
  \   'sections' : [
  \     'part',
  \     'chapter',
  \     'section',
  \     'subsection',
  \     'paragraph',
  \     'subparagraph',
  \   ]
  \ },
  \}
let g:tex_conceal = ''
set conceallevel=0
" let g:vim_markdown_math = 1
" .tex file seem to be consistently getting filetex (instead of tex)
au BufRead,BufNewFile *.tex setfiletype tex

"" JSX
let g:jsx_ext_required = 0

"" XML
let g:xml_syntax_folding=1

"" CtrlSF
let g:ctrlsf_ackprog = 'rg'

"" Airline settings
let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0

""" We generate tmux status bar and our prompt from vim
""" (that way we are consistent in terms of themes/etc)
""" This sets the config for each one
let g:promptline_preset = {
        \'b' : [ promptline#slices#kubernetes() ],
        \'c' : [ promptline#slices#cwd({ 'dir_limit': 2 }) ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

let g:tmuxline_powerline_separators = 1

" Autocompletion config (CoC)
let g:SuperTabDefaultCompletionType = '<c-n>'
set completeopt-=preview

" Autoformat on save
autocmd BufWritePre * lua vim.lsp.buf.format()

lua << EOF
-- Setup language servers.
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local black = require('efmls-configs.formatters.black')
local prettier = require('efmls-configs.formatters.prettier')
local gofmt = require('efmls-configs.formatters.gofmt')
local goimports = require('efmls-configs.formatters.goimports')

local languages = {
  python = { black },
  javascript = { prettier },
  jsonc = { prettier },
  go = { gofmt, goimports }
}


-- Helper method to find Python path
local path = util.path
local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv with project's name.
  local workspace_name = workspace:match("^.+/(.+)$")
  local home = vim.fn.expand("~")
  local virtualenv_path = path.join(home, ".virtualenvs", workspace_name)
  local is_dir = path.is_dir(virtualenv_path)
  if path.is_dir(virtualenv_path) then
     local venv_python = path.join(virtualenv_path, "bin", "python")
     return venv_python
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

vim.lsp.set_log_level("debug")
lspconfig.gopls.setup{}
lspconfig.pyright.setup {
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end
}
lspconfig.esbonio.setup {}
lspconfig.efm.setup {
  filetypes = vim.tbl_keys(languages),
  settings = {
    languages = languages
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
EOF

"" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

"" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

""" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir=$HOME."/dotfiles/snips"
let g:UltiSnipsSnippetDirectories=[$HOME."/dotfiles/snips"]
let g:UltiSnipsEditSplit="vertical"

"" indentLine
autocmd FileType markdown let g:indentLine_enabled=0
autocmd FileType tex let g:indentLine_enabled=0

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

"" pandoc-preview.vim config
let g:pandoc_preview_pdf_cmd = "zathura" 

"" vim-qf
let g:qf_mapping_ack_style = 1
nmap <F5> <Plug>(qf_qf_toggle)
nmap <F6> <Plug>(qf_loc_toggle)

"" Shared clipboard
" set clipboard^=unnamed
" set clipboard+=unnamedplus
set clipboard=unnamedplus
set foldmethod=syntax
" set spell

