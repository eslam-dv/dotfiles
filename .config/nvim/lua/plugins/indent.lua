return {
	"echasnovski/mini.indentscope",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local indent = require("mini.indentscope")
		indent.setup({
			draw = { delay = 0, animation = indent.gen_animation.none() },
			symbol = "│",
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"Trouble",
				"alpha",
				"dashboard",
				"fzf",
				"help",
				"lazy",
				"mason",
				"neo-tree",
				"notify",
				"toggleterm",
				"trouble",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
