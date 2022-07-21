local keymap = vim.keymap.set

-- Set leader key to <Space>
vim.g.mapleader = " "
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Navigate windows easier without having to hit <C-w> first
keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- Clear highlights when searching
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { silent = true })

-- By default, markdown files enable wrap, so the following keymaps deal with
-- this in a cleaner way
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
