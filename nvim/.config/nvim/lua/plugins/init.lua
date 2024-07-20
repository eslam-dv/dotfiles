return {
	{ "nvim-tree/nvim-web-devicons" },
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = true,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({})
			vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", { silent = true, noremap = true })
		end,
	},
}
