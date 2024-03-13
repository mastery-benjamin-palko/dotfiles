local M = {
  toggle = function ()
    local Terminal = require("toggleterm.terminal").Terminal
    local glow = Terminal:new { cmd = "glow", direction = 'float', hidden = true }
    glow:toggle()
  end,
}

return M
