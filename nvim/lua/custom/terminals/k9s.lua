local M = {
  toggle = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local k9s = Terminal:new { cmd = "k9s", direction = 'float', hidden = true }
    k9s:toggle()
  end,
}

return M
