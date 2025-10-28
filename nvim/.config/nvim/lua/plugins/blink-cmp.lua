return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts_extend = { "surces.default" },
	config = function()
		local blink = require("blink.cmp")
		blink.setup({
			keymap = {
				preset = "enter",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-n>"] = { "snippet_forward", "fallback" },
				["<C-p>"] = { "snippet_backward", "fallback" },
				-- unmap Tab and S-Tab
				["<Tab>"] = false,
				["<S-Tab>"] = false,
			},
			completion = {
				documentation = { auto_show = true },
				list = { selection = { preselect = false, auto_insert = true } },
				menu = { draw = { columns = { { "label" }, { "kind_icon", "kind" } } } },
				trigger = { show_on_keyword = true },
			},
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			appearance = { nerd_font_variant = "normal" }, -- "mono", "normal"
			fuzzy = { implementation = "prefer_rust_with_warning" },
		})

		vim.lsp.config("*", {
			capabilities = blink.get_lsp_capabilities(),
		})
	end,
}
