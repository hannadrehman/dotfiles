" ----------------------------------------
" Automatic installation of vim-plug, if it's not available
" ----------------------------------------
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'andymass/vim-matchup'
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim',{'tag': '*', 'do': { -> coc#util#install()}}
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'dracula/vim'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

"-----------------------------------------------------
"       VARIABLES
"-----------------------------------------------------

let mapleader = ","
let g:js_file_import_prompt_if_no_tag = 0
let g:ale_linters = {'javascript': ['eslint', 'prettier']}
let g:ale_fixers = {'javascript': ['eslint', 'prettier']}
let g:ale_fix_on_save = 1
let g:airline_theme='dracula'
let g:nerdtree_tabs_autofind = 1
let g:NERDTreeWinSize=45
set ic
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
set cursorline
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

"-------------AUTOCOMPLETE----------------------------
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)  
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ld <Plug>(coc-definition)     
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation) 
nmap <silent> <leader>lf <Plug>(coc-references)    
nmap <leader>lr <Plug>(coc-rename)             
nnoremap <silent> K :call <SID>show_documentation()<CR>
                                                       
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"------------------------------------------------------
nnoremap <Leader>m :NERDTreeFind<cr>
nnoremap <Leader>w <C-w><C-p>
nnoremap <Leader>e <C-w><C-w>

endif

