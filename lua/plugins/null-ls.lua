local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.eslint_d,
    formatting.fixjson,
    formatting.pg_format,
    formatting.prettierd,
    formatting.rubocop,
    formatting.stylelint,
    formatting.terraform_fmt,
    formatting.yamlfmt,

    diagnostics.eslint_d,
    diagnostics.tsc,
    diagnostics.yamllint,
  },
})
