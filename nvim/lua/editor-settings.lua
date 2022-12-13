local opt = vim.opt;
local g = vim.g;
local cmd = vim.cmd

g.mapleader = ","
g.loaded_netrwPlugin = 1
g.NERDCompactSexyComs = 1

cmd "filetype plugin indent on"
cmd "syntax on"
cmd "colorscheme ayu"
cmd "set shortmess+=c"
cmd "set guicursor=n-v-c:block-Cursor"
cmd "set guicursor+=i:ver100-iCursor"
cmd "set guicursor+=n-v-c:blinkon0"
cmd "set guicursor+=i:blinkwait10"
cmd "set diffopt+=vertical"
cmd "set clipboard=unnamedplus"
cmd "set spell spelllang=en_us"
cmd "set nocursorline"
cmd "let loaded_netrwPlugin = 1"
cmd "set nobackup"
cmd "set nowritebackup"



opt.ic = true
opt.relativenumber = true
opt.number= true
opt.cmdheight=2
opt.updatetime=300
opt.signcolumn="yes"
opt.hidden = true
opt.smartindent = true
opt.updatetime=50
opt.lazyredraw = true
opt.ttyfast = true
opt.smartindent = true
opt.updatetime=300
opt.timeoutlen=500
opt.splitright = true
opt.hlsearch = true
opt.background="dark"
opt.termguicolors = true
opt.syntax = 'on'
opt.cursorline = true

