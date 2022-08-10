local bar_ok, feline = pcall(require, "feline")
local color_ok, colors = pcall(require, "kanagawa.colors")
if not (bar_ok and color_ok) then
  return
end

local default_colors = colors.setup()

local lsp = require("feline.providers.lsp")
local vi_mode = require("feline.providers.vi_mode")

local vi_mode_colors = {
  NORMAL = default_colors.crystalBlue,
  INSERT = default_colors.autumnGreen,
  VISUAL = default_colors.oniViolet,
  OP = default_colors.crystalBlue,
  BLOCK = default_colors.oniViolet,
  LINES = default_colors.oniViolet,
  REPLACE = default_colors.autumnRed,
  ['V-REPLACE'] = default_colors.autumnRed,
  ENTER = default_colors.sakuraPink,
  MORE = default_colors.sakuraPink,
  SELECT = default_colors.surimiOrange,
  COMMAND = default_colors.boatYellow2,
  SHELL = default_colors.crystalBlue,
  TERM = default_colors.crystalBlue,
  NONE = default_colors.fujiGray
}

local comps = {
  vi_mode = {
    provider = function()
      return "  " .. vi_mode.get_vim_mode()
    end,
    hl = function()
      return {
        name = vi_mode.get_mode_highlight_name(),
        fg = vi_mode.get_mode_color(),
      }
    end,
    right_sep = " "
  },
  file_info = {
    provider = {
      name = "file_info",
      opts = {
        file_readonly_icon = '  ',
      }
    },
    hl = {
      fg = default_colors.crystalBlue,
      style = "bold"
    }
  },
  diag = {
    error = {
      provider = "diagnostic_errors",
      enabled = function()
        return lsp.diagnostics_exist("Error")
      end,
      hl = {
        fg = default_colors.samuraiRed
      }
    },
    warn = {
      provider = "diagnostic_warnings",
      enabled = function()
        return lsp.diagnostics_exist("Warn")
      end,
      hl = {
        fg = default_colors.roninYellow
      }
    },
    hint = {
      provider = "diagnostic_hints",
      enabled = function()
        return lsp.diagnostics_exist("Hint")
      end,
      hl = {
        fg = default_colors.dragonBlue
      }
    },
    info = {
      provider = "diagnostic_info",
      enabled = function()
        return lsp.diagnostics_exist("Info")
      end,
      hl = {
        fg = default_colors.waveAqua1
      }
    }
  },
  git = {
    branch = {
      provider = "git_branch",
    },
    added = {
      provider = "git_diff_added",
      hl = {
        fg = default_colors.autumnGreen
      }
    },
    changed = {
      provider = "git_diff_changed",
      hl = {
        fg = default_colors.autumnYellow
      }
    },
    removed = {
      provider = "git_diff_removed",
      hl = {
        fg = default_colors.autumnRed
      }
    }
  },
  lsp_name = {
    provider = "lsp_client_names",
    left_sep = " ",
    hl = {
      fg = default_colors.boatYellow2
    }
  },
  os = {
    provider = function()
      local icons = {
        ["UNIX"] = " ",
        ["MAC"] = " ",
        ["DOS"] = " "
      }
      local os = vim.bo.fileformat:upper()
      return icons[os] .. os
    end,
    left_sep = " ",
    right_sep = " ",
    hl = {
      fg = default_colors.sakuraPink,
      style = "bold"
    }
  },
  position = {
    provider = "position",
    right_sep = " ",
    hl = {
      fg = default_colors.oniViolet
    }
  },
  line_percentage = {
    provider = "line_percentage",
    right_sep = " ",
    hl = {
      style = "bold"
    }
  },
  scroll_bar = {
    provider = "scroll_bar",
    hl = {
      fg = default_colors.crystalBlue,
      style = "bold"
    }
  }
}

local components = {
  active = {},
  inactive = {}
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], comps.vi_mode)
table.insert(components.active[1], comps.file_info)
table.insert(components.active[1], comps.diag.error)
table.insert(components.active[1], comps.diag.warn)
table.insert(components.active[1], comps.diag.hint)
table.insert(components.active[1], comps.diag.info)
table.insert(components.active[3], comps.git.branch)
table.insert(components.active[3], comps.git.added)
table.insert(components.active[3], comps.git.changed)
table.insert(components.active[3], comps.git.removed)
table.insert(components.active[3], comps.lsp_name)
table.insert(components.active[3], comps.os)
table.insert(components.active[3], comps.position)
table.insert(components.active[3], comps.line_percentage)
table.insert(components.active[3], comps.scroll_bar)

feline.setup {
  colors = { bg = colors.bg, fg = colors.fg },
  vi_mode_colors = vi_mode_colors,
  components = components
}
