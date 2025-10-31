vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })

require("tokyonight").setup({
	transparent = true,
	-- Background styles. Can be "dark", "transparent" or "normal"
	sidebars = "dark",
	floats = "dark",
})

vim.cmd.colorscheme("tokyonight-night")
