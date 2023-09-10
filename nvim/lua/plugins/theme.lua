require('github-theme').setup({})
local hi = require('utils').hi

local cmd = vim.cmd

vim.cmd('colorscheme github_dark_tritanopia')

hi("Normal", {ctermbg = "NONE", guibg = "NONE"})
hi("NonText", {ctermbg = "NONE", guibg = "NONE"})
hi('NvimTreeNormal', {guibg = "NONE"})


