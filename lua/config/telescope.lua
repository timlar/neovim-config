local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local vimgrep_arguments = { unpack(require('telescope.config').values.vimgrep_arguments) }

table.insert(vimgrep_arguments, '--hidden')
table.insert(vimgrep_arguments, '--glob')
table.insert(vimgrep_arguments, '!**/.git/*')

map('n', '<leader>tf', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', '<leader>tg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', '<leader>tb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>tr', '<cmd>lua require("telescope.builtin").resume()<cr>', opts)

require('telescope').setup {
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
      '--hidden',
      '--trim',
    },
    prompt_prefix = '  ',
    selection_caret = '  ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        prompt_position = 'bottom',
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    path_display = { 'truncate' },
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
    mappings = {
      n = { ['q'] = require('telescope.actions').close },
      i = {
        ['<esc>'] = require('telescope.actions').close,
        ['<c-c>'] = require('telescope.actions').delete_buffer,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = { 'rg', '--files', '--ignore-case', '--hidden', '--glob', '!**/.git/*' },
    }
  }
}
