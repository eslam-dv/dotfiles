return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics
		-- local completion = null_ls.builtins.completion

		null_ls.setup({
			debug = false,
			sources = {
				formatting.black.with({ extra_args = { "--fast" } }),
				formatting.stylua,
				formatting.biome.with({
					filetypes = {
						"javascript",
						"javascriptreact",
						"json",
						"jsonc",
						"typescript",
						"typescriptreact",
						"css",
						"html",
					},
					args = {
						"check",
						"--write",
						"--unsafe",
						"--formatter-enabled=true",
						"--organize-imports-enabled=true",
						"--skip-errors",
						"--stdin-file-path=$FILENAME",
					},
				}),
			},
		})
	end,
}
