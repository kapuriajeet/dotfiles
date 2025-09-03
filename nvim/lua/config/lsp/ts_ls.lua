return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_markers = {
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayVariableTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayVariableTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
}
