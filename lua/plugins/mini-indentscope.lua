return {
  "echasnovski/mini.indentscope",
  version = "*",
  config = function()
    require("mini.indentscope").setup({
      -- symbol = "▏",
      symbol = "│",
      options = { 
        try_as_border = true,
        border = 'both',
      },
    })
  end,
}
