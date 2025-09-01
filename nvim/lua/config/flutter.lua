local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
  return
end

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
    exception_breakpoints = {},
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
      -- Use your normal on_attach for LSP
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end,
  },
}
