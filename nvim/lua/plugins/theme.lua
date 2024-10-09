require('github-theme').setup({})



local hi = require('utils').hi
local cmd = vim.cmd

--transparent.clear_prefix('lualine')


vim.cmd('colorscheme github_dark_tritanopia')

hi("CursorLine", {guibg = "#191919", guifg = "fg"})


