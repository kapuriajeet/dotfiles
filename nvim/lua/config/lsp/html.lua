return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "htmldjango" },
	root_markers = { ".git" },
	init_options = {
		provideFormatter = true,
	},
	settings = {
		html = {
			format = { wrapLineLength = 120, unformatted = "code,pre,em,strong" },
		},
	},
}
