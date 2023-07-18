-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- d
--

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,}
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/nvim-treesitter-context");

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
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
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use("folke/zen-mode.nvim")
  -- use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")

  -- masks config file values with ********
  -- use("laytan/cloak.nvim")
  -- configure here: after/plugin/cloak.lua


  -- Jon Turner cusomizations
  use("tpope/vim-rails")
  use("tpope/vim-commentary")
  -- use("tpope/vim-endwise")
  -- This is just a rewrite of https://github.com/tpope/vim-endwise to leverage
  -- Treesitter so it can be more accurate and work without having to run
  -- Neovim's slow regex based highlighting along with nvim-treesitter highlighting.
  use("RRethy/nvim-treesitter-endwise")

  use("tpope/vim-repeat")

  use("christoomey/vim-tmux-navigator")
  -- use("morhetz/gruvbox")
  use("github/copilot.vim")
  use("AndrewRadev/ember_tools.vim")
  use("tpope/vim-projectionist")
  use {
      "folke/which-key.nvim",
      config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  }
  use("tpope/vim-rhubarb")

  -- use("vim-ruby/vim-ruby")
  -- add new plugin
  -- :so
  -- :PackerSync

end)

