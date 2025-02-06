
require("null-ls").setup({
		root_dir = require("null-ls.utils").root_pattern(".git", "package.json"),
    debounce = 150,
    sources = {
        require("null-ls").builtins.formatting.prettier,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
	require("null-ls").builtins.diagnostics.stylelint
    },
    on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd([[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
      augroup END
    ]])
    end
    end,
})
