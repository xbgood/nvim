return {
    filetypes = { "rust" },
    cmd = { "rust-analyzer" },
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                loadOutDirsFromCheck = true,
            },
            checkonSave = {
                command = "clippy",
            },
            experimental = {
                procAttrMacros =true,
            },
        },
    },
    root_dir = function()
        return vim.fn.getcwd()
    end,
}
