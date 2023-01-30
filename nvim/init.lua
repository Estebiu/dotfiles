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
