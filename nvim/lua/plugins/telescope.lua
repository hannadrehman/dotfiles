local telescope = require('telescope')
local map = require("utils").map

telescope.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    prompt_prefix = "🔍",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {'node_modules/.*' ,'deploy/'},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {

    },
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  pickers = {
    buffers = {
      theme = "dropdown",
      previewer=false,
      layout_config = {
         width = 0.90,
         height = 0.50,
      },
    },
    find_files = {
      theme = "dropdown",
      previewer=false,
      layout_config = {
         width = 0.90,
         height = 0.50,
      },
    },
    git_files = {
      theme = "dropdown",
      previewer=false,
      layout_config = {
         width = 0.90,
         height = 0.50,
      },
    },
    oldfiles = {
      theme = "dropdown",
      previewer=false,
      layout_config = {
         width = 0.90,
         height = 0.50,
      },
    }
  },
}

 map('n', '<leader>fl', "<cmd>lua require'telescope.builtin'.resume() <CR>", {})
