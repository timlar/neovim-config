vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_use_treesitter = true

vim.cmd [[
  augroup IndentBlankline
    highlight IndentBlanklineChar guifg=#3c3836 gui=nocombine
  augroup END
]]
