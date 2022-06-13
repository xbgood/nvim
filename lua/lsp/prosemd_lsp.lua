return {
    cmd = { "prosemd-lsp", "--stdio" },
    filetypes = { "markdown" },
    root_dir = function()
        return vim.fn.getcwd()
    end
}
