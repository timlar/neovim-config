local h = require('helpers')
local icons = h.icons.mason

require('mason').setup({
  ui = {
    border = nil,
    icons = {
      package_pending = icons.package_pending,
      package_installed = icons.package_installed,
      package_uninstalled = icons.package_uninstalled,
    },
  },

  max_concurrent_installers = 10,
})

-- require('mason-lspconfig').setup {
--   ensure_installed = {
--     'docker_compose_language_service',
--     'dockerls',
--     'emmet_ls',
--     'eslint',
--     'graphql',
--     'jsonls',
--     'ruby_lsp',
--     'stylelint_lsp',
--     'tailwindcss',
--     'vtsls',
--     'vue_ls',
--     'lua_ls'
--   },
-- }
