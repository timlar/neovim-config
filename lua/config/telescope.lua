local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- map('', '<leader>ff', '<cmd>Telescope find_files find_command=fd,--ignore-case,--hidden<cr>', opts)
map('', '<leader>tf', '<cmd>Telescope find_files<cr>', opts)
map('', '<leader>tg', '<cmd>Telescope live_grep<cr>', opts)
map('', '<leader>tb', '<cmd>Telescope buffers<cr>', opts)
map('', '<leader>th', '<cmd>Telescope help_tags<cr>', opts)

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
      '--hidden'
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
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
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
  pickers = {
    find_files = {
      hidden = true
    }
  }
}
