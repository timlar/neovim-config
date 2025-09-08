return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function() require('config.gruvbox') end
  },

  {
    'numToStr/Comment.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    config = function() require('config.comment') end
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'BufReadPost',
    config = function() require('config.todo-comments') end
  },

  {
    'echasnovski/mini.nvim',
    version = false,
    event = 'BufReadPost',
    config = function() require('config.mini') end
  },

  {
    'cappyzawa/trim.nvim',
    event = 'BufReadPost',
    config = function() require('config.trim') end
  },

  { 'RRethy/nvim-treesitter-endwise', ft = { 'ruby' } },

  {
    'tpope/vim-rails',
    ft = { 'ruby' },
    config = function() require('config.vim-rails') end
  },

  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('config.gitsigns') end
  },

  {
    'pwntester/octo.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function() require('config.octo') end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPost',
    config = function() require('config.indent-blankline') end
  },

  {
    'lifepillar/pgsql.vim',
    ft = { 'sql', 'psql' },
    config = function() require('config.pgsql') end
  },

  {
    'nvim-tree/nvim-web-devicons',
    config = function() require('config.devicons') end
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('config.nvim-tree') end
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('config.lualine') end
  },

  {
    'nvim-telescope/telescope.nvim',
    event = 'BufReadPost',
    keys = { '<leader>fg', '<leader>ff' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-live-grep-args.nvim' ,
        version = "^1.0.0",
      },
    },
    config = function() require('config.telescope') end
  },

  {
    'kevinhwang91/nvim-bqf',
    event = 'BufReadPost',
    config = function() require('config.bqf') end
  },

  {
    'benmills/vimux',
    event = 'BufReadPost',
    config = function() require('config.vimux') end
  },

  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   ft = { 'markdown' },
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   config = function() require('config.render-markdown') end
  -- },

  -- {
  --   'olimorris/codecompanion.nvim',
  --   event = 'BufReadPost',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   config = function() require('config.codecompanion') end
  -- },

  -- Linters and Formatters --------------------------------------------------------------------------------------------

  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    ft = { 'ruby', 'rspec', 'javascript', 'typescript', 'vue', 'html', 'lua' },
    build = "make install_jsregexp",
    config = function() require('config.luasnip') end
  },

  {
    'neovim/nvim-lspconfig',
    lazy = true,
    ft = {
      'ruby', 'rspec', 'javascript', 'typescript', 'vue', 'graphql', 'json', 'yaml',
      'css', 'scss', 'sass', 'dockerfile', 'lua'
    },
    dependencies = {
      'folke/lsp-colors.nvim',
      'mason-org/mason-lspconfig.nvim',
      {
        'williamboman/mason.nvim',
        config = function() require('config.mason') end
      },
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
        config = function() require('config.cmp') end
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
    config = function() require('config.lspconfig') end
  },

  -- Syntax Highlighting -----------------------------------------------------------------------------------------------

  { 'chr4/nginx.vim', ft = { 'nginx' } },
  { 'ericpruitt/tmux.vim', ft = { 'tmux' } },
  { 'hashivim/vim-terraform', ft = { 'tf', 'hcl', 'tfvars', 'terraformrc', 'tfstate', 'terraform' } },
  { 'tbastos/vim-lua', ft = { 'lua' } },
  { 'fatih/vim-go', ft = { 'go' } },

  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufReadPost',
    dependencies = {
      -- 'p00f/nvim-ts-rainbow',
      'nvim-treesitter/nvim-treesitter-textobjects'
    },
    build = ':TSUpdate',
    config = function() require('config.nvim-treesitter') end
  }
}
