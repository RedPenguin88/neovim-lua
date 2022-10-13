local options = {
  tabstop = 4,                            -- number of spaces <Tab> stands for
  shiftwidth = 4,                         -- number of spaces used for each indentation
  expandtab = true,                       -- in Insert mode, expand tabs into spaces
  cindent = true,                         -- c-like indenting which behaves better than smartindent for me, personal preference
  number = true,                          -- show line numbers
  relativenumber = false,                 -- show relative line numbers; matter of personal preference
  signcolumn = "yes",                     -- always show the signcolumn
  incsearch = true,                       -- allows incrementally searching, useful for complicated regex
  completeopt = {"menuone", "noselect"},  -- make insert mode completion better
  wrap = false,                           -- do not wrap text, instead displaying one long line
  cursorline = true,                      -- highlight the line the cursor is on, helps to find the cursor easily
  scrolloff = 8,                          -- number of lines to show above and below the cursor
  sidescrolloff = 8,                      -- number of lines to show to the left and right of the cursor
  clipboard = "unnamedplus",              -- allow neovim to access your systems clipboard provider
  mouse = "a",                            -- basic mouse support in all modes
  mousescroll = "ver:1,hor:3",            -- make neovim scroll 1 line at a time vertically and 3 lines at a time horizontally using mouse
  ignorecase = true,                      -- when searching ignore letter case
  smartcase = true,                       -- however, if the search query has uppercase characters, override ignorecase
  splitbelow = true,                      -- make vertical splits insert a window below the current one (rather than above)
  splitright = true,                      -- make horizontal splits insert a window to the right of the current one (rather than left)
  termguicolors = true,                   -- enable 24-bit RBG color; requires your terminal to support this feature
  updatetime = 250,                       -- shorten update time, mostly for CursorHold event
  laststatus = 3,                         -- enable global status line
  cmdheight = 0,                          -- do not display the command-line unless used (experimental)
  conceallevel = 2,                       -- hide certain text for clarity (e.g. LaTeX)
  showmode = false,                       -- do not show the mode on the last line
  showcmd = false,                        -- do not show cmd in the last line
  ruler = false,                          -- do not show the ruler in the last line
  fillchars = { eob = " " }               -- do not show `~` on empty lines
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
