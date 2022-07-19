for _, module in ipairs {
  "core.options",
  "core.keymaps",
  "core.plugins",
  "plugins.colorscheme",
  "plugins.treesitter",
} do
  local ok, _ = pcall(require, module)
  if not ok then
    print("Error loading " .. module)
  end
end
