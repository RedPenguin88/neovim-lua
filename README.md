# minvim

My (not so) minimal, and opinionated neovim configuration using the newest
goodies from the neovim nightly.

## Plugins

- [Nvim-LSP](https://github.com/neovim/nvim-lspconfig): Quickstart configurations for Neovim's built in LSP
- [Cmp](https://github.com/hrsh7th/nvim-cmp): Autocompletion that *just works*.
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Provides better syntax highlighting
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim): Git gutter integration
- [Feline](https://github.com/feline-nvim/feline.nvim): Preconfigured statusbar with git and LSP integration
- [Bufferline](https://github.com/akinsho/bufferline.nvim): Snazzy buffer line reminiscent of modern GUI editors
- [Telescope](https://github.com/nvim-telescope/telescope.nvim): Powerful fuzzy finder for files, buffer, and more
- [Toggleterm](https://github.com/akinsho/toggleterm.nvim): Toggleable terminal
- More plugins can be found [here](lua/core/plugins.lua)

## Dependencies

- One [Nerd Font](https://www.nerdfonts.com/font-downloads) of your choice
- [Neovim Nightly](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Terminal which has true color support; see [this](https://github.com/termstandard/colors) for more information

### Optional Dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep) for Telescope's live grep
- [fd](https://github.com/sharkdp/fd) for Telescope's finder

*Remember to run `:checkhealth` to see if you are missing something!*
