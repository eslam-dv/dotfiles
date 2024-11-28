return {
	"nvimdev/indentmini.nvim",
	config = function()
		require("indentmini").setup({
			char = "│",
			exclude = { "markdown" },
			minlevel = 1,
			only_current = false,
		})
		vim.cmd.highlight("IndentLine guifg=#4c4f69")
		vim.cmd.highlight("IndentLineCurrent guifg=#dce0e8")
	end,
}
