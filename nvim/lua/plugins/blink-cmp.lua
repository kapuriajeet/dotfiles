return {
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
}
