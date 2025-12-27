local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
})

mason_lspconfig.setup({
	automatic_enable = true,
	ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "emmet_ls" },
})

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	virtual_text = false,
	update_in_insert = false,
	severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local keymap = vim.keymap.set
		local lsp = vim.lsp
		local bufopts = { noremap = true, silent = true, buffer = args.buf }

		-- LSP Keybinds
		keymap("n", "K", lsp.buf.hover, bufopts)
		keymap("n", "gr", lsp.buf.references, bufopts)
		keymap("n", "gd", lsp.buf.definition, bufopts)
		keymap("n", "gD", lsp.buf.declaration, bufopts)
		keymap("n", "gi", lsp.buf.implementation, bufopts)
		keymap("n", "go", lsp.buf.type_definition, bufopts)
		keymap("n", "gs", lsp.buf.signature_help, bufopts)
		keymap("n", "<leader>lr", lsp.buf.rename, bufopts)
		keymap("n", "<leader>la", lsp.buf.code_action, bufopts)
		-- keymap("n", "<leader>lf", function()
		-- 	vim.lsp.buf.format({ async = true })
		-- end, bufopts)

		-- Fallback to TreeSitter If LSP doesn't provide folding
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- Safety check
		if not client then
			vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
			return
		end

		-- Fallback if LSP doesn't support folding
		if not client.server_capabilities.foldingRangeProvider then
			vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
		end
	end,
})
