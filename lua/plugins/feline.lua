local ctp_ok, ctp_feline = pcall(require, "catppuccin.groups.integrations.feline")
local bar_ok, feline = pcall(require, "feline")
if not (ctp_ok and bar_ok) then
  return
end

ctp_feline.setup {
	assets = {
		left_separator = "",
		right_separator = "",
		mode_icon = "",
	},
}

feline.setup {
  components = ctp_feline.get()
}
