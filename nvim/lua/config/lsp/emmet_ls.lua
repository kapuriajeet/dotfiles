return {
	cmd = { "emmet-ls", "--stdio" },
	filetypes = {
		"html",
		"css",
		"javascriptreact",
		"typescriptreact",
		"vue",
	},
	root_markers = { ".git" },
	settings = {
		emmet = {
			showExpandedAbbreviation = "always",
			showSuggestionsAsSnippets = true,
		},
	},
}
