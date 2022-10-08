local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
  return
end

catppuccin.setup {
  term_colors = true,
  dim_inactive = { enabled = true },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
  },
}

vim.cmd("colorscheme catppuccin")
