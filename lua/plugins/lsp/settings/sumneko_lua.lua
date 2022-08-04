return {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize `vim` and `packer_plugins` globals
        globals = { "vim", "packer_plugins"},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true
        }
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      }
    }
  }
}
