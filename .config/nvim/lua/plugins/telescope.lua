return {
	"nvim-telescope/telescope.nvim",
	config = function()
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local opts = { silent = true, noremap = true }

		require("telescope").setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, opts)
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
	end,
}
