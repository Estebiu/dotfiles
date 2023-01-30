--Different ways to quickly quit neovim
vim.cmd([[nnoremap <leader>q :q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>]])
vim.cmd([[nnoremap <leader>w :w!<cr>]])
vim.cmd([[nnoremap <leader>x :x!<cr>]])

--Paste to system clipboard (currently not working)
vim.cmd([[nnoremap <leader>y :"+y<cr>]])
vim.cmd([[vnoremap <C-y> :"+y<cr>]])

--Delete buffer
vim.cmd([[nnoremap <C-w> :bdelete!<cr>]])

--Write buffer
vim.cmd([[imap <C-s> <esc>:w<CR>]])
vim.cmd([[nmap <C-s> <esc>:w<CR>]])

--Open New Buffer
vim.cmd([[nmap <C-t> <esc>:tabe<CR>]])

--Cool effects
vim.cmd([[nmap <C-k> <esc>:CellularAutomaton make_it_rain<CR>]])
vim.cmd([[nmap <C-b> <esc>:CellularAutomaton game_of_life<CR>]])

