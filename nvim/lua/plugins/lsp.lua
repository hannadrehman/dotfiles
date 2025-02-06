local nvim_lsp = require('lspconfig')
local map = require('utils').map
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map('n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  client.server_capabilities.document_formatting = false
end

 --Use a loop to conveniently call 'setup' on multiple servers and
 --map buffer local keybindings when the language server attaches
local servers = { "pyright",  "tsserver", "cssls", "gopls", "svelte"}
for _, lsp in ipairs(servers) do
	if lsp == "tsserver" then
		lsp = "ts_ls"
	end
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

