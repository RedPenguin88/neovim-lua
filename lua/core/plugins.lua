local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Automatically source and re-compile packer whenever you save this file.
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerSync',
  group = packer_group,
  pattern = 'plugins.lua'
})

-- Use pcall to prevent errors
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup({function(use)
  -- Package Manager
  use 'wbthomason/packer.nvim'
  -- Colorscheme
  use {
    'rebelot/kanagawa.nvim',
    config = function() require("plugins.colorscheme") end
  }
  -- Syntax Highlighting via treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function() require("plugins.treesitter") end
  }
  -- Autopairs plugin
  use {
    "windwp/nvim-autopairs",
    config = function() require("plugins.autopairs") end
  }
  -- Fast indentation detection
  use {
    "darazaki/indent-o-matic",
    config = function() require("plugins.indent-o-matic") end
  }

  if packer_bootstrap then
    print 'Installing plugins. After completion, restart nvim...'
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end
  }
}})
