local ok, config = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

config.setup {
  ensure_installed = "all",
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  autopairs = {
    enable = true
  }
}
