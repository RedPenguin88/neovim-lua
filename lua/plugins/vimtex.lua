local ok, _ = pcall(require, "vimtex")
if not ok then
  return
end

vim.g["vimtex_view_method"] = "zathura"
vim.g["tex_flavor"] ='latex'
vim.g["vimtex_quickfix_enabled"] = 0
