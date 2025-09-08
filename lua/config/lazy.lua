local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})

    vim.fn.getchar()

    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

vim.opt.background = 'dark'
vim.opt.termguicolors = true

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
  install = {
    colorscheme = { 'gruvbox' }
  },
  checker = {
    enabled = false,
  },
  change_detection = {
    enabled = false,
  },
  ui = {
    icons = {
      ft = '',
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'bugreport',
        'compiler',
        'ftplugin',
        'getscript',
        'getscriptPlugin',
        'gzip',
        'logipat',
        'matchit',
        'matchparen',
        'netrw',
        'netrwFileHandlers',
        'netrwPlugin',
        'netrwSettings',
        'optwin',
        'rplugin',
        'rrhelper',
        'spellfile_plugin',
        'synmenu',
        'syntax',
        'tar',
        'tarPlugin',
        'tohtml',
        'tutor',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
      },
    },
  },
})
