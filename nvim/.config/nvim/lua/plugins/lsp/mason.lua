vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	automatic_enable = true,
	ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "emmet_ls" },
})

require("mason-tool-installer").setup({
	ensure_installed = { "prettierd", "stylua", "eslint_d" },
})
