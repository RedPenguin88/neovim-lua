local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
  return
end

indent_blankline.setup {
  char = "▏",
  context_char = "▏",
  use_treesitter = true,
  show_trailing_blankline_indent = false,
  show_current_context = true,
}
