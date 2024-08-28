return {
	"nvim-lualine/lualine.nvim",
  event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "NvimTree", "Telescope" },
					winbar = {},
				},
				globalstatus = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "filename" },
				lualine_c = { "diagnostics" },
				lualine_x = { "encoding", "fileformat" },
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
		})
	end,
}
