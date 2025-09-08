package.path = package.path .. ';' .. os.getenv('HOME') .. '/.luarocks/share/lua/5.1/?.lua'
package.path = package.path .. ';' .. os.getenv('HOME') .. '/.luarocks/share/lua/5.1/?/init.lua'
package.cpath = package.cpath .. ';' .. os.getenv('HOME') .. '/.luarocks/lib/lua/5.1/?.so'

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

require('helpers')
require('config.lazy')
require('autocmds')
require('settings')
require('keymappings')
