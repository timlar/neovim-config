local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local telescope = require('telescope')

telescope.setup {
  defaults = {
    file_ignore_patterns = { '.git', 'node_modules'  },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-case',
      '--hidden'
    }
  },
  pickers = {
    find_files = {
      hidden = true
    }
  }
}

-- map('', '<leader>ff', '<cmd>Telescope find_files find_command=fd,--ignore-case,--hidden<cr>', opts)
map('', '<leader>tf', '<cmd>Telescope find_files<cr>', opts)
map('', '<leader>tg', '<cmd>Telescope live_grep<cr>', opts)
map('', '<leader>tb', '<cmd>Telescope buffers<cr>', opts)
map('', '<leader>th', '<cmd>Telescope help_tags<cr>', opts)
