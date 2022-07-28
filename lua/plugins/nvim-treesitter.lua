require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash', 'comment', 'css', 'go', 'graphql', 'html', 'javascript', 'jsdoc', 'json', 'jsonc', 'lua', 'regex', 'ruby',
    'scss', 'toml', 'typescript', 'vue', 'yaml'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = false,
  --   max_file_lines = nil
  -- },
  incremental_selection = { enable = true },
  indent = { enable = true },
  context_commentstring = { enable = true }
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- vim.cmd 'TSUpdate'
