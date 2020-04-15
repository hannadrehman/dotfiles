# Vim-like-VSCode

### Collection of some awesome plugins for vim which makes it work almost like vscode.


Install [pathogen](https://github.com/tpope/vim-pathogen) 

Install [vimrc](https://github.com/amix/vimrc)

Install [nerdcommenter](https://github.com/preservim/nerdcommenter)

Install [CoC](https://github.com/neoclide/coc.nvim) via pathogen.

RUN `~/.vim/bundle/coc.nvim/install.sh`

Install [vim-nerdtree-dirente](https://github.com/Nopik/vim-nerdtree-direnter)

In your vim/neovim, run command:

```
:CocInstall coc-tsserver
:CocConfig

```
which should open a config json. paste the following in the config 
```
{
   "tsserver.npm": "/usr/local/bin/npm",
   "coc.preferences.formatOnType": true,
   "coc.preferences.formatOnSaveFiletypes": ["go", "markdown", "javascript", "typescript", "json", "jsonc"],
   "coc.source.file.ignoreHidden": false,
   "prettier.eslintIntegration": true,
   "codeLens.enable": true,
   "git.addGBlameToVirtualText": true,
   "signature.target": "echo",
   "diagnostic.format": "%message [%source]",
   "diagnostic.virtualText": true,
   "diagnostic.checkCurrentLine": true,
   "diagnostic.separateRelatedInformationAsDiagnostics": true,
   "suggest.timeout": 5000,
   "suggest.asciiCharactersOnly": true,
   "list.normalMappings": {
     "<C-c>": "do:exit"
   },
   "list.insertMappings": {
     "<C-c>": "do:exit"
   },  
   "eslint.autoFixOnSave": true,
   "eslint.filetypes": ["javascript", "typescript", "javascriptreact"],
   "calc.replaceOriginalExpression": false,
   "markdownlint.config": {
     "default": true,
     "line-length": false
   },  
   "clangd.semanticHighlighting": true,
 }
```



add following variables to your `~/.vim_runtime/my_configs.vim` file

```
 filetype plugin on
 filetype plugin indent on
 
 autocmd FileType json syntax match Comment +\/\/.\+$+
 
 
 let g:NERDTreeWinPos = "left"
 let g:NERDSpaceDelims = 1
 let g:NERDCompactSexyComs = 1
 let g:NERDDefaultAlign = 'left'
 let g:NERDAltDelims_java = 1
 let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
 let g:NERDCommentEmptyLines = 1
 let g:NERDTrimTrailingWhitespace = 1
 let g:NERDToggleCheckAllLines = 1
 let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'javascriptreact': ['prettier', 'eslint']}
 let g:ale_fix_on_save = 1
 let NERDTreeMapOpenInTab='<ENTER>'
 
 nmap <C-k> <plug>NERDCommenterToggle
 map <C-n> :NERDTreeToggle<cr>
 nmap <C-m> :NERDTreeFind<CR>
        
        
 au TabLeave * let g:lasttab = tabpagenr()
 nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
 vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
 nnoremap H gT
 nnoremap L gt
 


```


Usefull Commands : 
- `:MRU (OR ,f)` open recently closed files
- `:MRU pattern (OR ,f pattern)` open most recent files matching that pattern
- `Ctrl + n` opens up file explorer
- `Ctrl + m` opens up current file explorer
- `Ctrl + ww` toggle between file explorer and main file
- `Ctrl + f`  search files
- `Git <git command>` for all awesome git stuff inside your vim
- `Ctrl + l` toggle comment line 
- `count Ctrl + k` toggle number of lines ex `2 Ctrl+k` comments 2 lines.
- `,w` writes changes to file
- `Ctrl + l` open last tab
- `Shift + h` navigates to previous tab
- `Shift + l` navigates to next tab



Most of the plugins and configs can be found here [vimrc](https://github.com/amix/vimrc)
