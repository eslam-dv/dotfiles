return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = { "*" },
		css = true,
		css_fn = true,
		tailwind = true,
		mode = "background",
		virtualtext = "■",
		virtualtext_inline = false,
		virtualtext_mode = "foreground",
		always_update = false,
	},
}
