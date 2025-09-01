return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",        -- optional, better UI for prompts
      "mfussenegger/nvim-dap",         -- debugging
      "rcarriga/nvim-dap-ui",          -- dap UI
      "nvim-telescope/telescope.nvim", -- optional telescope integration
    },
    config = function()
      -- ========================
      -- Flutter Tools Setup
      -- ========================
      local flutter_tools = require("flutter-tools")
      flutter_tools.setup {
        ui = {
          border = "rounded",
          notification_style = "plugin",
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
        },
        outline = {
          open_cmd = "30vnew",
        },
        lsp = {
          color = {
            enabled = true,
            background = true,
            foreground = true,
            virtual_text = true,
            virtual_text_str = "■",
          },
          settings = {
            showTodos = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
          on_attach = function(client, bufnr)
            -- Common LSP keymaps
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          end,
        },
      }

      -- ========================
      -- nvim-dap & dap-ui Setup
      -- ========================

      -- ========================
      -- Telescope Integration
      -- ========================
      local telescope_ok, telescope = pcall(require, "telescope")
      if telescope_ok then
        telescope.load_extension("flutter")
      end

      -- ========================
      -- Keymaps
      -- ========================
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "<leader>fr", ":FlutterRun<CR>", opts)           -- Run app
      map("n", "<leader>fq", ":FlutterQuit<CR>", opts)          -- Quit app
      map("n", "<leader>fd", ":FlutterDevices<CR>", opts)       -- Select device
      map("n", "<leader>fo", ":FlutterOutlineToggle<CR>", opts) -- Toggle outline
      map("n", "<leader>fl", ":FlutterLogToggle<CR>", opts)     -- Toggle log

      -- Debugging
      map("n", "<leader>dd", ":DapContinue<CR>", opts)         -- Start debug / continue
      map("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts) -- Toggle breakpoint
      map("n", "<leader>dr", ":DapRestart<CR>", opts)          -- Restart debug session
    end,
  },
}
