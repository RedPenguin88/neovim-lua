local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

local ctp_ok, ctp_bufferline = pcall(require, "catppuccin.groups.integrations.bufferline")
if not ctp_ok then
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
  highlights = ctp_bufferline.get()
}
