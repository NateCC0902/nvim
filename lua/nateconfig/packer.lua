
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('mbbill/undotree')

  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  -- Snippet Collection (Optional)
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
  }

  use "windwp/windline.nvim"

  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

  use "yamatsum/nvim-cursorline"

  use { 'michaelb/sniprun', run = 'bash ./install.sh'}

  use { "catppuccin/nvim", as = "catppuccin" }

  use "JASONews/glow-hover"

  use "onsails/lspkind.nvim"
  

  --COLOR SETS

  use 'folke/tokyonight.nvim'
  use({ 'rose-pine/neovim',as = 'rose-pine'})
  use 'Mofiqul/dracula.nvim'

  --COLOR SETS

end)
