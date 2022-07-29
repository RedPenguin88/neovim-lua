local ok, kanagawa = pcall(require, "kanagawa")
if not ok then
  return
end

kanagawa.setup {
  globalStatus = true,
  dimInactive = true
}

vim.cmd("colorscheme kanagawa")
