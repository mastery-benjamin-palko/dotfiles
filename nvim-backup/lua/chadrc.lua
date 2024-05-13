-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "doomchad",
  theme_toggle = { "doomchad", "bearded-arc" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  statusline = {
    theme = "default",
    separator_style = "round",
    lspprogress_len = 40,
  },

  nvdash = {
    load_on_startup = true,
  },

  term = {
    hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.3, vsp = 0.2 },
    float = {
      relative = "editor",
      row = 0.15,
      col = 0.10,
      width = 0.8,
      height = 0.7,
      border = "single",
    },
  },
}

return M
