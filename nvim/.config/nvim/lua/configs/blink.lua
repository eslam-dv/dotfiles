local ok, blink_cmp = pcall(require, "blink.cmp")
if not ok then
	return
end

blink_cmp.setup({
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		list = { selection = { preselect = false, auto_insert = false } },
		menu = {
			draw = {
				treesitter = { "lsp" },
			},
		},
	},
	snippets = { preset = "default" },
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	signature = { enabled = false },
	fuzzy = { implementation = "lua" },
	keymap = {
		preset = "none",

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },

		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },

		["<C-n>"] = { "snippet_forward", "fallback" },
		["<C-p>"] = { "snippet_backward", "fallback" },

		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		["<C-h>"] = { "show_signature", "hide_signature", "fallback" },

		["<Cr>"] = { "accept", "fallback" },
	},
})
