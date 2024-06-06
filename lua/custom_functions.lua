local module = {}

module.yank_without_paste = function()
  vim.fn.setreg('x', vim.fn.getreg('"'))
  vim.api.nvim_paste(vim.fn.getreg('"'), true, -1)
  vim.fn.setreg('"', vim.fn.getreg('x'))
end

-- custom terminal prompt function
module.terminalPrompt = function(Dactyl)
  vim.ui.input({ prompt = "New Terminal Name: " }, function(input)
    if input == nil then
      return
    else
      vim.cmd("ToggleTerm name=" .. input)
    end
  end)
end

module.split_term = function()
  local Terminal = require('toggleterm.terminal').Terminal
  local split_term = Terminal:new({
    direction = "horizontal" -- or "vertical" for a vertical split
  })
  split_term:toggle()
end

module.comment_block = function()
  local api = require("Comment.api")
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

  vim.api.nvim_feedkeys(esc, "nx", false)

  -- local start_pos = vim.fn.getpos("'<")
  -- local end_pos = vim.fn.getpos("'>")

  api.toggle.linewise(vim.fn.visualmode())

  -- Restore the visual selection
  -- vim.fn.setpos('.', start_pos)
  -- vim.api.nvim_feedkeys('v', 'n', false)

  -- Move to end position and adjust selection
  -- vim.fn.setpos('.', end_pos)
end

return module
