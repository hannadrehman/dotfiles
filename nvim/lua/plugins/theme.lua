require('github-theme').setup({})
local transparent = require('transparent')

transparent.setup({
 extra_groups = {
    "NormalFloat",
    "NvimTreeNormal" -- NvimTree
  },
})



local hi = require('utils').hi
local cmd = vim.cmd

--transparent.clear_prefix('lualine')


vim.cmd('colorscheme github_dark_tritanopia')

hi("CursorLine", {guibg = "#191919", guifg = "fg"})


