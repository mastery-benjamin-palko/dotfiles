---@type MappingsTable
local M = {}
M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },

    ["<leader>te"] = {
      function()
        require("base46").toggle_theme()
      end,
      "toggle theme",
    },

    ["[t"] = { ":tabprevious<CR>", "previous tab" },

    ["]t"] = { ":tabnext<CR>", "next tab" },

    ["lg"] = {
      function()
        require("custom.terminals.lazygit").toggle()
      end,
      "Lazy Git",
    },

    ["k9"] = {
      function()
        require("custom.terminals.k9s").toggle()
      end,
      "K9S",
    },

    ["md"] = {
      function()
        require("custom.terminals.glow").toggle()
      end,
      "Glow",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
