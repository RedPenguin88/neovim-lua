local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
  return
end

nvimtree.setup {
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  renderer = {
    root_folder_modifier = ":t",
    indent_markers = { enable = true, },
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  filters = { custom = { "^.git$" } },
}
