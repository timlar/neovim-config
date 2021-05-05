local gl = require('galaxyline')

local colors = {
  transparent = 'NONE',
  bg = '#3c3836',
  yellow = '#fabd2f',
  cyan = '#8ec07c',
  green = '#b8bb26',
  orange = '#fe8019',
  purple = '#d3869b',
  magenta = '#d3869b',
  grey_dark = '#504945',
  grey_medium = '#665c54',
  grey = '#bdae93',
  blue = '#83a598',
  red = '#fb4934'
}

local condition = require('galaxyline.condition')
local section = gl.section

gl.short_line_list = { 'NvimTree', 'packer' }

-- left section --------------------------------------------------------------------------------------------------------

section.left[1] = {
  ViMode = {
    provider = function()
      local modes = {
             n = { color = colors.green,  text = 'NORMAL ' },
             i = { color = colors.blue,   text = 'INSERT ' },
             v = { color = colors.purple, text = 'VISUAL ' },
             V = { color = colors.purple, text = 'VISUAL ' },
             c = { color = colors.orange, text = 'COMMAND' },
        [''] = { color = colors.purple, text = 'VISUAL ' }
      }

      vim.api.nvim_command('hi GalaxyViMode guibg=' .. modes[vim.fn.mode()].color)

      return '  ' .. modes[vim.fn.mode()].text
    end,
    separator = ' ',
    highlight = { colors.bg, colors.grey },
    separator_highlight = { colors.grey, colors.grey },
  }
}

section.left[2] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = { colors.bg, colors.grey },
    separator = '',
    separator_highlight = { colors.grey, colors.bg },
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
    separator_highlight = { colors.grey_medium, colors.bg },
    highlight = { colors.grey, colors.grey_medium }
  }
}

section.right[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = { colors.grey, colors.grey_medium },
    highlight = { colors.grey, colors.grey_medium }
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
    highlight = { colors.grey, colors.grey },
    separator_highlight = { colors.grey, colors.grey_medium }
  }
}

section.right[9] = {
  BufferType = {
    provider = 'FileTypeName',
    highlight = { colors.bg, colors.grey }
  }
}

section.right[10] = {
  FileEncode = {
    provider = 'FileEncode',
    separator = ' ',
    separator_highlight = { colors.bg, colors.grey },
    highlight = { colors.bg, colors.grey }
  }
}

section.right[11] = {
  Space = {
    provider = function()
      return ' '
    end,
    highlight = { colors.grey, colors.grey }
  }
}

-- short line left -----------------------------------------------------------------------------------------------------

section.short_line_left[1] = {
  Space = {
    provider = function()
      return ' '
    end,
    condition = condition.buffer_not_empty,
    highlight = { colors.grey, colors.grey }
  }
}

section.short_line_left[3] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = { colors.bg, colors.grey },
    separator = '',
    separator_highlight = { colors.grey, colors.bg },
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
    highlight = { colors.grey, colors.grey },
    separator_highlight = { colors.grey, colors.bg }
  }
}

section.short_line_right[2] = {
  BufferType = {
    provider = 'FileTypeName',
    condition = condition.buffer_not_empty,
    highlight = { colors.bg, colors.grey }
  }
}

section.short_line_right[3] = {
  Space = {
    provider = function()
      return ' '
    end,
    condition = condition.buffer_not_empty,
    highlight = { colors.grey, colors.grey }
  }
}
