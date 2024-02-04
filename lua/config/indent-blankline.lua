local highlight = { 'Whitespace' }

require('ibl').setup {
  indent = {
    char = '┆', -- ┆ ╎
    highlight = highlight
  },
  whitespace = {
    highlight = highlight,
  },
  scope = {
    show_start = false,
    show_end = false,
    highlight = 'LineNr',
  },
  exclude = {
    filetypes = { 'help', 'nerdtree', 'nvimtree', 'packer' },
    buftypes = { 'terminal', 'NvimTree' },
  }
}
