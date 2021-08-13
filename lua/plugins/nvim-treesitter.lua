require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash', 'comment', 'css', 'go', 'graphql', 'html', 'javascript', 'jsdoc', 'json', 'jsonc', 'lua', 'regex', 'ruby',
    'scss', 'toml', 'typescript', 'vue', 'yaml'
  },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
  context_commentstring = { enable = true },
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- vim.cmd 'TSUpdate'
