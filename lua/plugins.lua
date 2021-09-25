local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
end

vim.cmd 'packadd packer.nvim'
-- vim.cmd 'packadd nvim-treesitter'
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

require('plugins.packer')

require('packer').startup(function()
  use '/usr/local/opt/fzf'

  use { 'wbthomason/packer.nvim', opt = true }
  use 'AndrewRadev/splitjoin.vim'
  use 'chriskempson/base16-vim'
  -- use 'tomtom/tcomment_vim'
  -- use 'suy/vim-context-commentstring'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'tpope/vim-commentary'
  use 'tpope/vim-abolish'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'wellle/targets.vim'

  use { 'tpope/vim-endwise', ft = { 'ruby' } }
  use { 'tpope/vim-rails', ft = { 'ruby' } }

  -- use {
  --   'npxbr/gruvbox.nvim',
  --   requires = { 'rktjmp/lush.nvim' }
  -- }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugins.indent-blankline') end
  }

  use {
    'junegunn/fzf.vim',
    config = function() require('plugins.fzf') end
  }

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require('plugins.galaxyline') end,
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
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

  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   config = function() require('plugins.nvim-tree') end
  -- }

  use {
    'preservim/nerdtree',
    requires = { 'tiagofumo/vim-nerdtree-syntax-highlight', 'ryanoasis/vim-devicons' },
    config = function() require('plugins.nerdtree') end
  }

  use {
    'SirVer/ultisnips',
    config = function() require('plugins.ultisnips') end
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
    config = function() require('plugins.gitsigns') end,
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('plugins.nvim-colorizer') end
  }

  -- Linters and Formatters --------------------------------------------------------------------------------------------

  use {
    'prettier/vim-prettier',
    run = 'npm install',
    ft = { 'javascript', 'vue', 'css', 'json', 'ruby' },
    config = function() require('plugins.vim-prettier') end
  }

  use {
    'w0rp/ale',
    ft = { 'html', 'css', 'scss', 'vue', 'javascript', 'typescript', 'ruby', 'markdown' },
    config = function() require('plugins.ale') end
  }

  use {
    'neoclide/coc.nvim',
    branch = 'release',
    -- ft = { 'typescript', 'javascript', 'vue', 'json', 'html' },
    config = function() require('plugins.coc-nvim') end
  }

  -- use {
  --   'neovim/nvim-lspconfig',
  --   run = 'npm install -g typescript typescript-language-server vls',
  --   config = function() require('plugins.nvim-lspconfig') end
  -- }

  -- Syntax Highlighting -----------------------------------------------------------------------------------------------

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.nvim-treesitter') end
  }
  use { 'nvim-treesitter/playground' }

  -- use { 'cakebaker/scss-syntax.vim', ft = { 'scss', 'css', 'vue' } }
  use { 'sheerun/html5.vim', ft = { 'html', 'vue' } }
  use { 'tbastos/vim-lua', ft = { 'lua' } }
  use { 'vim-ruby/vim-ruby', ft = { 'ruby' } }
  use { 'HerringtonDarkholme/yats.vim', ft = { 'typescript', 'vue' } }
  use { 'chr4/nginx.vim', ft = { 'nginx' } }
  use { 'ekalinin/Dockerfile.vim', ft = { 'Dockerfile' } }
  use { 'ericpruitt/tmux.vim', ft = { 'tmux' } }
  use { 'jparise/vim-graphql', ft = { 'graphql' } }
  use { 'keith/rspec.vim', ft = { 'rspec' } }
  use { 'pangloss/vim-javascript', ft = { 'javascript', 'json', 'vue' } }
  use { 'vim-python/python-syntax', ft = { 'python' } }
  use { 'hashivim/vim-terraform', ft = { 'tf', 'hcl', 'tfvars', 'terraformrc', 'tfstate', 'terraform' } }

  use {
    'posva/vim-vue',
    ft = { 'vue' },
    config = function() require('plugins.vue') end
  }

  use {
    'lifepillar/pgsql.vim',
    ft = { 'sql', 'psql' },
    config = function() require('plugins.pgsql') end
  }
end)
