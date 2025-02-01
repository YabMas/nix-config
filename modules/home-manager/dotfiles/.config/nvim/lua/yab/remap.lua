vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- move selected line up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keeping cursor in place after join
vim.keymap.set("n", "J", "mzJ`z")

-- overwrite selected text without replacing register
vim.keymap.set("x", "<C-p>", "\"_dp")

-- making splits
vim.keymap.set('n', '\\', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '|', ':vsplit<CR>', { noremap = true, silent = true })
