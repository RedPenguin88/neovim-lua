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
  },
  highlights = {
    fill = { guibg = { attribute = "bg", highlight = "Normal" } },
    separator = { guifg = { attribute = "bg", highlight = "Normal" } },
    separator_selected = { guifg = { attribute = "bg", highlight = "Normal" } },
    separator_visible = { guifg = { attribute = "bg", highlight = "Normal" } },
  }
}
