-- $ brew install pgformatter stylua
-- $ gem install solargraph
-- $ npm install -g typescript typescript-language-server eslint prettier @tailwindcss/language-server vscode-langservers-extracted @volar/server vls yaml-language-server
require('nvim-lsp-installer').setup {
  ensure_installed = {
    'dockerls',
    'graphql',
    'solang',
    'solc',
    'sumneko_lua',
    'tflint',
    'eslint',
    'solargraph',
    'stylelint_lsp',
    'tailwindcss',
    'tsserver',
    'volar',
    'yamlls'
  },
}

local lspconfig = require('lspconfig')

-- to show debug info execute: lua vim.cmd('e'..vim.lsp.get_log_path())
-- vim.lsp.set_log_level('debug')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }

  client.server_capabilities.document_formatting = false

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
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" } })<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" } })<cr>', opts)
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

lspconfig.volar.setup({
  on_attach = on_attach,
  cmd = { 'volar-server', '--stdio' },
})

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })]]

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

-- gruvbox color theme
vim.cmd [[
  hi DiagnosticSignError ctermfg=1 ctermbg=0 guifg=Red guibg=NONE
  hi DiagnosticSignWarn ctermfg=3 ctermbg=0 guifg=Orange guibg=NONE
  hi DiagnosticSignHint ctermfg=7 ctermbg=0 guifg=LightGrey guibg=NONE
  hi DiagnosticSignInfo ctermfg=4 ctermbg=0 guifg=LightBlue guibg=NONE
  hi NormalFloat guibg=none
  hi FloatBorder guifg=gray guibg=none
]]
