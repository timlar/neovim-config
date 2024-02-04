-- DEPRECATED PLUGIN --
local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    -- formatting.eslint,
    formatting.fixjson,
    formatting.pg_format,
    formatting.prettierd,
    formatting.stylelint,
    -- formatting.terraform_fmt,
    formatting.yamlfmt,

    -- diagnostics.eslint,
    diagnostics.tsc,
    diagnostics.yamllint,
  },
})
