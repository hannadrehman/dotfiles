#install

install vim-plug.  https://github.com/junegunn/vim-plug#unix-linux

install necessary lsp servers from [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

For Go, install `gopls` so the configured Go LSP can start:

```sh
go install golang.org/x/tools/gopls@latest
```

# Install language parsers
:TSInstall <language_to_install>

:TSInstall typescript
:TSInstall css
:TSInstall scss
:TSInstall go
:TSInstall javascript
:TSInstall vim


### Fixes unresponsiveness of large projects
https://github.com/emcrisostomo/fswatch?tab=readme-ov-file#installation
