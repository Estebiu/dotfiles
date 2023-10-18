--Numbers
vim.opt.relativenumber = true 
vim.opt.number = true

--Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

--Line wrapping
vim.opt.wrap = false

--Search
vim.opt.ignorecase = true
vim.opt.smartcase = true 

--Cursor line
vim.opt.cursorline = false

--Appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

--Backspace
vim.opt.backspace = "indent,eol,start"

--Clipboard
vim.opt.clipboard:append("unnamedplus")

--Split
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.iskeyword:append("-")
