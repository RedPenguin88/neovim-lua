local options = {
    tabstop = 4,                -- number of spaces <Tab> stands for
    shiftwidth = 4,             -- number of spaces used for each indentation
    expandtab = true,           -- in Insert mode, expand tabs into spaces
    smartindent = true,         -- better autoindenting
    number = true,              -- show line numbers
    relativenumber = false,     -- show relative line numbers; matter of personal preference
    incsearch = true,           -- allows incrementally searching, useful for complicated regex
    wrap = false,               -- do not wrap text, instead displaying one long line
    scrolloff = 8,              -- number of lines to show above and below the cursor
    sidescrolloff = 8,          -- number of lines to show to the left and right of the cursor
    clipboard = 'unnamedplus',  -- allow neovim to access your systems clipboard provider
    mouse = 'a',                -- basic mouse support in all modes
    ignorecase = true,          -- when searching ignore letter case
    smartcase = true,           -- however, if the search query has uppercase characters, override ignorecase
    splitbelow = true,          -- make vertical splits insert a window below the current one (rather than above)
    splitright = true,          -- make horizontal splits insert a window to the right of the current one (rather than left)
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
