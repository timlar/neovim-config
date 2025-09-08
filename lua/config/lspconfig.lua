local lspconfig = require('lspconfig')
local cmp = require('cmp_nvim_lsp')
local h = require('helpers')
local icons = h.icons.lspconfig
local map = vim.keymap.set

-- vim.lsp.set_log_level('debug')

lspconfig.util.default_config.flags = { debounce_text_changes = 150 }

-- vim.diagnostic.config({ virtual_lines = { current_line = true } })

local popup_border = { border = 'rounded' }
local format_opts = { async = true, timeout_ms = 3000 }

map('n', 'K', function() vim.lsp.buf.hover(popup_border) end, { desc = 'LSP: Tooltip' })
map('n', 'grD', function() vim.lsp.buf.declaration(popup_border) end, { desc = 'LSP: Declaration' })
map({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, { desc = 'LSP: Code actions' })
map('n', 'grn', vim.lsp.buf.rename, { noremap = true, desc = 'LSP: Renames all references to the symbol under the cursor' })
map('n', 'grr', vim.lsp.buf.references, { desc = 'LSP: Lists all the references to the symbol under the cursor' })
map('n', 'gri', vim.lsp.buf.implementation, { desc = 'LSP: Lists all the implementations for the symbol under the cursor' })
map('n', 'grt', function() vim.lsp.buf.type_definition(popup_border) end, { desc = 'LSP: Jumps to the definition of the type of the symbol under the cursor' })
map('n', 'grs', function() vim.lsp.buf.signature_help(popup_border) end, { desc = 'LSP: Displays signature information about the symbol under the cursor' })
map('n', 'grd', vim.lsp.buf.definition, { desc = 'LSP: Jumps to the definition of the symbol under the cursor' })
map('n', 'ge', function() vim.diagnostic.open_float(popup_border) end, { desc = 'LSP: Diagnostic' })
map('n', '[e', function() vim.diagnostic.jump({ count = -1, float = popup_border }) end, { desc = 'LSP: Move to previous diagnostic' })
map('n', ']e', function() vim.diagnostic.jump({ count = 1, float = popup_border }) end, { desc = 'LSP: Move to next diagnostic' })
map('n', '<leader>cf', function() vim.lsp.buf.format(format_opts) end, { desc = 'LSP: Format code' })
map('n', '<leader>cF', '<cmd>LspEslintFixAll<cr>', { desc = 'LSP: ESLint fix all' })

local capabilities = cmp.default_capabilities()

-- Docs: https://github.com/vuejs/language-tools/wiki/Neovim
local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = '@vue/typescript-plugin',
            location = vim.fn.stdpath('data') .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
            languages = { 'vue' },
            configNamespace = 'typescript',
          },
        },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'vue' },
}

local vue_ls_config = {
  capabilities = capabilities,
  on_init = function(client)
    client.handlers['tsserver/request'] = function(_, result, context)
      local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })

      if #clients == 0 then
        vim.notify('Could not find `vtsls` lsp client, `vue_ls` would not work without it.', vim.log.levels.ERROR)

        return
      end

      local ts_client = clients[1]
      local param = unpack(result)
      local id, command, payload = unpack(param)

      ts_client:exec_cmd({
        title = 'vue_request_forward',
        command = 'typescript.tsserverRequest',
        arguments = {
          command,
          payload,
        },
      }, { bufnr = context.bufnr }, function(_, r)
          local response_data = { { id, r.body } }

          ---@diagnostic disable-next-line: param-type-mismatch
          client:notify('tsserver/response', response_data)
        end)
    end
  end,
  -- init_options = {
  --   documentFeatures = {
  --     documentFormatting = false
  --   },
  --   preferences = {
  --     disableSuggestions = true,
  --   },
  -- },
  settings = {
    html  = { format = { enable = false } },
    css   = { format = { enable = false }, lint = { unknownAtRules = 'ignore' } },
    scss  = { format = { enable = false }, lint = { unknownAtRules = 'ignore' } },
    emmet = {
      -- https://docs.emmet.io/customization/preferences/
      preferences = {
        ['profile.allowCompactBoolean'] = true,
        ['output.compactBoolean'] = true,
        ['output.selfClosingStyle'] = 'xhtml',
      },
    },
  },
}

local ruby_lsp_config = {
  capabilities = capabilities,
  init_options = {
    formatter = 'rubocop',
    linters = { 'rubocop' },
    addonSettings = {
      ['Ruby LSP Rails'] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}

local lua_ls_config = {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name

      if
        ---@diagnostic disable-next-line: undefined-field
        path ~= vim.fn.stdpath('config') and vim.uv.fs_stat(path .. '/.luarc.json')
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

-- local emmet_ls_config = {
--   capabilities = capabilities,
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ['comment.enabled'] = false,
--         ['bem.enabled'] = false,
--         ['jsx.enabled'] = false,
--         ['output.compactBoolean'] = true,
--         ['output.selfClosingStyle'] = 'xhtml',
--       },
--     },
--   }
-- }

-- local stylelint_lsp_config = {
--   settings = {
--     stylelintplus = {
--       -- configFile =
--     }
--   }
-- }

vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.config('ruby_lsp', ruby_lsp_config)
vim.lsp.config('lua_ls', lua_ls_config)
-- vim.lsp.config('emmet_ls', emmet_ls_config)
-- vim.lsp.config('stylelint_lsp', stylelint_lsp_config)

vim.lsp.enable({ 'vtsls', 'vue_ls' })
vim.lsp.enable('eslint')
vim.lsp.enable('jsonls')
vim.lsp.enable('graphql')
vim.lsp.enable('ruby_lsp')
vim.lsp.enable('dockerls')
vim.lsp.enable('docker_compose_language_service')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('lua_ls')
-- vim.lsp.enable('emmet_ls')
-- vim.lsp.enable('stylelint_lsp')

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = true,
  float = {
    border = 'rounded',
    header = '',
    prefix = '',
    source = 'if_many',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.error,
      [vim.diagnostic.severity.HINT]  = icons.hint,
      [vim.diagnostic.severity.INFO]  = icons.info,
      [vim.diagnostic.severity.WARN]  = icons.warn,
    },
  },
})
