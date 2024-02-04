local ft = require('guard.filetype')

ft('typescript,javascript,vue'):fmt('prettier')

require('guard').setup {
  fmt_on_save = false,
  lsp_as_default_formatter = false,
}
