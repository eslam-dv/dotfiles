return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {},
	config = function()
		vim.keymap.set(
			"n",
			"<leader>e",
			":Neotree toggle filesystem reveal right<CR>",
			{ silent = true, noremap = true }
		)
	end,
}
