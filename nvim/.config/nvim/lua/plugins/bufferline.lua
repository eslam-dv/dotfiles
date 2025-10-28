return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-mini/mini.icons" },
	version = "*",
	opts = {
		options = {
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
		},
	},
}
