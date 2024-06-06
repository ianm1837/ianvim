-- import dependencies
local custom_functions = require("custom_functions")
local wk = require("which-key")
wk.setup()

-- leaderkey
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- buffer navigation
wk.register({
  ["<A-l>"] = { vim.cmd.bn, "Buffer Next" },
  ["<A-h>"] = { vim.cmd.bp, "Buffer Prev" },
  ["<c-h>"] = { "<Cmd>wincmd h<CR>", "Move left one window"},
  ["<c-j>"] = { "<Cmd>wincmd j<CR>", "Move down one window"},
  ["<c-k>"] = { "<Cmd>wincmd k<CR>", "Move up one winodw" },
  ["<c-l>"] = { "<Cmd>wincmd l<CR>", "Move right one window"},
}, { mode = { "n", "v", "i" } })

wk.register({
  -- ["<CR>"] = { require('cmp').mapping.confirm({ select = true }), "Comfirm completion choice" }
  -- the above is a bad idea
  -- <c-n> is to scroll the autocomplete
  -- <cr> is set to accept the selection
  -- <c-f> is for scrolling docs
  -- <c-b> is for scrolling back in docs
  -- -----------
  -- settings are in plugin-config.lua
}, {mode = 'i'})

wk.register({
  ["p"] = { custom_functions.visual_paste_without_yank, "Paste without yank" },
}, { mode = { "n", "v" } })

wk.register({
  ["<leader>"] = {
    d = { "<cmd>Dashboard<CR>" , "GoTo Dashboard" },
    w = { require("window-picker").pick_window, "Visual Window Picker" },
    bd = { "<cmd>bd<cr>", "Delete Buffer" },
    bp = { "<cmd>bp<cr>", "Buffer Prev" },
    bn = { "<cmd>bn<cr>", "Buffer Next" },
  },
}, { mode = "n" })

wk.register({
  ["<C-S-j>"] = { "<Cmd>MultipleCursorsAddDown<CR>", "Add Cursor Below" },
  ["<C-S-k>"] = { "<Cmd>MultipleCursorsAddUp<CR>", "add cursor above" },
  ["<c-down>"] = { "<cmd>multiplecursorsadddown<cr>", "add cursor below" },
  ["<c-up>"] = { "<Cmd>MultipleCursorsAddUp<CR>", "add cursor above" },
  ["<c-leftmouse>"] = { "<Cmd>MultipleCursorsMouseAddDelete<CR>", "add remove multiple cursors" },
  ["\\"] = { "<cmd>Neotree toggle<cr>", "toggle neotree" },
  ["<c-\\>"] = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
  ["<c-/>"] = { require("Comment.api").toggle.linewise.current , "Comment current line or selection" },
  -- this seems to be useless
  -- ["<a-/>"] = { "<cmd>lua require('Comment.api').call('toggle.blockwise.current', 'g@$')<cr>", "Toggle comment block" },
  gd = { vim.lsp.buf.definition, "go to definition" },
  gD = { vim.lsp.buf.declaration, "go to declaration" },
  bf = { vim.lsp.buf.format, "buffer format" },
  ca = { vim.lsp.buf.code_action, "code action" },
  tn = { custom_functions.terminalPrompt, "Open a custom Terminal" },
  ts = { "<cmd>TermSelect<cr>" , "Select From Open Terminals" },
  tr = { "<cmd>ToggleTermSetName<cr>", "Rename Terminal" },
}, { mode = "n" })

wk.register({
  ["<c-/>"] = { "<ESC><CMD>lua require('Comment.api').locked('toggle.linewise')(vim.fn.visualmode())<CR>gv", "Comment out block of code in visual mode" },
  ["<a-/>"] = { "<ESC><CMD>lua require('Comment.api').locked('toggle.blockwise')(vim.fn.visualmode())<CR>gv", "Comment out block of code in visual mode" },
}, { mode = 'v' })

-- terminal keys
wk.register({
  ["<c-\\>"] = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
  ["<c-s-k>"] = { "<cmd>resize +5<cr>", "Increase Window Size" },
  ["<c-s-j>"] = { "<cmd>resize -5<cr>", "Decrease Window Size" },
  ["<c-h>"] = { "<Cmd>wincmd h<CR>", "Move left one window"},
  ["<c-j>"] = { "<Cmd>wincmd j<CR>", "Move down one window"},
  ["<c-k>"] = { "<Cmd>wincmd k<CR>", "Move up one winodw" },
  ["<c-l>"] = { "<Cmd>wincmd l<CR>", "Move right one window"},
  ["<c-n>"] = { custom_functions.split_term, "Split your currently open terminal"},
  ["<esc>"] = { "<cmd>stopinsert<cr>", "Exit Terminal Mode" },
}, { mode = 't' })

wk.register({
  ["<leader>f"] = {
    f = { "<cmd>Telescope find_files<cr>", "find files" },
    g = { "<cmd>Telescope live_grep<cr>", "grep files" },
    b = { "<cmd>Telescope buffers<cr>", "find buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "find help" },
  },
}, { mode = "n" })
