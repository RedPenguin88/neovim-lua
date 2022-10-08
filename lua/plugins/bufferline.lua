local buffer_ok, bufferline = pcall(require, "bufferline")
local ctp_buffer_ok, ctp_bufferline = pcall(require, "catppuccin.groups.integrations.bufferline")
local ctp_pal_ok, ctp_palette = pcall(require, "catppuccin.palettes")
if not (buffer_ok and ctp_buffer_ok and ctp_pal_ok) then
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
  highlights = ctp_bufferline.get {
    custom = {
      all = {
        fill = { bg = ctp_palette.get_palette().mantle }
      }
    }
  }
}
