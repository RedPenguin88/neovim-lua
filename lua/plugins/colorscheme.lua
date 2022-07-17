local ok, _ = pcall(vim.cmd, 'colorscheme kanagawa')
if not ok then
  return
end
