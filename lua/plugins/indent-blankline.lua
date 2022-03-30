require("indent_blankline").setup {
  show_trailing_blankline_indent = false,
  show_current_context = false,
  show_current_context_start = false,
  show_first_indent_level = false,
  use_treesitter = true,
  filetype_exclude = { 'help', 'nerdtree', 'nvimtree', 'packer' },
  bufname_exclude = { 'NvimTree' }
}

vim.cmd [[
  augroup IndentBlankline
    highlight IndentBlanklineChar guifg=#3c3836 gui=nocombine
  augroup END
]]
