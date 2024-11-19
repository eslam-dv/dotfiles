return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({})

		vim.keymap.set(
			"n",
			"<leader>e",
			":NvimTreeToggle<CR>",
			{ silent = true, noremap = true, desc = "Toggle NvimTree" }
		)
	end,
}
