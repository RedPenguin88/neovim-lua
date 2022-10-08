local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group
})

local filetype_group = vim.api.nvim_create_augroup("FiletypeGroup", { clear = true})
-- Set wrap and spell in markdown
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  group = filetype_group
})

local hide_group = vim.api.nvim_create_augroup("HideGroup", { clear = true })
-- Hide statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({"User"}, {
  pattern = "AlphaReady",
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
  group = hide_group
})

local color_group = vim.api.nvim_create_augroup("ColorGroup", { clear = true })
-- Workaround to reload feline when running :Catppuccin <flavour>
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		package.loaded["feline"] = nil
		package.loaded["catppuccin.groups.integrations.feline"] = nil
		require("feline").setup {
			components = require("catppuccin.groups.integrations.feline").get(),
    }
	end,
  group = color_group
})

local quit_group = vim.api.nvim_create_augroup("QuitGroup", { clear = true })
-- Use `q` to quit from common windows
vim.api.nvim_create_autocmd({"Filetype"}, {
  pattern = { "lspinfo", "help", "man" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<CR>", { silent = true })
    vim.opt.buflisted = false
  end,
  group = quit_group
})

local nvim_tree_group = vim.api.nvim_create_augroup("TreeGroup", { clear = true })
-- Quit nvim-tree if it is the last buffer
-- WARNING: If you quit without saving while NvimTree is open, neovim will crash!
vim.api.nvim_create_autocmd({"BufEnter"}, {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end,
  group = nvim_tree_group
})
