local keymap = vim.keymap.set

-- Set leader key to <Space>
vim.g.mapleader = " "
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Navigate windows easier without having to hit <C-w> first
keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })
