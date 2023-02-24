-- $ gem install solargraph solargraph-rails
-- $ brew install lua-language-server pgformatter stylua yamllint
-- $ npm install -g @fsouza/prettierd @tailwindcss/language-server @volar/vue-language-server dockerfile-language-server-nodejs eslint eslint_d fixjson graphql-language-service-cli prettier stylelint typescript typescript-language-server yaml-language-server

require('mason').setup({
  ui = {
    border = 'rounded',
  }
})

-- ◍ dockerfile-language-server
-- ◍ eslint-lsp
-- ◍ eslint_d
-- ◍ fixjson
-- ◍ graphql-language-service-cli
-- ◍ lua-language-server
-- ◍ prettierd
-- ◍ stylelint-lsp
-- ◍ tailwindcss-language-server
-- ◍ tflint
-- ◍ typescript-language-server
-- ◍ vue-language-server
-- ◍ yaml-language-server
-- ◍ yamlfmt
-- ◍ yamllint

local lspconfig = require('lspconfig')

require('lspconfig.ui.windows').default_options.border = 'rounded'

-- to show debug info execute: lua vim.cmd('e'..vim.lsp.get_log_path()) or :LspLog
-- vim.lsp.set_log_level('debug')

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
-- map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
-- map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true }, 3000)<cr>', opts)
map('n', '<leader>F', '<cmd>EslintFixAll<cr>', opts)
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })<cr>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" } })<cr>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" } })<cr>', opts)

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  capabilities = capabilities
end

local servers = {
  'graphql',
  'tailwindcss',
  'eslint',
  'jsonls',
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

lspconfig.solargraph.setup({
  on_attach = on_attach,
  cmd = { 'solargraph', 'stdio' },
})

lspconfig.volar.setup({
  on_attach = on_attach,
  init_options = {
    documentFeatures = {
      documentFormatting = false
    }
  }
})

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
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })]]

local signs = { Error = '', Warn = '', Hint = '', Info = '' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type

  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = true,
  float = {
    border = 'rounded',
    header = '',
    prefix = '',
    source = 'always',
  }
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

-- gruvbox color theme fixes
vim.cmd [[
  hi! NormalFloat guibg=none
  hi! FloatBorder guifg=gray guibg=none
]]
