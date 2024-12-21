return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local nls = require("null-ls")
		local formatting = nls.builtins.formatting

		nls.setup({
			sources = {
				formatting.prettierd.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
				formatting.stylua,
				formatting.gofumpt,
				formatting.goimports,
        formatting.black,
				require("none-ls.diagnostics.eslint_d").with({
					filetypes = { "javascript", "typescript", "html", "css", "javascriptreact", "typescriptreact" },
					-- Only load eslint when there is a configuration file
					condition = function()
						return require("null-ls.utils").root_pattern("eslint.config.js")(vim.api.nvim_buf_get_name(0)) ~= nil
					end,
				}),
			},
		})

		vim.keymap.set(
			"n",
			"<F3>",
			":lua vim.lsp.buf.format({ timeout_ms = 10000, async = true })<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
