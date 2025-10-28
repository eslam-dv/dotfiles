return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-mini/mini.icons" },
	config = function()
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				prompt_prefix = "  ",
				selection_caret = " ",
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
				},
			},
		})

		map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
		map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
		map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
		map("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
	end,
}
