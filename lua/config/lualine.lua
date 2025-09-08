local h = require('helpers')
local icons = h.icons.lualine

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = icons.component_separators,
    section_separators = icons.section_separators,
    disabled_filetypes = {},
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = false,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      {
        'branch',
        icon = icons.branch,
      },
      { 'diff' },
      {
        'diagnostics',
        symbols = icons.symbols,
        colored = true,
        separator = nil,
      }
    },
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_x = {},
    lualine_y = { 'encoding', 'fileformat', 'filetype' },
    lualine_z = { 'progress', 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      { 'filename', path = 1 }
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { 'nvim-tree' }
}
