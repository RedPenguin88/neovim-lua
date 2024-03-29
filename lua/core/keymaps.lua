local keymap = vim.keymap.set

-- Set leader key to <Space>
vim.g.mapleader = " "
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Navigate windows easier without having to hit <C-w> first
keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- Navigate buffers
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { silent = true })

-- Close buffer
keymap("n", "<S-q>", "<cmd>Bdelete<CR>", { silent = true })

-- Stay in indent mode when shifting lines
keymap("v", "<", "<gv", { silent = true })
keymap("v", ">", ">gv", { silent = true })

-- Clear highlights when searching
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { silent = true })

-- Neo-tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { silent = true })

-- Toggle terminal
keymap("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { silent = true })

-- By default, markdown files enable wrap, so the following keymaps deal with
-- this in a cleaner way
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", { silent = true })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
