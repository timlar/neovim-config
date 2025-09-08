require('ibl').setup {
  indent = {
    char = '┆',
    highlight = { 'Whitespace' }
  },
  whitespace = {
    highlight = { 'Whitespace' },
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
