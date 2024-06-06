local module = {}

function module.plugins()
  return {
    -- UI
    "Mofiqul/vscode.nvim",                     -- color theme
    "nvimdev/dashboard-nvim",                  -- dashboard
    "lewis6991/gitsigns.nvim",                 -- gutter git icons
    "nvim-lualine/lualine.nvim",               -- status bar
    "echasnovski/mini.indentscope",            -- animated indent lines
    "nvim-neo-tree/neo-tree.nvim",             -- File tree browser
    "AckslD/nvim-neoclip.lua",                 -- Clipboard history - integrates with Telescope
    "s1n7ax/nvim-window-picker",               -- UI Window Labels
    "nvim-telescope/telescope.nvim",           -- google it if you don't know, it the goat
    "nvim-telescope/telescope-ui-select.nvim", -- Telescope UI component for nvim integration
    "nvim-treesitter/nvim-treesitter",         -- syntax highlighting
    "folke/which-key.nvim",                    -- pop-up keybind helper
    "akinsho/bufferline.nvim",                 -- show buffers as "tabs"
    "akinsho/toggleterm.nvim",                 -- a toggle-able terminal
    "mbbill/undotree",                         -- show an visual undo history tree
    "stevearc/dressing.nvim",
    "utilyre/barbecue.nvim",
    "SmiteshP/nvim-navic",

    -- Function
    "0x00-ketsu/autosave.nvim",               -- it saves... automatically
    "numToStr/Comment.nvim",                  -- enables commenting with keybinds
    "paretje/nvim-man",                       -- search and browse man files in nvim - settings in settings.lua
    "brenton-leighton/multiple-cursors.nvim", -- multiple cursors
    "christoomey/vim-tmux-navigator",         -- provides seamless tmux navigation
    'LnL7/vim-nix',                           -- nix language syntax highlighting and more
    'lambdalisue/vim-suda',                   -- enable sudo

    -- Language Server
    "williamboman/mason.nvim",             -- manage LSP servers, DAP servers, linters, and formatters
    "williamboman/mason-lspconfig.nvim",   -- bridges mason.nvim with the lspconfig plugin
    "neovim/nvim-lspconfig",               -- collection of LSP configurations for different servers
    "nvimdev/lspsaga.nvim",                -- Improves the Neovim built-in LSP experience. Pop up function definitions, breadcrumbs, code actions, rename, etc...
    "nvimtools/none-ls.nvim",              -- integrate tools such as linters and formatters to nvims lsp functionality
    "folke/neodev.nvim",                   -- Neovim development plugin: provides api documentation and lsp info
    -- Completion - Somewhat LSP related
    "hrsh7th/nvim-cmp",                    -- Completion engine. Requires completion sources
    "hrsh7th/cmp-nvim-lsp",                -- nvim lsp client completion source bridge
    "hrsh7th/cmp-nvim-lsp-signature-help", -- Completion source for function signatures
    "L3MON4D3/LuaSnip",                    -- code snippet management engine
    "rafamadriz/friendly-snippets",        -- snippet collection for luasnip
    "saadparwaiz1/cmp_luasnip",            -- cmp source bridge for luasnip
    "windwp/nvim-autopairs",               -- auto completes 'closures' () {} [] <> etc
    "windwp/nvim-ts-autotag",              -- auto closes html tags

    -- Dependencies
    "nvim-tree/nvim-web-devicons", -- Icons used by lspsaga, neotree, dashboard, bufferline
    "kkharji/sqlite.lua",          -- sqlite support used by neoclip
    "nvim-lua/plenary.nvim",       -- lua functions library used by telescope
    "MunifTanjim/nui.nvim",
  }
end

-- config-only in binds.lua:
-- -------------------------
-- vim-tmux-navigator
-- Comment
-- toggleterm
-- man

function module.config()
  local plugins_config = require("plugins_config")
  local lspconfig = require("lspconfig")

  require("vscode").setup(plugins_config.vscode_theme_config())
  require("vscode").load()
  require("dashboard").setup(plugins_config.dashboard_config)
  require('gitsigns').setup()
  require("lualine").setup(plugins_config.lualine_config)
  require("mini.indentscope").setup(plugins_config.mini_indentscope_config)
  require("window-picker").setup(plugins_config.window_picker_setup)
  require("neo-tree").setup(plugins_config.neotree_config)
  require('neoclip').setup(plugins_config.neoclip_config)
  require("telescope").setup(plugins_config.telescope_setup)
  require("telescope").load_extension("ui-select")
  require("nvim-treesitter.configs").setup(plugins_config.treesitter_config)
  require("which-key").setup()
  require("bufferline").setup(plugins_config.bufferline_config)
  require("toggleterm").setup({ direction = "horizontal" })
  require("autosave").setup()
  require("Comment").setup()
  require("multiple-cursors").setup()
  require("mason").setup()
  require("mason-lspconfig").setup({ automatic_installation = true })
  require("neodev").setup() -- must be before lsp server setup
  require("dressing").setup({ input = { relative = "editor" } })
  lspconfig.lua_ls.setup(plugins_config.lspconfig_lua_config)
  lspconfig.tsserver.setup(plugins_config.lspconfig_tsserver_config)
  lspconfig.jsonls.setup(plugins_config.lspconfig_jsonls_config)
  -- lspconfig.nil_ls.setup(plugins_config.lspconfig_nil_ls_config)  -- not working on arch for some reason
  lspconfig.cssls.setup(plugins_config.lspconfig_cssls_config)
  lspconfig.rust_analyzer.setup(plugins_config.lspconfig_rust_analyzer_config)
  lspconfig.gopls.setup(plugins_config.lspconfig_gopls_config)
  lspconfig.emmet_ls.setup(plugins_config.lspconfig_emmet_ls_config)
  lspconfig.tailwindcss.setup(plugins_config.lspconfig_tailwindcss_config)
  require("lspsaga").setup(plugins_config.lspsaga_config)
  require("barbecue").setup()
  require("cmp").setup(plugins_config.cmp_config)
  require("luasnip.loaders.from_vscode").lazy_load()
    require('luasnip').filetype_extend("javascript", { "html" })
    require('luasnip').filetype_extend("typescript", { "html" })
    require('luasnip').filetype_extend("javascript", { "javascriptreact" })
    require('luasnip').filetype_extend("typescript", { "typescriptreact" })
    require('luasnip').filetype_extend("javascriptreact", { "html" })
    require('luasnip').filetype_extend("typescriptreact", { "html" })
  require("nvim-autopairs").setup()
  require('nvim-ts-autotag').setup()
end

return module
