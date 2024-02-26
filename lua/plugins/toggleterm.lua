return { 
  "akinsho/toggleterm.nvim", 
  version = "*", 
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<c-j>]],
      start_in_insert = true,
      direction = "float",
      float_opts = {
        border = 'double',
      },
      insert_mappings = true,
      terminal_mappings = true,
    })
  end,
}
