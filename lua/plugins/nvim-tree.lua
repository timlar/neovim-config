local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_special_files = {}

vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 0
}

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  folder = {
    default = '', -- 
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = ''
  },
  git = {
    unstaged = '•',
    staged = '•',
    unmerged = '',
    renamed = '➜',
    untracked = '•',
    deleted = '-',
  },
  lsp = {
    hint = '',
    info = '',
    warning = '',
    error = ''
  }
}

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = true,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = true,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
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
    dotfiles = false,
    custom = { '.git', 'node_modules', '.cache' }
  },
  git = {
    enable = true,
    ignore = false
  },
  view = {
    width = 40,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = 'yes'
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}

-- TODO: Shortcut to set selected dir as root dir

map('', '<f3>', ':NvimTreeToggle<cr>', opts)
map('', '<s-f3>', ':NvimTreeFindFile<cr>', opts)

-- A list of groups can be found at `:h nvim_tree_highlight`
vim.cmd 'highlight NvimTreeFolderIcon guifg=#83a598'
vim.cmd 'highlight NvimTreeFolderName guifg=#83a598'
vim.cmd 'highlight NvimTreeIndentMarker guifg=#3c3836'
vim.cmd 'highlight NvimTreeRootFolder guifg=#d65d0e'
vim.cmd 'highlight NvimTreeWindowPicker gui=bold guifg=#282828 guibg=#83a598'
-- vim.cmd 'highlight NvimTreeNormal guibg=#3c3836'
-- hi
