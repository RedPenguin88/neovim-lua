local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
  return
end

lsp_installer.setup {
  ui = {
    icons = {
      server_installed = "",
      server_pending = "勒",
      server_uninstalled = ""
    }
  }
}
