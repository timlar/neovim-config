local function prequire(...)

local status, lib = pcall(require, ...)

require('luasnip.loaders.from_vscode').load({ paths = { './lua/snippets' } })

if (status) then return lib end
  return nil
end

local luasnip = prequire('luasnip')

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1

  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end
