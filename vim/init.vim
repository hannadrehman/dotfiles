" Automatic installation of vim-plug, if it's not available
" ----------------------------------------

if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"-----------------------------------------
" Automatically install missing plugins on startup
"-----------------------------------------

autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
"-----------------------------------------

silent! if plug#begin('~/.nvim/plugged')


"-----------------------------------------------------
"	PLUGINS
"-----------------------------------------------------

Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'cocopon/iceberg.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'takac/vim-hardtime'

call plug#end()
"----------------------------------------------------
"-------lua imports

lua require('lsp-config')
lua require('compe-config')
lua require('telescope-config')


"-----------------------------------------------------
"       VARIABLES
"-----------------------------------------------------


"Editor confing

let mapleader = ","
set nohlsearch
set nocursorline
set ic
set relativenumber
set number
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
set diffopt+=vertical
set hidden
set smartindent
set updatetime=50
set lazyredraw
set ttyfast
let loaded_netrwPlugin = 1
set smartindent
set nobackup
set nowritebackup
set updatetime=300
set timeoutlen=500
set clipboard=unnamedplus
set spell spelllang=en_us
set splitright

"Colorscheme
set background=dark
colorscheme iceberg

"term colors
set termguicolors

"linter
let g:ale_linter_aliases = {'jsx': ['javascript']}
let g:ale_linters = { 'javascript': ['eslint', 'prettier'], 'javascriptreact': ['eslint', 'prettier'],'html':['prettier'], 'json':['prettier'], 'go': ['gopls']}
let g:ale_fixers = {'javascript': ['eslint', 'prettier'],'javascriptreact': ['eslint', 'prettier'],'html':['prettier'],  'json':['prettier'], 'rust': ['rustfmt'],'go': ['gofmt']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''

"ariline
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:javascript_plugin_jsdoc = 1

" nerdcommenter
 let g:NERDCompactSexyComs = 1

 "----------Hard time-----------------
 let g:hardtime_default_on = 1

 "----------------------nvim-tree------------------------
let g:nvim_tree_side = 'right'
let g:nvim_tree_width = 60
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 0
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_tab_open = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_group_empty = 1
let g:nvim_tree_disable_window_picker = 1
let g:nvim_tree_icon_padding = ' '
let g:nvim_tree_update_cwd = 1
let g:nvim_tree_hide_dotfiles = 0
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

"-----------------------------------------------------
"      AUTO COMMANDS
"-----------------------------------------------------
filetype plugin on
filetype plugin indent on
autocmd FileType taglist set norelativenumber
autocmd FileType json syntax match Comment +\/\/.\+$+
au BufReadPost *
     \ if line("'\"") > 1 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
autocmd BufEnter * set relativenumber

"-----------------------------------------------------
"       MAPPINGS
"-----------------------------------------------------

"-------------TELESCOPE-------------------------------

nnoremap <leader>ff <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').help_tags()<cr>

"-------------------File explorer-------------------------
nnoremap <C-p> :NvimTreeFindFile<CR>
nnoremap n nzzzv
nnoremap N nzzzv

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc> :m .+1<CR>==
inoremap <C-k> <esc> :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

"------------------Common Remaps-----------------------
nnoremap Y y$

"opened buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>


"disabled movements
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


"custom fns
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()


"----------------split screen navigation---------------------
endif
