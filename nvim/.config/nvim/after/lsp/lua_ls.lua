return {
    settings = {
        Lua = {
            runtime = {
                version = "Lua 5.4",
            },
            completion = {
                enable = true,
            },
            diagnostics = {
                enable = true,
                globals = { "vim" },
            },
            workspace = {
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
            },
        },
    },
}
