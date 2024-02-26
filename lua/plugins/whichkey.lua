return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.setup()

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({cmd = "lazygit", hidden = true})

    function _lazygit_toggle()
      lazygit:toggle()
    end

    wk.register({
      ["<leader>"] = {
        g = { "<cmd>lua _lazygit_toggle()<CR>", "LazyGit" },
        w = {
          name = "Windows",
          h = { "<cmd>wincmd h<CR>", "Window select - Left" },
          j = { "<cmd>wincmd j<CR>", "Window select - Down" },
          k = { "<cmd>wincmd k<CR>", "Window select - Up" },
          l = { "<cmd>wincmd l<CR>", "Window select - Right" },
          c = { "<cmd>close<CR>", "Window close" },
          n = {
            name = "New Split",
            h = { "<cmd>vsplit<CR>", "Window - Left" },
            j = { "<cmd>bel split<CR>", "Window - Down" },
            k = { "<cmd>split<CR>", "Window - Up" },
            l = { "<cmd>bel vsplit<CR>", "Window - Right" },
          },
        },
        b = {
          name = "Buffers",
          n = { "<cmd>bn<CR>", "Buffer Next" },
          p = { "<cmd>bp<CR>", "Buffer Previous" },
          d = { "<cmd>bd<CR>", "Buffer Delete" },
        },
        q = { "<cmd>q<CR>", "Quit" },
        s = { "<cmd>s<CR>", "Save" },
        e = { "<cmd>Neotree toggle<CR>", "Explore Files" },
        f = {
          name = "Find",
          f = {"<cmd>Telescope find_files<CR>", "Find Files" },
          g = {"<cmd>Telescope live_grep<CR>", "Grep Files" },
          b = {"<cmd>Telescope buffers<CR>", "Find Buffers" },
          h = {"<cmd>Telescope help_tags<CR>", "Find Help" },
        },
        u = { "<cmd>UndotreeToggle<CR>", "UndoTree Toggle" },
        l = {
          name = "LSP",
          c = { vim.lsp.buf.code_action, "Code Action" },
          i = { "<cmd>LspInfo<CR>", "LspInfo" },
          I = { "<cmd>LspInstall<CR>", "LspInstall" },
        },
      },
      ["\\"] = { "<cmd>Neotree toggle<CR>", "Toggle Neotree" },
    })

    local terminal_opts = {
      mode = "t",
    }


    wk.register({
        ["<C-x>"] = { "<C-\\><C-n>", "Terminal = exit insert mode" },
    },
    terminal_opts)
  end,
}
