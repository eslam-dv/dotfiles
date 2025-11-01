vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua" })

require("colorizer").setup({
	filetypes = { "*" },
	lazy_load = false,
	user_default_options = {
		css = true,
		css_fn = true,
		tailwind = true,
	},
})
