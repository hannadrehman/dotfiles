require('github-theme').setup({})
local transparent = require('transparent')

transparent.setup({
 extra_groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',"NormalFloat",
    "NvimTreeNormal" -- NvimTree
  },
})



local hi = require('utils').hi
local cmd = vim.cmd

--transparent.clear_prefix('lualine')


vim.cmd('colorscheme github_dark_tritanopia')

hi("CursorLine", {guibg = "#191919", guifg = "fg"})


