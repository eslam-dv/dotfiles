vim.lsp.config("*", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("html")
vim.lsp.enable("cssls")

-- Remove Global Default Key mapping
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")

-- Create keymapping
-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local map = vim.keymap.set
		local lsp = vim.lsp
		local bufopts = { noremap = true, silent = true, buffer = args.buf }

		map("n", "K", lsp.buf.hover, bufopts)
		map("n", "gr", lsp.buf.references, bufopts)
		map("n", "gd", lsp.buf.definition, bufopts)
		map("n", "gD", lsp.buf.declaration, bufopts)
		map("n", "gi", lsp.buf.implementation, bufopts)
		map("n", "go", lsp.buf.type_definition, bufopts)
		map("n", "gs", lsp.buf.signature_help, bufopts)
		map("n", "<leader>lr", lsp.buf.rename, bufopts)
		map("n", "<leader>la", lsp.buf.code_action, bufopts)
		-- map("n", "<leader>lf", function()
		--   vim.lsp.buf.format({ async = true })
		-- end, bufopts)
	end,
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
