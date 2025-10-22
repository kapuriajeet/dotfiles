-- List of servers to enable
local servers = {
	"lua_ls",
	"pyright",
	"ts_ls",
	"html",
	"cssls",
	"tailwindcss",
	"emmet_ls",
}

-- Load custom configs if they exist, otherwise use defaults
for _, server in ipairs(servers) do
	local ok, config = pcall(require, "config.lsp." .. server)
	if ok then
		vim.lsp.config[server] = config
	else
		vim.notify("No custom config for " .. server .. ", using defaults.", vim.log.levels.INFO)
	end
end

-- Enable all servers
vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local buf = ev.buf

		-- Ensure client exists
		if not client then
			vim.notify("LSP client not found for buffer " .. buf, vim.log.levels.WARN)
			return
		end

		-- Enable Blink completion autotrigger if supported
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
-- Diagnostic configuration
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		active = true, -- Enable or disable signs
		text = {
			[vim.diagnostic.severity.ERROR] = " ", -- Error sign
			[vim.diagnostic.severity.WARN] = " ", -- Warning sign
			[vim.diagnostic.severity.HINT] = " ", -- Hint sign
			[vim.diagnostic.severity.INFO] = " ", -- Info sign
		},
		-- Optional: highlight the line number column
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Optional: Customize diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
