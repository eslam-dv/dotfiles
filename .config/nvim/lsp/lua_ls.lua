return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_makers = { ".luarc.json", ".luarc.jsonc", ".stylua.toml", "stylua.toml", ".git" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}
