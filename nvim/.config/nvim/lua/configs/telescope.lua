local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		layout_strategy = "flex",
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
			},
		},
	},
})

telescope.load_extension("ui-select")
