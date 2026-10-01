"----------------------------------------------------
"-------lua imports

"settings
lua require('key-bindings')
lua require('editor-settings')

"plugins (configs in lua/plugins/ are loaded on demand by lazy.nvim)
lua require('lazy-setup')

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
