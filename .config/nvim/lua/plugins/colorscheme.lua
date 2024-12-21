return {
	"sainnhe/sonokai",
	priority = 1000,
	config = function()
		vim.g.sonokai_enable_italic = true
    vim.g.sonokai_style = 'andromeda'
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_transparent_background = 0
    vim.g.sonokai_show_eob = 0
		vim.cmd.colorscheme("sonokai")
	end,
}
