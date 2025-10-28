return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				markdown = { "prettier" },
				json = { "prettier" },
			},
		})

		-- Format keymap
		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({ async = true, lsp_format = "fallback" })
		end, { silent = true, noremap = true })
	end,
}
