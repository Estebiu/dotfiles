local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
-- Packer can manage itself
  use 'wbthomason/packer.nvim'

--theme
	use { "catppuccin/nvim", as = "catppuccin" }
--Cool effects
	use 'eandrju/cellular-automaton.nvim' 
--file tree
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	}

--startup menu
	use {
		"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	}

--telescope, fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires =  {'nvim-lua/plenary.nvim'}
	}
--filebrowser for telescope
	use { "nvim-telescope/telescope-file-browser.nvim" }

--indents with pretty lines uwu
	use {"lukas-reineke/indent-blankline.nvim",
		requires = {"nvim-treesitter/nvim-treesitter"}
	}
--nvim-treesitter
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
--eww support
	use "elkowar/yuck.vim"
--barbar
	use {'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons'}


-- whichkey
-- Lua
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

--lualine
	use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true }}

--comment toggler
	use 'terrortylor/nvim-comment'

--autopairs
	use 'windwp/nvim-autopairs'

--LSP etc manager
	use 'williamboman/mason.nvim'

--LSP configurator
	use 'williamboman/mason-lspconfig.nvim'

--Rust tools
	use {'simrat39/rust-tools.nvim', requires = {'neovim/nvim-lspconfig'}}

--LSP completion engine
	use {
	        'hrsh7th/nvim-cmp',
		requires = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip',
		}
	}
  if packer_bootstrap then
    require('packer').sync()
  end
end)

