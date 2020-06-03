# Vim-like-VSCode

### Collection of some awesome plugins for neovim which makes it work almost like vscode.

Install [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

Install [fzf](https://github.com/junegunn/fzf)

Install [ctags](https://github.com/universal-ctags/ctags)

Install [silver searcher](https://github.com/ggreer/the_silver_searcher)

RUN `:CocInstall  coc-emoji coc-eslint coc-prettier coc-tsserver coc-tslint coc-tslint-plugin coc-css coc-json coc-pyls coc-yaml` inside nvim

add any plugin you want to this command.

add following to your `.bashrc` or `.zshrc`


```
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"  
```

```
mkdir .config/nvim
touch init.vim
copy and paste init.vim from here
```


More usefull vim shortcuts can be found here [vim-keyboard-shortcuts](http://keyxl.com/aaa8263/290/vim-keyboard-shortcuts)

Basic Vim commands can be found [here](https://github.com/hannadrehman/Vim-like-VSCode/blob/master/vim-commands.md)
