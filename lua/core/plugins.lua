local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd [[packadd packer.nvim]]
  print "*******************************************************"
  print " Installing plugins. After completion, restart nvim... "
  print "*******************************************************"
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

packer.startup({function(use)
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
    "catppuccin/nvim",
    as = "catppuccin",
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
  -- Easy Package Manager for LSP and more
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  -- Configurations for Nvim LSP
  use {
    "neovim/nvim-lspconfig",
    config = function() require("plugins.lsp") end
  }
  -- Completion
  use {
    "hrsh7th/cmp-nvim-lsp",
    after = "nvim-cmp"
  }
  use {
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp"
  }
  use {
    "hrsh7th/cmp-path",
    after = "nvim-cmp"
  }
  use {
    "hrsh7th/cmp-nvim-lua",
    after = "nvim-cmp"
  }
  use {
    "saadparwaiz1/cmp_luasnip",
    after = "nvim-cmp"
  }
  use {
    "hrsh7th/nvim-cmp",
    config = function() require("plugins.cmp") end
  }
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
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
    after = "nvim-web-devicons",
    config = function() require("plugins.feline") end
  }
  -- Tabline
  use {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = function() require("plugins.bufferline") end
  }
  -- Better behavior for deleting buffers
  use {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" }
  }
  -- File tree
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle" },
    config = function() require("plugins.nvim-tree") end
  }
  -- Performant color highlighter
  use {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end
  }
  -- Telescope fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
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
    cmd = "ToggleTerm",
    config = function() require("plugins.toggleterm") end
  }
  -- Commenting plugin
  use {
    'numToStr/Comment.nvim',
    keys = { "gc", "gb", "g<", "g>" },
    config = function() require("Comment").setup() end
  }
  -- Startup
  use {
    "goolord/alpha-nvim",
    config = function() require("plugins.alpha") end
  }

  if PACKER_BOOTSTRAP then
    packer.sync()
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
