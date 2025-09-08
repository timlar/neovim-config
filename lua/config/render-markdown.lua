require('render-markdown').setup({
  heading = {
    signs = { '#' },
  },
  code = {
    conceal_delimiters = false,
    disable_background = { 'diff' },
    border = 'thin',
  },
  bullet = {
    icons = { '', '', '◆', '◇' },
  },
})
