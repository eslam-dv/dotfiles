return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufEnter", "BufReadPre" },
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "markdown", "python", "go", "javascript", "typescript" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
