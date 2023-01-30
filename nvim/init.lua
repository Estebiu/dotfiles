--Load plugins

require("plugins")


--Load setups
--Theme
require("setups/catppuccin")
--		Loads settings native to Neovim
require("setups/native")
--		File tree
require("setups/neo-tree")
--		Startup page
require("setups/startup")
--		Fuzzy finder
require("setups/telescope")
--		Pretty blankline lines
require("setups/indent-blankline")
--		Treesitter, syntax stuff
require("setups/treesitter")
--		barbar, for multiple buffers
require("setups/barbar")
--		Lualine, for pretty line that tells me cool things
require("setups/lualine")
--		Comment toggler
require("setups/nvim-comment")
--		Autopairs
require("setups/nvim-autopairs")

--THE ORDER OF THE THINGS IN THE FOLLOWING BLOCK IS IMPORTANT
--		Completeion engine for LSP servers
require("setups/lsp/nvim-cmp")
--		Package manager for language servers etc
require("setups/lsp/mason")
--		LSP configurator
require("setups/lsp/mason-lspconfig")



--Load keybinds

--		Native
require("keybinds/native")
--		File tree
require("keybinds/neo-tree")
--		Fuzzy finder
require("keybinds/telescope")
--		Bufferline
require("keybinds/barbar")

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
  if packer_bootstrap then
    require('packer').sync()
  end
end)
