require "nvchad.mappings"

local nomap = vim.keymap.del

nomap("t", "<ESC>")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>")

-- Formatting
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "Format" })

-- Theming
map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "Toggle Transparency" })

map("n", "<leader>te", function()
  require("base46").toggle_theme()
end, { desc = "Toggle Theme" })

-- Terminals
map("n", "lg", function()
  require("nvchad.term").toggle { pos = "float", id = "lazygit", cmd = "lazygit" }
end, { desc = "k9s" })

map("n", "k9", function()
  require("nvchad.term").toggle { pos = "float", id = "k9s", cmd = "k9s" }
end, { desc = "Lazygit" })

map("n", "md", function()
  require("nvchad.term").toggle { pos = "float", id = "glow", cmd = "glow" }
end, { desc = "Glow" })

map("t", "<C-k>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Close Terminal" })

-- Testing

map("n", "<leader>mr", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Test - Run Nearest" })

map("n", "<leader>mw", function()
  require("neotest").watch.toggle(vim.fn.expand("%"))
  require("neotest").summary.toggle()
end, { desc = "Test - Watch" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
