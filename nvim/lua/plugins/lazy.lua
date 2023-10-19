local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "catppuccin-mocha"
        end
    },
    {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
        lazy = true
    },
    {
        "nvim-treesitter/nvim-treesitter",
        priority = 1000, 
        build = ":TSUpdate"
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {{"lewis6991/gitsigns.nvim"}, {"nvim-tree/nvim-web-devicons"}}
    },
    {
        "nvim-lualine/lualine.nvim",
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        "sbdchd/neoformat"
    },
    {
        {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {
            labels = "123456789",
            search = {
                mode = "exact"
            }
        },
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
            },
        },
    },
    {
        "williamboman/mason.nvim"
    },
    {
        "williamboman/mason-lspconfig.nvim"
    },
    {
        "neovim/nvim-lspconfig"
    },
    {
        "simrat39/rust-tools.nvim"
    },


        -- Completion framework:
    {
        "hrsh7th/nvim-cmp" 
    },

    -- LSP completion source:
    {
        "hrsh7th/cmp-nvim-lsp"
    },

    -- ful completion sources:
    {
        "hrsh7th/cmp-nvim-lua"
    },
    {
        "hrsh7th/cmp-nvim-lsp-signature-help"
    },
    {
        "hrsh7th/cmp-vsnip"                             
    },
    {
        "hrsh7th/cmp-path"
    },
    {
        "hrsh7th/cmp-buffer"
    },                            
    {
        "hrsh7th/vim-vsnip"
    },
    {
        "voldikss/vim-floaterm"
    },
})
