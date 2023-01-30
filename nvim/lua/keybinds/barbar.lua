--Move through buffers
vim.cmd[[nnoremap <C-h> :BufferPrevious<cr>]]
vim.cmd[[nnoremap <C-l> :BufferNext<cr>]]
--Move buffers
vim.cmd[[nnoremap <A-h> :BufferMovePrev<cr>]]
vim.cmd[[nnoremap <A-l> :BufferMoveNext<cr>]]

--Delete buffer
vim.cmd([[nnoremap <C-w> :bdelete!<cr>]])

--Write buffer
vim.cmd([[imap <C-s> <esc>:w<CR>]])
vim.cmd([[nmap <C-s> <esc>:w<CR>]])

--Open New Buffer
vim.cmd([[nmap <C-t> <esc>:tabe<CR>]])
