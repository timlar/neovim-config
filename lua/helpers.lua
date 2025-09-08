local M = {}

local shared_icons = {
  error = ' ', -- 
  warn  = ' ', -- 
  info  = '󰂞 ', -- 
  hint  = ' ',
}

M.icons = {
  mason = {
    package_pending = ' ', -- 
    package_installed = '● ', -- 
    package_uninstalled = '○ ', -- 
  },
  lualine = {
    component_separators = {
      left  = '', --   
      right = '', --   
    },
    section_separators = {
      left  = '', -- 
      right = '', -- 
    },
    branch = '',
    symbols = {
      error = shared_icons.error,
      hint  = shared_icons.hint,
      info  = shared_icons.info,
      warn  = shared_icons.warn,
    },
  },
  lspconfig = {
    error = shared_icons.error,
    hint  = shared_icons.hint,
    info  = shared_icons.info,
    warn  = shared_icons.warn,
  },
  todo_comments = {
    error = shared_icons.error,
    hint  = shared_icons.hint,
    info  = shared_icons.info,
    warn  = shared_icons.warn,
    hack  = ' ',
    test  = '󰠠 ',
    todo  = ' ', -- 
  },
  nerd_tree = {
    default = '', --   
    symlink = '',
    bookmark = '', --   
    folder = {
      arrow_closed = '', --   
      arrow_open = '', --   
      default = '',
      open = '',
      empty = '', -- 
      empty_open = '', -- 
      symlink = '', -- 
      symlink_open = '' -- 
    },
    git = {
      unstaged = '', -- •
      staged = '',
      unmerged = '',
      renamed = '➜',
      untracked = '',
      deleted = '', --  
      ignored = '',
    },
  },
  fidget = {
    done = ' ',
  },
  gitsigns = {
    signs = {
      add = '│',
      change = '│',
      delete = '_',
      topdelete = '‾',
      changedelete = '~',
      untracked = '┆', -- ╎ ┆ ┊
    },
    signs_staged = {
      add = '│',
      change = '│',
      delete = '_',
      topdelete = '‾',
      changedelete = '~',
      untracked = '┆',
    },
  },
}

M.toggle_quickfix_list = function()
  local qf_open = false

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)

    if vim.api.nvim_get_option_value('buftype', { buf = buf }) == 'quickfix' then
      qf_open = true

      break
    end
  end

  vim.cmd(qf_open and 'cclose' or 'botright copen')
end

M.safe_cprev = function()
  local ok = pcall(function() vim.cmd('cprev') end)

  if ok then
    vim.api.nvim_echo({{''}}, false, {})
  else
    vim.notify('Reached the top of the list', vim.log.levels.INFO)
  end
end

M.safe_cnext = function()
  local ok = pcall(function() vim.cmd('cnext') end)

  if ok then
    vim.api.nvim_echo({{''}}, false, {})
  else
    vim.notify('Reached the end of the list', vim.log.levels.INFO)
  end
end

M.toggle_boolean = function()
  local map = {
    ['true']  = 'false',
    ['false'] = 'true',
    ['yes']   = 'no',
    ['no']    = 'yes',
    ['on']    = 'off',
    ['off']   = 'on',
    ['enable']    = 'disable',
    ['disable']   = 'enable',
  }

  local w = vim.fn.expand('<cword>')
  local v = map[w]

  if v then
    vim.cmd('normal! ciw' .. v)
  end
end

return M
