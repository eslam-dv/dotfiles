return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		local function has_eslint_config(utils)
			return utils.root_has_file({
				".eslintrc",
				".eslintrc.cjs",
				".eslintrc.js",
				".eslintrc.json",
				"eslint.config.cjs",
				"eslint.config.js",
				"eslint.config.mjs",
			})
		end

		null_ls.setup({
			debug = false,
			sources = {
				formatting.stylua,
				formatting.prettierd.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
				require("none-ls.diagnostics.eslint_d").with({ condition = has_eslint_config }),
				require("none-ls.code_actions.eslint_d").with({ condition = has_eslint_config }),
			},
		})
	end,
}
