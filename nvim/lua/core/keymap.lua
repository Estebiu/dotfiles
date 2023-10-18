---Neotree
vim.cmd([[nnoremap <C-n> :Neotree toggle left reveal_force_cwd<cr>]])
vim.cmd([[nnoremap <leader>b :Neotree toggle show buffers right<cr>]])
vim.cmd([[nnoremap <leader>s :Neotree float git_status<cr>]])
vim.cmd([[nnoremap <C-b> :Neotree float toggle filesystem<cr>]])
vim.cmd([[nnoremap <C-A-n> :Neo-tree position=current<cr>]])

---Barbar
--Move through buffers
vim.cmd[[nnoremap <C-S-Tab> :BufferPrevious<cr>]]
vim.cmd[[nnoremap <C-Tab> :BufferNext<cr>]]
vim.cmd[[nnoremap <C-h> :BufferPrevious<cr>]]
vim.cmd[[nnoremap <C-l> :BufferNext<cr>]]

--Move buffers
vim.cmd[[nnoremap <A-h> :BufferMovePrev<cr>]]
vim.cmd[[nnoremap <A-l> :BufferMoveNext<cr>]]

--Restore Buffer
vim.cmd[[noremap <C-S-t> :BufferRestore<cr>]]

--Goto buffer in position...
vim.cmd[[nnoremap <silent>    <C-1> <Cmd>BufferGoto 1<CR>]]
vim.cmd[[nnoremap <silent>    <C-2> <Cmd>BufferGoto 2<CR>]]
vim.cmd[[nnoremap <silent>    <C-3> <Cmd>BufferGoto 3<CR>]]
vim.cmd[[nnoremap <silent>    <C-4> <Cmd>BufferGoto 4<CR>]]
vim.cmd[[nnoremap <silent>    <C-5> <Cmd>BufferGoto 5<CR>]]
vim.cmd[[nnoremap <silent>    <C-6> <Cmd>BufferGoto 6<CR>]]
vim.cmd[[nnoremap <silent>    <C-7> <Cmd>BufferGoto 7<CR>]]
vim.cmd[[nnoremap <silent>    <C-8> <Cmd>BufferGoto 8<CR>]]
vim.cmd[[nnoremap <silent>    <C-9> <Cmd>BufferGoto 9<CR>]]
vim.cmd[[nnoremap <silent>    <C-0> <Cmd>BufferLast<CR>]]

--Delete buffer
vim.cmd([[nnoremap <C-w> :BufferClose!<cr>]])

--Write buffer
vim.cmd([[imap <C-s> <esc>:w<CR>]])
vim.cmd([[nmap <C-s> <esc>:w<CR>]])

--Open New Buffer
vim.cmd([[nmap <C-t> <esc>:tabe<CR>]])


--Different ways to quickly quit neovim
vim.cmd([[nnoremap <leader>q :q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>]])
vim.cmd([[nnoremap <leader>w :w!<cr>]])
vim.cmd([[nnoremap <leader>x :x!<cr>]])

--Telescope
vim.cmd([[nnoremap <leader>ff <cmd>Telescope find_files<cr>]])
vim.cmd([[nnoremap <leader>fg <cmd>Telescope live_grep<cr>]])
vim.cmd([[nnoremap <leader>fb <cmd>Telescope buffers<cr>]])
vim.cmd([[nnoremap <leader>fh <cmd>Telescope help_tags<cr>]])

