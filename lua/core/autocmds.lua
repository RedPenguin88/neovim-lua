local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group
})

local filetype_group = vim.api.nvim_create_augroup("FiletypeGroup", { clear = true})
-- Set wrap and spell in markdown
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  group = filetype_group
})

local hide_group = vim.api.nvim_create_augroup("HideGroup", { clear = true })
-- Hide statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({"User"}, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
  group = hide_group
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
