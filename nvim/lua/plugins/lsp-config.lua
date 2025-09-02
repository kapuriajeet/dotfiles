return {
  -- Mason for managing LSP servers
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason bridge for ensuring servers are installed
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "emmet_ls",
      },
      auto_install = true,
    },
  },

  -- Blink completion
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    opts = {
      fuzzy = {
        implementation = "prefer_rust",
      },
      keymap = {
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-e>"] = { "cancel", "fallback" },
      },
      completion = {
        menu = { border = "rounded" },
      },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
    },
  },
}
