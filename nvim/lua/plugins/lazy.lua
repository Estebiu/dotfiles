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
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
        require('dashboard').setup {
            shortcut_type = number
        }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {
        "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} 
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
})
