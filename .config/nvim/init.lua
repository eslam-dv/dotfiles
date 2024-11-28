if vim.g.vscode then
	-- VSCode extension
else
	require("core.options")
	require("core.keymaps")
	require("core.autocmds")
	require("config.lazy")
end
