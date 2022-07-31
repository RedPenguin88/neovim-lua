local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end

toggleterm.setup {
  size = 10,
  open_mapping = [[<c-\>]],
}
