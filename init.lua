-- disable unused vim builtins -- decreases startup time
-- local disabled_built_ins = {
--   '2html_plugin',
--   'bugreport',
--   'compiler',
--   'ftplugin',
--   'getscript',
--   'getscriptPlugin',
--   'gzip',
--   'logipat',
--   'matchit',
--   'matchparen',
--   'netrw',
--   'netrwFileHandlers',
--   'netrwPlugin',
--   'netrwSettings',
--   'optwin',
--   'rplugin',
--   'rrhelper',
--   'spellfile_plugin',
--   'synmenu',
--   'syntax',
--   'tar',
--   'tarPlugin',
--   'tohtml',
--   'tutor',
--   'vimball',
--   'vimballPlugin',
--   'zip',
--   'zipPlugin',
-- }
--
-- for _, plugin in pairs(disabled_built_ins) do
--   vim.g['loaded_' .. plugin] = 1
-- end

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.mapleader = ","

vim.o.background = 'dark'
vim.o.termguicolors = true

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('plugins')
require('settings')
require('keymappings')
