local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.pg_format,
    formatting.prettier,
    formatting.rubocop,
    formatting.stylelint,
    formatting.stylua,

    -- diagnostics.rubocop,
    -- diagnostics.stylelint,
    -- diagnostics.tsc,
    -- diagnostics.yamllint,
  },
})
