return {
  "lewis6991/gitsigns.nvim",
  opts = {},
  config = function()
    require('gitsigns').setup()
    vim.cmd('Gitsigns toggle_signs on')
  end,
}
