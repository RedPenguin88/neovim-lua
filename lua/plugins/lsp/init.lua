local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

require("plugins.lsp.lsp-installer")
require("plugins.lsp.handlers").setup()

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'sumneko_lua' }

local opts = {}

for _, server in ipairs(servers) do
  opts = {
    on_attach = require("plugins.lsp.handlers").on_attach(),
    handlers = require("plugins.lsp.handlers").handlers
  }
  if server == "sumneko_lua" then
    opts = vim.tbl_extend("force", require("plugins.lsp.settings.sumneko_lua"), opts)
  end
  lspconfig[server].setup(opts)
end
