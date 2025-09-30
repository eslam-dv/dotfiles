return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
			},
			auto_install = true,
			highlight = { enable = true },
		})
	end,
}
