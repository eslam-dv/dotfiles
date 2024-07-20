return {
	"akinsho/bufferline.nvim",
	version = "*",
	config = function()
		require("bufferline").setup({
			options = {
				separator_style = "thin",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
			highlights = require("nord.plugins.bufferline").akinsho(),
		})
	end,
}
