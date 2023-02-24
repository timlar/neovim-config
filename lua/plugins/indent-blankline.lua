require('indent_blankline').setup {
  show_trailing_blankline_indent = false,
  show_current_context = false,
  show_current_context_start = false,
  show_first_indent_level = true,
  use_treesitter = true,
  filetype_exclude = { 'help', 'nerdtree', 'nvimtree', 'packer' },
  bufname_exclude = { 'NvimTree' }
}

vim.cmd [[
  augroup IndentBlankline
    hi! link IndentBlanklineChar VertSplit
  augroup END
]]
