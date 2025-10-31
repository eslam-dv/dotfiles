vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
	"https://github.com/rafamadriz/friendly-snippets", -- Snippets
})

local blink = require("blink.cmp")
blink.setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
	keymap = {
		preset = "enter",
		["<C-space>"] = {},
    ["<Tab>"] = {},
		["<S-Tab>"] = {},
		["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_down", "fallback" },
		["<C-f>"] = { "scroll_documentation_up", "fallback" },
		["<C-n>"] = { "snippet_forward", "fallback" },
		["<C-p>"] = { "snippet_backward", "fallback" },
		-- ["<C-e>"] = { "hide" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
	},

	cmdline = {
		keymap = {
			preset = "inherit",
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
	},

	sources = { default = { "lsp", "buffer", "path", "snippets" } },
})

-- Setup LSP capabilities
vim.lsp.config("*", {
	capabilities = blink.get_lsp_capabilities(),
})
