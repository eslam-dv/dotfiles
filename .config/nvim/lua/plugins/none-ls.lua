return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local nls = require("null-ls")
		local formatting = nls.builtins.formatting
		-- local diagnostics = nls.builtins.diagnostics

		nls.setup({
			sources = {
				formatting.prettierd.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
				formatting.stylua,
				formatting.gofumpt,
				formatting.goimports,
				require("none-ls.diagnostics.eslint_d"),
			},
		})

		vim.keymap.set("n", "<F3>", ":lua vim.lsp.buf.format({ timeout_ms = 10000, async = true })<CR>", { noremap = true, silent = true })
	end,
}
