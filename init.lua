-- Lazy Plugin Manager Setup
-- -------------------------

-- Clone Lazy if it doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set up Lazy and parse plugins. Provide some non-default options
require("lazy").setup(require("user_plugins").plugins(), {
  checker = {                     -- Update Check
     enabled = true,
     frequency = 311040000,
     notify = false,
   },
   change_detection = {            -- Watch plugins for config changes, but don't notify for it.
     enabled = true,
     notify = false,
   }
 })

require("user_plugins").config()

require("settings")
require("binds")
