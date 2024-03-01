---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "doomchad",
  theme_toggle = { "doomchad", "nord" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    style = "atom",
    selected_item_bg = "colored",
  },

  nvdash = {
    load_on_startup = true,
  },

  statusline = {
    theme = "default",
    separator_style = "round",
    lspprogress_len = 40,
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
