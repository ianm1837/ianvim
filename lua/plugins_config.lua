local module = {}

module.vscode_theme_config = function()
  local c = require("vscode.colors").get_colors()
  return {
    style = "dark",
    transparent = false,
    italic_comments = true,
    underline_links = true,
    group_overrides = {
      Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
    },
  }
end

module.dashboard_config = {
  theme = "hyper",
  config = {
    week_header = {
      enable = true,
    },
    project = {
      enable = true,
      limit = 8,
      action = function(path)
        vim.cmd("bd")
        vim.cmd("cd " .. path)
        vim.cmd("Neotree right")
      end,
    },
    shortcut = {
      { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Files",
        group = "Label",
        action = "Telescope find_files",
        key = "f",
      },
    },
  },
}

module.lualine_config = {
  options = {
    icons_enabled = true,
    theme = "vscode",
    disabled_filetypes = { "neo-tree" },
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
}

module.mini_indentscope_config = {
  symbol = "│",
  options = {
    try_as_border = true,
    border = "both",
  },
}

module.window_picker_setup = {
  filter_rules = {
    include_current_win = false,
    autoselect_one = true,
    bo = {
      filetype = { "neo-tree", "neo-tree-popup", "notify" },
      buftype = { "terminal", "quickfix" },
    },
  },
}

module.neotree_config = {
  popup_border_style = "rounded",
  window = {
    position = "right",
    width = 40,
    mappings = {
      ['<ESC>'] = "close_window",
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_hidden = false, -- only works on Windows for hidden files/directories
      hide_by_name = {
        --"node_modules"
      },
      hide_by_pattern = { -- uses glob style patterns
        --"*.meta",
        --"*/src/*/tsconfig.json",
      },
      always_show = { -- remains visible even if other settings would normally hide it
        --".gitignored",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        --".DS_Store",
        --"thumbs.db"
      },
      never_show_by_pattern = { -- uses glob style patterns
        --".null-ls_*",
      },
    },
  },
  event_handlers = {
    {
      event = "file_opened",
      handler = function()
        --auto close after file open
        require("neo-tree.command").execute({ action = "close" })
      end,
    },
    {
      event = "neo_tree_window_after_open",
      handler = function()
        --auto focus after tree open
        require("neo-tree.command").execute({ action = "focus" })
      end,
    },
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        -- vim.keymap.set('n', '<ESC>', function() vim.cmd('Neotree close') end, { noremap = true, silent = true})
      end,
    },
    {
      event = "neo_tree_buffer_leave",
      handler = function()
        -- vim.keymap.set('n', '<ESC>', '<ESC>', { noremap = true, silent = true})
      end,
    },
  },
}

module.neoclip_config = {
  enable_persistent_history = true,
  continuous_sync = true,
}

module.telescope_setup = {
  extensions = {
    -- ["ui-select"] = {
    -- 	require("telescope.themes").get_dropdown({}),
    -- },
  },
}

module.treesitter_config = {
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}

module.bufferline_config = {
  options = {
    separator_style = "thick",
    diagnostics = "nvim_lsp",
  },
}

---------------------
-- lspconfig setup --
---------------------

module.lspconfig_lua_config = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    Lua = {
      diagnostics = { disable = { "missing-fields" } },
    },
  },
}

module.lspconfig_tsserver_config = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

module.lspconfig_nil_ls_config = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

module.lspconfig_cssls_config = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

module.lspconfig_rust_analyzer_config = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

module.lspconfig_gopls_config = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

module.lspconfig_emmet_ls_config = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

module.lspconfig_tailwindcss_config = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

module.lspconfig_jsonls_config = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

module.lspsaga_config = {
  lightbulb = {
    enable = false,
    sign = false,
    debounce = 10,
    sign_priority = 40,
    virtual_text = true,
    enable_in_insert = true,
  },
  symbol_in_winbar = {
    enable = false
  }
}

local cmp = require("cmp")
module.cmp_config = {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = require("cmp.config.window").bordered(),
    documentation = require("cmp.config.window").bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<c-b>"] = cmp.mapping.scroll_docs(-4),
    ["<c-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = 'nvim_lsp_signature_help' }
  }, {
    { name = "buffer" },
  }),
}

return module
