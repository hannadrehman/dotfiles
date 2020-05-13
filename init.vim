if empty(glob('~/.nvim/autoload/plug.vim'))
	echo "mother fucker"
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"-----------------------------------------



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

Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'tpope/vim-fugitive'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'andymass/vim-matchup'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'dracula/vim'
Plug 'jistr/vim-nerdtree-tabs'


call plug#end()

"-----------------------------------------------------
"       VARIABLES
"-----------------------------------------------------

let mapleader = ","
let g:js_file_import_prompt_if_no_tag = 0
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
let g:airline_theme='dracula'
let g:nerdtree_tabs_autofind = 1
set number
let g:NERDTreeWinSize=45

"-----------------------------------------------------
"      AUTO COMMANDS
"-----------------------------------------------------
filetype plugin on                
filetype plugin indent on 
autocmd vimenter * colorscheme dracula
autocmd FileType nerdtree set norelativenumber
autocmd FileType taglist set norelativenumber
autocmd FileType json syntax match Comment +\/\/.\+$+


"-----------------------------------------------------
"       MAPPINGS
"-----------------------------------------------------

nnoremap <Leader>if <Plug>(JsFileImport)
nnoremap <Leader>iF <Plug>(JsFileImportList)
nnoremap <Leader>ig <Plug>(JsGotoDefinition)
nnoremap <Leader>iG <Plug>(JsGotoDefinition)
nnoremap <Leader>ip <Plug>(PromptJsFileImport)
nnoremap <Leader>is <Plug>(SortJsFileImport)
nnoremap <Leader>ic <Plug>(JsFixImport)

"-------------LISTS-----------------------------------
nnoremap <silent> <c-p> :Files<cr>                                                 
nnoremap <silent> <c-l> :History<cr> 
nnoremap <Leader>lb :Buffers<cr>

"-------------GIT-------------------------------------
nnoremap <Leader>gcs :Commits<cr> 
nnoremap <Leader>gs :GFiles?<cr>

"-------------SEARCHING-------------------------------
nnoremap <Leader>sl :Lines<cr>                                                       
nnoremap <Leader>sb :BLines<cr>

nnoremap <Leader>m :NERDTreeFind<cr>
nnoremap <Leader>w <C-w><C-p>
nnoremap <Leader>e <C-w><C-w>

endif
