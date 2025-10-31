vim.pack.add({
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/nvimtools/none-ls-extras.nvim",
})

local none_ls = require("null-ls")
local formatter = none_ls.builtins.formatting

none_ls.setup({
	sources = {
		formatter.prettierd,
		formatter.stylua,
		require("none-ls.diagnostics.eslint_d"),
	},
})
