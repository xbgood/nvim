return {
    filetypes = { "rust" },
    cmd = { "rust-analyzer" },
    settings = {
        ["rust-analyzer"] = {}
    },
    root_dir = function()
        return vim.fn.getcwd()
    end,
}
