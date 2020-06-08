
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

Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim',{'tag': '*', 'do': { -> coc#util#install()}}
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'preservim/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"-----------------------------------------------------
"       VARIABLES
"-----------------------------------------------------

"Editor confing

let mapleader = ","
set nohlsearch
set nocursorline
set ic
set number relativenumber
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

"Colorscheme
colorscheme gruvbox
set bg=dark

"term colors
set termguicolors

"linter
let g:ale_linter_aliases = {'jsx': ['javascript']}
let g:ale_linters = {'javascript': ['eslint', 'prettier'],'javascriptreact': ['eslint', 'prettier'],'html':['prettier']}
let g:ale_fixers = {'javascript': ['eslint', 'prettier'],'javascriptreact': ['eslint', 'prettier'],'html':['prettier']}
"let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

let g:NERDTreeWinSize=45

"ariline
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

let g:javascript_plugin_jsdoc = 1


"-----------------------------------------------------
"      AUTO COMMANDS
"-----------------------------------------------------
filetype plugin on
filetype plugin indent on
autocmd FileType nerdtree set norelativenumber
autocmd FileType taglist set norelativenumber
autocmd FileType json syntax match Comment +\/\/.\+$+
au BufReadPost *
     \ if line("'\"") > 1 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"-----------------------------------------------------
"       MAPPINGS
"-----------------------------------------------------

"-------------FILES LOOKUP-----------------------------------
nnoremap <silent> <c-k> :Files<cr>
nnoremap <silent> <c-l> :History<cr>
nnoremap <silent> <c-p> :GFiles<cr>
nnoremap <Leader>lb :Buffers<cr>

"-------------GIT-------------------------------------
nnoremap <Leader>gcs :Commits<cr>
nnoremap <Leader>gs :GFiles?<cr>
nnoremap <Leader>gd :Gdiffsplit<cr>
nnoremap <Leader>gb :Git blame<cr>
nnoremap <Leader>gc :Git commit:<cr>

"-------------SEARCHING-------------------------------
nnoremap <Leader>f :BLines<cr>
nnoremap <Leader>F :Ag<cr>
nnoremap <Leader>t :BTags<cr>
nnoremap <Leader>T :Tags<cr>

"-------------AUTOCOMPLETE----------------------------
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <leader>lg <Plug>(coc-rename)

"-------------Shortcuts-------------------------------
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <leader>c <ESC><cr>
inoremap <leader>s <ESC>:w<cr>
nmap <leader>s <ESC>:w<cr>
inoremap <leader>z <ESC>u
noremap <leader>z u
inoremap <leader>y <ESC><C-R>
noremap <leader>y <C-R>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"-----------NerdTree and helpers------------------------------------
nnoremap <Leader>m :NERDTreeFind<cr>
nnoremap <Leader>e <C-w>w
nnoremap <Leader>w <C-w>p

"custom fns
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()


"----------------split screen navigation---------------------
endif
