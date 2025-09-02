local servers = {
  "lua_ls",
  "pyright",
  "ts_ls",
  "html",
  "cssls",
  "tailwindcss",
  "emmet_ls",
}

-- Load configs for each server and register with Neovim
for _, server in ipairs(servers) do
  local ok, config = pcall(require, "config.lsp." .. server)
  if ok then
    vim.lsp.config[server] = config
  else
    vim.notify("Missing LSP config for: " .. server, vim.log.levels.WARN)
  end
end

-- Enable all servers
vim.lsp.enable(servers)

-- Common LSP behaviors when attaching
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local buf = ev.buf

    -- Enable blink completion
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
    end

    -- Keymaps
    local opts = { buffer = buf, silent = true }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
