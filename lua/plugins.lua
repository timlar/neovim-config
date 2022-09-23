local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
end

vim.cmd 'packadd packer.nvim'
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

require('plugins.packer')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require('packer').startup(function()
  use { 'wbthomason/packer.nvim', opt = true }
  use 'AndrewRadev/splitjoin.vim'
  use 'base16-project/base16-vim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'tpope/vim-commentary'
  use 'tpope/vim-abolish'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'wellle/targets.vim'

  use { 'tpope/vim-endwise', ft = { 'ruby' } }
  use { 'tpope/vim-rails', ft = { 'ruby' } }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugins.indent-blankline') end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.nvim-lualine') end
  }

  use {
    'ntpeters/vim-better-whitespace',
    config = function() require('plugins.vim-better-whitespace') end
  }

  use {
    'mattn/emmet-vim',
    ft = { 'erb', 'html', 'vue' },
    config = function() require('plugins.emmet-vim') end
  }

  use {
    'junegunn/vim-easy-align',
    config = function() require('plugins.vim-easy-align') end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.nvim-tree') end
  }

  use {
    'diepm/vim-rest-console',
    config = function() require('plugins.vim-rest-console') end
  }

  use {
    'benmills/vimux',
    config = function() require('plugins.vimux') end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.gitsigns') end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.telescope') end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('plugins.nvim-colorizer') end
  }

  -- Linters and Formatters --------------------------------------------------------------------------------------------

  use {
    'neovim/nvim-lspconfig',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/nvim-cmp',
      'saadparwaiz1/cmp_luasnip',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function() require('plugins.null-ls') end
      }
    },
    config = function() require('plugins.nvim-lspconfig') end
  }

  use {
    'L3MON4D3/LuaSnip',
    requires = { 'hrsh7th/nvim-cmp' },
    config = function() require('plugins.luasnip') end
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.nvim-cmp') end
  }

  -- Syntax Highlighting -----------------------------------------------------------------------------------------------

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = { 'p00f/nvim-ts-rainbow' },
    config = function() require('plugins.nvim-treesitter') end
  }
  -- use { 'nvim-treesitter/playground' } -- :TSPlaygroundToggle

  -- use { 'HerringtonDarkholme/yats.vim', ft = { 'typescript', 'vue' } } -- typescript
  -- use { 'ekalinin/Dockerfile.vim', ft = { 'Dockerfile' } }
  -- use { 'jparise/vim-graphql', ft = { 'graphql' } }
  -- use { 'pangloss/vim-javascript', ft = { 'javascript', 'json', 'vue' } }
  -- use { 'sheerun/html5.vim', ft = { 'html', 'vue' } }
  -- use { 'vim-python/python-syntax', ft = { 'python' } }
  use { 'chr4/nginx.vim', ft = { 'nginx' } }
  use { 'ericpruitt/tmux.vim', ft = { 'tmux' } }
  use { 'hashivim/vim-terraform', ft = { 'tf', 'hcl', 'tfvars', 'terraformrc', 'tfstate', 'terraform' } }
  use { 'keith/rspec.vim', ft = { 'rspec' } }
  use { 'tbastos/vim-lua', ft = { 'lua' } }

  use {
    'vim-ruby/vim-ruby',
    ft = { 'ruby' },
    config = function() require('plugins.ruby') end
  }

  use {
    'lifepillar/pgsql.vim',
    ft = { 'sql', 'psql' },
    config = function() require('plugins.pgsql') end
  }
end)
