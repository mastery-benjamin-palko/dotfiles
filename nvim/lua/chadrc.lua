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
}

return M
