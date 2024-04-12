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
end, { desc = "Lazy Git" })

map("n", "ld", function()
  require("nvchad.term").toggle { pos = "float", id = "lazydocker", cmd = "lazydocker" }
end, { desc = "Lazy Docker" })

map("n", "ls", function()
  require("nvchad.term").toggle { pos = "float", id = "lazysql", cmd = "lazysql" }
end, { desc = "Lazy SQL" })

map("n", "k9", function()
  require("nvchad.term").toggle { pos = "float", id = "k9s", cmd = "k9s" }
end, { desc = "k9s" })

map("n", "md", function()
  require("nvchad.term").toggle { pos = "float", id = "glow", cmd = "glow" }
end, { desc = "Glow" })

map("t", "<C-q>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Close Terminal" })

-- Testing

map("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Test - Summary" })

-- Debugging

map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Breakpoint condition" })

map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
-- { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
-- { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
-- { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
-- { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
-- { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
-- { "<leader>dj", function() require("dap").down() end, desc = "Down" },
-- { "<leader>dk", function() require("dap").up() end, desc = "Up" },
-- { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
-- { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
-- { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
-- { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
-- { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
-- { "<leader>ds", function() require("dap").session() end, desc = "Session" },
-- { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
-- { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
