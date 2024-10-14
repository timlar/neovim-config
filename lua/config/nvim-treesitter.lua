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
    additional_vim_regex_highlighting = true
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
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
  --     keymaps = {
  --       -- It's possible use the capture groups defined in textobjects.scm
  --       ['af'] = '@function.outer',
  --       ['if'] = '@function.inner',
  --       ['ac'] = '@class.outer',
  --       ['ic'] = '@class.inner',
  --     },
  --   },
  --   move = {
  --     enable = true,
  --     set_jumps = true, -- whether to set jumps in the jumplist
  --     goto_next_start = {
  --       [']m'] = '@function.outer',
  --       [']]'] = '@class.outer',
  --     },
  --     goto_next_end = {
  --       [']M'] = '@function.outer',
  --       [']['] = '@class.outer',
  --     },
  --     goto_previous_start = {
  --       ['[m'] = '@function.outer',
  --       ['[['] = '@class.outer',
  --     },
  --     goto_previous_end = {
  --       ['[M'] = '@function.outer',
  --       ['[]'] = '@class.outer',
  --     },
  --   },
  --   swap = {
  --     enable = true,
  --     swap_next = {
  --       ['<leader>a'] = '@parameter.inner',
  --     },
  --     swap_previous = {
  --       ['<leader>A'] = '@parameter.inner',
  --     },
  --   },
  -- },
}
