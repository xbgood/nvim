return {
    filetypes = { "c", "cpp", "h", "hpp", "cc", "cuda" },
    cmd = { "clangd" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    capabilities = {"utf-8"},
}
