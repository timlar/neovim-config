local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_follow = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0
vim.g.nvim_tree_special_files = { 'README.md' }

vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1
}

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  folder = {
    default = '', -- 
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = ''
  },
  lsp = {
    hint = '',
    info = '',
    warning = '',
    error = ''
  }
}

map('', '<f3>', ':NvimTreeToggle<cr>', opts)
map('', '<s-f3>', ':NvimTreeFindFile<cr>', opts)

-- A list of groups can be found at `:h nvim_tree_highlight`
vim.cmd 'highlight NvimTreeFolderIcon guifg=#83a598'
vim.cmd 'highlight NvimTreeFolderName guifg=#83a598'
vim.cmd 'highlight NvimTreeIndentMarker guifg=#3c3836'
