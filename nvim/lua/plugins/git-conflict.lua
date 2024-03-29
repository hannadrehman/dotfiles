-- Lua

require("git-conflict").setup({
    on_attach = function(client)
      vim.api.nvim_create_autocommand('User', {
	  pattern = 'GitConflictDetected',
	  callback = function()
	    vim.notify('Conflict detected in '..vim.fn.expand('<afile>'))
	    vim.keymap.set('n', 'cww', function()
	      engage.conflict_buster()
	      create_buffer_local_mappings()
	    end)
	  end
	})
    end,
})
