return {

	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true), -- adds Neovim runtime files for better completions
			},
			completion = {
				callSnippet = "Replace", -- cleaner completion snippets for Blink
			},
			telemetry = { enable = false },
		},
	},
}
