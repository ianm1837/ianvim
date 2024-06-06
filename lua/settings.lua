-- Global Settings
vim.g.neovide_cursor_vfx_mode = "pixiedust" -- for Neovide
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_unlink_border_highlights = true
vim.g.neovide_refresh_rate = 165
vim.g.neovide_refresh_rate_idle = 5


vim.g.loaded_perl_provider = 0              -- do not load nvim perl provider - silence checkhealth warnings
vim.g.have_nerd_font = true                 -- declare that we are using a nerd font for some plugins
vim.g.suda_smart_edit = 1 
vim.opt.showmode = false

vim.diagnostic.config({virtual_text = false}) -- disable inline suggestions

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.relativenumber = true

vim.cmd('set clipboard+=unnamedplus')       -- unnamedplus defaluts to system clipboard

vim.o.timeout = true                        -- set for which-key
vim.o.timeoutlen = 300                      -- set for which-key

vim.g.nvim_man_default_target = 'current'   -- setting for man plugin to open in a full window


