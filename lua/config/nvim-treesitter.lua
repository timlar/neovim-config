vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- :Inspect - to show the highlight groups under the cursor
-- :InspectTree - to show the parsed syntax tree ("TSPlayground")
-- :EditQuery - to open the Live Query Editor (Nvim 0.10+)
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash', 'comment', 'css', 'dockerfile', 'go', 'graphql', 'html', 'javascript', 'jsdoc', 'json',
    'jsonc', 'lua', 'python', 'regex', 'ruby', 'scss', 'toml', 'typescript', 'vue', 'yaml', 'solidity'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  rainbow = {
    enable = false,
    extended_mode = false,
    max_file_lines = nil
  },
  incremental_selection = {
    enable = true
  },
  indent = {
    enable = true,
    disable = { 'yaml', 'ruby' }
  },
  endwise = {
    enable = true
  },
}
