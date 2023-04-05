require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  update_cwd          = false,
  respect_buf_cwd = true,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  renderer = {
      highlight_opened_files = "yes",
      icons= {
      glyphs = {
	      git= {
		       unstaged= "",
		       staged= "✓",
		       unmerged= "",
		       renamed= "➜",
		       untracked= "★",
		       deleted= "",
		       ignored= "◌"
	       },
	       folder= {
		       arrow_open= "",
		       arrow_closed= "",
		       default= "",
		       open= "",
		       empty= "",
		       empty_open= "",
		       symlink= "",
		       symlink_open= "",
	       },
       }
       },

  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = true,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 60,
    side = 'right',
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
        window_picker = {
            enable = false,
          },
    }
  }
}


