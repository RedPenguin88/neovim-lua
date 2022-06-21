local options = {
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    number = true,
    relativenumber = false,
    incsearch = true,
    wrap = false,
    scrolloff = 8,
    sidescrolloff = 8,
    clipboard = 'unnamedplus',
    mouse = 'a',
    ignorecase = true,
    smartcase = true,
    splitbelow = true,
    splitright = true
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
