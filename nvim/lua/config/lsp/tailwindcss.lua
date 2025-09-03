return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"html",
		"css",
		"scss",
		"javascriptreact",
		"typescriptreact",
		"vue",
	},
	root_markers = { "tailwind.config.js", "tailwind.config.ts", "postcss.config.js", ".git" },
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "tw`([^`]*)", "([^`]*)`" },
					{ 'tw\\("([^"]*)', '([^"]*)"\\)' },
				},
			},
		},
	},
}
