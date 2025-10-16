return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-mini/mini.icons" },
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			view = {
				side = "right",
				width = 25,
			},
      git = {
        ignore = false
      }
		})

		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
	end,
}
