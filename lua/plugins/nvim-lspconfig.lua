-- $ brew install pgformatter stylua
-- $ gem install solargraph
-- $ npm install -g typescript typescript-language-server eslint prettier @tailwindcss/language-server vscode-langservers-extracted @volar/server vls yaml-language-server

local lspconfig = require('lspconfig')

-- to show debug info execute: lua vim.cmd('e'..vim.lsp.get_log_path())
-- vim.lsp.set_log_level('debug')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }

  client.resolved_capabilities.document_formatting = false

  capabilities = capabilities

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
end

local servers = { 'eslint', 'solargraph', 'tailwindcss', 'volar', 'yamlls' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

lspconfig.tsserver.setup({
  on_attach = on_attach,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
})

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]]

-- gruvbox color theme
vim.cmd [[
  hi DiagnosticSignError ctermfg=1 ctermbg=0 guifg=Red guibg=#3c3836
  hi DiagnosticSignWarn ctermfg=3 ctermbg=0 guifg=Orange guibg=#3c3836
  hi DiagnosticSignHint ctermfg=7 ctermbg=0 guifg=LightGrey guibg=#3c3836
  hi DiagnosticSignInfo ctermfg=4 ctermbg=0 guifg=LightBlue guibg=#3c3836
]]

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type

  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = 'always'
  }
})
