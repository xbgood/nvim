return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gotmpl" },
    root_dir = function()
        return vim.fn.getcwd()
    end
}
