local ok, mason = pcall(require, "mason")
if not ok then
  return
end

mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "",
      package_pending = "勒",
      package_uninstalled = ""
    }
  }
})
