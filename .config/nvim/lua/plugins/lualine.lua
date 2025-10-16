return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-mini/mini.icons" },
	config = function()
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " " },
			colored = false,
			update_in_insert = false,
			always_visible = true,
		}

		local location = {
			"location",
			padding = 0,
		}

		local spaces = function()
			return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { diagnostics },
				lualine_c = { "branch", "diff", "filename" },
				lualine_x = { spaces, "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { location },
			},
		})
	end,
}
