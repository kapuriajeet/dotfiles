return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },

				-- Web / MERN stack
				javascript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				scss = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				yaml = { "prettierd", "prettier" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})

		-- Manual keymap for formatting
		vim.keymap.set("n", "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file with conform" })
	end,
}
