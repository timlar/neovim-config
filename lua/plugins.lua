local opts = {
  install = { colorscheme = { 'base16-gruvbox-dark-medium' } },
  -- ui = {
  --   border = 'rounded',
  -- },
  checker = {
    enabled = false,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
  -- performance = {
  --   rtp = {
  --     disabled_plugins = {
  --       '2html_plugin',
  --       'getscript',
  --       'getscriptPlugin',
  --       'gzip',
  --       'logipat',
  --       'matchit',
  --       'matchparen',
  --       'netrw',
  --       'netrwFileHandlers',
  --       'netrwPlugin',
  --       'netrwSettings',
  --       'rrhelper',
  --       'spellfile_plugin',
  --       'tar',
  --       'tarPlugin',
  --       'vimball',
  --       'vimballPlugin',
  --       'zip',
  --       'zipPlugin',
  --     },
  --   },
  -- },
  -- checker = { enabled = false },
}

require('lazy').setup({
  -- { 'base16-project/base16-vim', priority = 1000 },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function() require('config.gruvbox') end
  },

  -- 'JoosepAlviste/nvim-ts-context-commentstring',
  { 'echasnovski/mini.comment', version = false },

  'tpope/vim-commentary',
  'tpope/vim-abolish',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'wellle/targets.vim',
  -- 'dstein64/vim-startuptime',

  { 'tpope/vim-endwise', ft = { 'ruby' } },
  { 'tpope/vim-rails', ft = { 'ruby' } },

  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('config.nvim-tree') end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('config.lualine') end
  },

  {
    'mattn/emmet-vim',
    ft = { 'erb', 'html', 'vue' },
    config = function() require('config.emmet-vim') end
  },

  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('config.gitsigns') end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('config.indent-blankline') end
  },

  -- {
  --   'norcalli/nvim-colorizer.lua',
  --   config = function() require('config.nvim-colorizer') end
  -- },

  {
    'lifepillar/pgsql.vim',
    ft = { 'sql', 'psql' },
    config = function() require('config.pgsql') end
  },

  {
    'AndrewRadev/splitjoin.vim',
    config = function() require('config.splitjoin') end
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('config.telescope') end
  },

  {
    'ntpeters/vim-better-whitespace',
    config = function() require('config.vim-better-whitespace') end
  },

  {
    'junegunn/vim-easy-align',
    config = function() require('config.vim-easy-align') end
  },

  {
    'diepm/vim-rest-console',
    ft = { 'rest' },
    config = function() require('config.vim-rest-console') end
  },

  {
    'benmills/vimux',
    config = function() require('config.vimux') end
  },

  -- Linters and Formatters --------------------------------------------------------------------------------------------

  {
    'L3MON4D3/LuaSnip',
    ft = { 'ruby', 'rspec', 'javascript', 'typescript', 'vue', 'css', 'scss', 'sass', 'html' },
    config = function() require('config.luasnip') end
  },

  {
    'neovim/nvim-lspconfig',
    lazy = true,
    ft = { 'ruby', 'rspec', 'javascript', 'typescript', 'vue', 'json', 'yaml', 'css', 'scss', 'sass' },
    dependencies = {
      'folke/lsp-colors.nvim',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      {
        'hrsh7th/nvim-cmp',
        dependencies = {
          'onsails/lspkind.nvim',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-cmdline',
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-path',
          'saadparwaiz1/cmp_luasnip',
        },
        config = function() require('config.nvim-cmp') end
      },
      {
        'nvimdev/guard.nvim',
        dependencies = { 'nvimdev/guard-collection' },
        config = function() require('config.guard') end
      },
      {
        'j-hui/fidget.nvim',
        config = function() require('config.fidget') end
      },
    },
    config = function() require('config.nvim-lspconfig') end
  },

  -- Syntax Highlighting -----------------------------------------------------------------------------------------------

  { 'chr4/nginx.vim', ft = { 'nginx' } },
  { 'ericpruitt/tmux.vim', ft = { 'tmux' } },
  { 'hashivim/vim-terraform', ft = { 'tf', 'hcl', 'tfvars', 'terraformrc', 'tfstate', 'terraform' } },
  { 'keith/rspec.vim', ft = { 'rspec' } },
  { 'tbastos/vim-lua', ft = { 'lua' } },
  { 'fatih/vim-go', ft = { 'go' } },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'p00f/nvim-ts-rainbow',
      'nvim-treesitter/nvim-treesitter-textobjects'
    },
    -- build = ':TSUpdate',
    config = function() require('config.nvim-treesitter') end
  }
}, opts)
