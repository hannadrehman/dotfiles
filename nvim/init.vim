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


"icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' " for file icons

"lsp
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"editor
Plug 'editorconfig/editorconfig-vim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'preservim/nerdcommenter'
Plug 'nvim-treesitter/nvim-tree-docs'
Plug 'windwp/nvim-autopairs'
Plug 'chikko80/error-lens.nvim'

"window
Plug 'hoob3rt/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'startup-nvim/startup.nvim'

"completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

"theme
Plug 'projekt0n/github-nvim-theme'
Plug 'xiyaowong/transparent.nvim'

"code navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'phaazon/hop.nvim'

"git
Plug 'akinsho/git-conflict.nvim'
Plug 'github/copilot.vim', {'branch': 'release'}



call plug#end()
"----------------------------------------------------
"-------lua imports

"settings
lua require('key-bindings')
lua require('editor-settings')

"plugins
lua require('plugins/lsp')
lua require('plugins/telescope')
lua require('plugins/lua-line')
lua require('plugins/barbar')
lua require('plugins/cmp')
lua require('plugins/treesitter')
lua require('plugins/nvim-tree')
lua require('plugins/hop')
lua require('plugins/git-conflict')
lua require('plugins/null-ls')
lua require('plugins/theme')
lua require('plugins/dashboard')
lua require('plugins/autopair')
lua require('plugins/error-lens')

"-----------------------------------------------------
"       VARIABLES
"-----------------------------------------------------


"Editor confing
filetype plugin on
filetype plugin indent on
highlight Cursor guifg=white guibg=white
highlight iCursor guifg=white guibg=white
highlight Visual guifg=white guibg=#676FA3 gui=none
hi CursorLine guibg=#2C2E43

let g:javascript_plugin_jsdoc = 1


"-----------------------------------------------------
"      AUTO COMMANDS
"-----------------------------------------------------
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

"-- unable to move them to lua file yet
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').help_tags()<cr>


"custom fns
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()


"Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

"Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

"----------------split screen navigation---------------------
endif
