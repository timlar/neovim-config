local telescope = require('telescope')
local builtin = require('telescope.builtin')
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')
local actions = require('telescope.actions')
local map = vim.keymap.set

map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Buffers' })
map('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope: Diagnostics' })
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: Find files' })
map('n', '<leader>fg', telescope.extensions.live_grep_args.live_grep_args, { desc = 'Telescope: Live grep' })
map('n', '<leader>fr', builtin.resume, { desc = 'Telescope: Resume' })
map('n', '<leader>fw', builtin.grep_string, { desc = 'Telescope: Grep word under cursor' })

map('n', '<leader>fo', function()
  builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
end, { desc = 'Telescope: Live grep in open files' })

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      '.git/',
      '.nuxt/',
      '.output/',
      'node_modules',
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--column',
      '--hidden',
      '--ignore-case',
      '--line-number',
      '--no-heading',
      '--smart-case',
      '--trim',
      '--with-filename',
      '--glob', '!**/.git/**',
      '--glob', '!.nuxt/**',
      '--glob', '!.output/**',
      '--glob', '!coverage/**',
      '--glob', '!doc/**',
      '--glob', '!tmp/**',
      '--glob', '!node_modules/**',
    },
    prompt_prefix = '   ',
    selection_caret = '  ',
    entry_prefix = '  ',
    multi_icon = ' ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    scroll_strategy = 'limit',
    layout_strategy = 'vertical',
    layout_config = {
      horizontal = {
        prompt_position = 'bottom',
        preview_width = 0.6,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
        preview_height = 0.6,
      },
      width = 0.9,
      height = 0.9,
      preview_cutoff = 0,
    },
    file_sorter = sorters.get_fuzzy_file,
    generic_sorter = sorters.get_generic_fuzzy_sorter,
    path_display = { 'truncate' },
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    -- set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    buffer_previewer_maker = previewers.buffer_previewer_maker,
    mappings = {
      n = {
        ['q'] = actions.close,
      },
      i = {
        ['<c-c>'] = actions.delete_buffer,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  },
}

telescope.load_extension('live_grep_args')
