local config_path = vim.fn.stdpath('config')

-- DEBUG: :lua require('luasnip').log.open()

require('luasnip.loaders.from_lua').load({ paths = config_path .. '/snippets/lua' })
require('luasnip.loaders.from_vscode').load({ paths = config_path .. '/snippets/vscode' })
