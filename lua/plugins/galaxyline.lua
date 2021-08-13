local gl = require('galaxyline')

local colors = {
  -- transparent = 'NONE',
  -- bg          = '#14191F',
  -- black       = '#0F1419',
  -- blue        = '#36A3D9',
  -- cyan        = '#95E6CB',
  -- green       = '#B8CC52',
  -- grey        = '#5C6773',
  -- grey_dark   = '#2D3640',
  -- grey_medium = '#3E4B59',
  -- magenta     = '#F07178',
  -- orange      = '#F29718',
  -- purple      = '#E6B673',
  -- red         = '#FF3333',
  -- white       = '#E6E1CF',
  -- yellow      = '#FFB454'

  -- Gruvbox colors
  bg          = '#3c3836',
  black       = '#282828',
  blue        = '#83a598',
  cyan        = '#8ec07c',
  green       = '#b8bb26',
  grey        = '#bdae93',
  grey_dark   = '#504945',
  grey_medium = '#665c54',
  magenta     = '#d3869b',
  orange      = '#fe8019',
  purple      = '#d3869b',
  red         = '#fb4934',
  white       = '#ebdbb2',
  yellow      = '#fabd2f'
}

local condition = require('galaxyline.condition')
local section = gl.section

gl.short_line_list = { 'NvimTree', 'packer' }

-- left section --------------------------------------------------------------------------------------------------------

section.left[1] = {
  ViMode = {
    provider = function()
      local modes = {
      	['c']  = { text = 'COMMAND',          color = colors.orange },
        ['ce'] = { text = 'NORMAL EX',        color = colors.green },
        ['cv'] = { text = 'EX',               color = colors.green },
        ['i']  = { text = 'INSERT',           color = colors.blue },
        ['ic'] = { text = 'INS-COMPLETE',     color = colors.blue },
        ['n']  = { text = 'NORMAL',           color = colors.green },
        ['no'] = { text = 'OPERATOR-PENDING', color = colors.white },
        ['r']  = { text = 'HIT-ENTER',        color = colors.white },
        ['r?'] = { text = ':CONFIRM',         color = colors.white },
        ['rm'] = { text = '--MORE',           color = colors.white },
        ['R']  = { text = 'REPLACE',          color = colors.yellow },
        ['Rv'] = { text = 'VIRTUAL',          color = colors.magenta },
        ['s']  = { text = 'SELECT',           color = colors.purple },
        ['S']  = { text = 'SELECT',           color = colors.purple },
        [''] = { text = 'SELECT',           color = colors.purple },
        ['t']  = { text = 'TERMINAL',         color = colors.yellow },
        ['v']  = { text = 'VISUAL',           color = colors.purple },
        ['V']  = { text = 'VISUAL LINE',      color = colors.purple },
        [''] = { text = 'VISUAL BLOCK',     color = colors.purple },
        ['!']  = { text = 'SHELL',            color = colors.yellow },
      }

      vim.api.nvim_command('hi GalaxyViMode guibg=' .. modes[vim.fn.mode()].color)

      return '  ' .. modes[vim.fn.mode()].text .. ' '
    end,
    separator = ' ',
    highlight = { colors.black, colors.grey_medium },
    separator_highlight = { colors.grey_medium, colors.grey_medium },
  }
}

section.left[2] = {
  FileName = {
    provider = function()
      return vim.fn.expand('%')
    end,
    condition = condition.buffer_not_empty,
    highlight = { colors.white, colors.grey_medium },
    separator = '',
    separator_highlight = { colors.grey_medium, colors.bg },
  }
}

section.left[3] = {
  GitIcon = {
    provider = function()
      return ' '
    end,
    condition = condition.check_git_workspace and condition.buffer_not_empty,
    separator = ' ',
    separator_highlight = { colors.transparent, colors.bg },
    highlight = { colors.grey, colors.bg }
  }
}

section.left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace and condition.buffer_not_empty,
    separator = ' ',
    separator_highlight = { colors.transparent, colors.bg },
    highlight = { colors.grey, colors.bg }
  }
}

section.left[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.green, colors.bg }
  }
}

section.left[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = { colors.yellow, colors.bg }
  }
}

section.left[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.red, colors.bg }
  }
}

-- right section -------------------------------------------------------------------------------------------------------

section.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = { colors.red, colors.bg }
  }
}

section.right[2] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = { colors.orange, colors.bg }
  }
}

section.right[3] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = { colors.yellow, colors.bg }
  }
}

section.right[4] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = { colors.blue, colors.bg }
  }
}

-- section.right[5] = {
--   ShowLspClient = {
--     provider = 'GetLspClient',
--     condition = function()
--       local tbl = { ['dashboard'] = true, [' '] = true }
--       if tbl[vim.bo.filetype] then return false end
--       return true
--     end,
--     icon = ' ',
--     highlight = {colors.grey, colors.bg}
--   }
-- }

section.right[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    icon = ' ',
    separator_highlight = { colors.grey_dark, colors.bg },
    highlight = { colors.grey, colors.grey_dark }
  }
}

section.right[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = { colors.grey, colors.grey_dark },
    highlight = { colors.grey, colors.grey_dark }
  }
}

-- section.right[8] = {
--   Tabstop = {
--     provider = function()
--       return 'Spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth') .. ' '
--     end,
--     condition = condition.hide_in_width,
--     separator = ' ',
--     separator_highlight = { colors.transparent, colors.bg },
--     highlight = { colors.grey, colors.bg }
--   }
-- }

section.right[8] = {
  SpaceBeforeFileType = {
    provider = function()
      return ' '
    end,
    separator = '',
    highlight = { colors.grey, colors.grey_medium },
    separator_highlight = { colors.grey_medium, colors.grey_dark }
  }
}

section.right[9] = {
  BufferType = {
    provider = 'FileTypeName',
    highlight = { colors.white, colors.grey_medium }
  }
}

section.right[10] = {
  FileEncode = {
    provider = 'FileEncode',
    separator = ' ',
    separator_highlight = { colors.grey, colors.grey_medium },
    highlight = { colors.white, colors.grey_medium }
  }
}

section.right[11] = {
  Space = {
    provider = function()
      return ' '
    end,
    highlight = { colors.grey_medium, colors.grey_medium }
  }
}

-- short line left -----------------------------------------------------------------------------------------------------

section.short_line_left[1] = {
  Space = {
    provider = function()
      return ' '
    end,
    condition = condition.buffer_not_empty,
    highlight = { colors.white, colors.grey_medium }
  }
}

section.short_line_left[2] = {
  FileName = {
    provider = function()
      return vim.fn.expand('%')
    end,
    condition = condition.buffer_not_empty,
    highlight = { colors.white, colors.grey_medium },
    separator = '',
    separator_highlight = { colors.grey_medium, colors.bg },
  }
}

-- short line right ----------------------------------------------------------------------------------------------------

section.short_line_right[1] = {
  SpaceBeforeFileTypeShort = {
    provider = function()
      return ' '
    end,
    condition = condition.buffer_not_empty,
    separator = '',
    highlight = { colors.grey_medium, colors.grey_medium },
    separator_highlight = { colors.grey_medium, colors.bg }
  }
}

section.short_line_right[2] = {
  BufferType = {
    provider = 'FileTypeName',
    condition = condition.buffer_not_empty,
    highlight = { colors.white, colors.grey_medium }
  }
}

section.short_line_right[3] = {
  Space = {
    provider = function()
      return ' '
    end,
    condition = condition.buffer_not_empty,
    highlight = { colors.grey_medium, colors.grey_medium }
  }
}
