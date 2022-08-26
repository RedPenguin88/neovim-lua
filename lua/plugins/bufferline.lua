local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

bufferline.setup {
  options = {
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    buffer_close_icon = "",
    modified_icon = "",
    show_close_icon = false,
    separator_style = "thin",
    offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1, text_align = "center" } },
  },
  highlights = {
    fill = { bg = { attribute = "bg", highlight = "Normal" } },
    separator = { fg = { attribute = "bg", highlight = "Normal" } },
    separator_selected = { fg = { attribute = "bg", highlight = "Normal" } },
    separator_visible = { fg = { attribute = "bg", highlight = "Normal" } },
  }
}
