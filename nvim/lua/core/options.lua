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

--LSP/Rust
--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])


