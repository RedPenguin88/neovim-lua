local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

-- Automatically source and re-compile packer whenever you save this file.
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerSync",
  group = packer_group,
  pattern = "plugins.lua"
})

-- Use pcall to prevent errors
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup({function(use)
  -- Package Manager
  use "wbthomason/packer.nvim"
  -- Optimize startup time
  use "lewis6991/impatient.nvim"
  -- Lua functions
  use "nvim-lua/plenary.nvim"
  -- Popup API
  use "nvim-lua/popup.nvim"
  -- Fancy icons
  use "kyazdani42/nvim-web-devicons"
  -- Colorscheme
  use {
    "rebelot/kanagawa.nvim",
    config = function() require("plugins.colorscheme") end
  }
  -- Syntax Highlighting via treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
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
  -- Configurations for Nvim LSP
  use "neovim/nvim-lspconfig"
  -- Easy-to-use LSP installer
  use {
    "williamboman/nvim-lsp-installer",
    config = function() require("plugins.lsp") end
  }
  -- Completion
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use {
    "hrsh7th/nvim-cmp",
    config = function() require("plugins.cmp") end
  }
  -- Indent Lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("plugins.indent-blankline") end
  }
  -- Gitsigns in signcolumn
  use {
    "lewis6991/gitsigns.nvim",
    config = function() require("gitsigns").setup() end
  }
  -- Statusbar
  use {
    "feline-nvim/feline.nvim",
    config = function() require("plugins.feline") end
  }
  -- Tabline
  use {
    "romgrk/barbar.nvim",
    config = function() require("plugins.barbar") end
  }
  use {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end
  }
  -- Telescope fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    config = function() require("plugins.telescope") end
  }
  -- Native telescope sorter
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim",
    run = "make",
    config = function() require("telescope").load_extension("fzf") end
  }
  -- Toggleable terminal
  use {
    "akinsho/toggleterm.nvim",
    config = function() require("plugins.toggleterm") end
  }

  if packer_bootstrap then
    print "*******************************************************"
    print "*Installing plugins. After completion, restart nvim...*"
    print "*******************************************************"
    require("packer").sync()
  end
end,
config = {
  display = {
    working_sym = "勒",
    error_sym = "",
    done_sym = "",
    removed_sym = "",
    moved_sym = "",
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end
  }
}})
