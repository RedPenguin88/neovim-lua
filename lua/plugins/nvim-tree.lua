local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
  return
end

local config_status_ok, nvimtree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local nvimtree_cb = nvimtree_config.nvim_tree_callback

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
  view = {
    width = 30,
    height = 30,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = nvimtree_cb "edit" },
        { key = "h", cb = nvimtree_cb "close_node" },
        { key = "v", cb = nvimtree_cb "vsplit" },
      },
    },
  },
  filters = { custom = { "^.git$" } },
}
