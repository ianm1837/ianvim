return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = "codedark",
        disabled_filetypes = { 'neo-tree' },
        section_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
      }
    }
  end
} 
