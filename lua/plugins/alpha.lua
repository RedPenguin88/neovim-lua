local ok, alpha = pcall(require, "alpha")
if not ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
 [[███╗   ███╗██╗███╗   ██╗██╗   ██╗██╗███╗   ███╗]],
 [[████╗ ████║██║████╗  ██║██║   ██║██║████╗ ████║]],
 [[██╔████╔██║██║██╔██╗ ██║██║   ██║██║██╔████╔██║]],
 [[██║╚██╔╝██║██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
 [[██║ ╚═╝ ██║██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║]],
 [[╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
}

dashboard.section.buttons.val = {
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  dashboard.button("u", " " .. " Update Plugins", ":PackerSync <CR>"),
  dashboard.button("c", " " .. " Settings", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
