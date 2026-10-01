local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function config(name)
  return function() require("plugins/" .. name) end
end

local file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }
local opened_directory = vim.fn.argc(-1) > 0 and vim.fn.isdirectory(vim.fn.argv(0)) == 1

require("lazy").setup({
  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "ryanoasis/vim-devicons", event = "VeryLazy" },

  -- lsp
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "neovim/nvim-lspconfig",
    event = file_events,
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = config("lsp"),
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = file_events,
    dependencies = { "nvim-treesitter/nvim-tree-docs" },
    config = config("treesitter"),
  },

  -- editor
  { "editorconfig/editorconfig-vim", event = { "BufReadPre", "BufNewFile" } },
  {
    "nvimtools/none-ls.nvim",
    event = file_events,
    dependencies = { "nvim-lua/plenary.nvim", "nvimtools/none-ls-extras.nvim" },
    config = config("null-ls"),
  },
  { "numToStr/Comment.nvim", event = "VeryLazy", config = config("comment") },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = config("autopair") },
  { "chikko80/error-lens.nvim", event = file_events, config = config("error-lens") },
  { "lukas-reineke/indent-blankline.nvim", event = file_events, config = config("ibl") },

  -- window
  { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = config("lua-line") },
  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = config("barbar"),
  },
  {
    "startup-nvim/startup.nvim",
    lazy = vim.fn.argc(-1) > 0,
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = config("dashboard"),
  },

  -- completion
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = config("cmp"),
  },

  -- theme
  { "projekt0n/github-nvim-theme", lazy = false, priority = 1000, config = config("theme") },
  { "xiyaowong/transparent.nvim", lazy = false },

  -- code navigation
  { "nvim-lua/popup.nvim", lazy = true },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = { "<leader>fl" },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
    config = config("telescope"),
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = not opened_directory,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeFindFileToggle" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = config("nvim-tree"),
  },
  {
    "smoka7/hop.nvim",
    keys = { { "f", mode = { "n", "o" } }, { "F", mode = { "n", "o" } } },
    config = config("hop"),
  },

  -- git
  { "akinsho/git-conflict.nvim", event = file_events, config = config("git-conflict") },

  -- ai
  {
    dir = vim.fn.stdpath("config") .. "/pack/github/start/copilot.vim",
    name = "copilot.vim",
    event = "VeryLazy",
  },
}, {
  performance = {
    rtp = {
      disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
    },
  },
})
