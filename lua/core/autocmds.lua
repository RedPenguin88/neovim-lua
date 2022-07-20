local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group
})

local filetype_group = vim.api.nvim_create_augroup('FiletypeGroup', { clear = true})
-- Set wrap and spell in markdown
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  group = filetype_group
})
