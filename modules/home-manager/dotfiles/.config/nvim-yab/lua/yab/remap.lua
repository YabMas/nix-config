vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set('n', '\\', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '|', ':vsplit<CR>', { noremap = true, silent = true })
