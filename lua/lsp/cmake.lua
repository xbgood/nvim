return {
    cmd = { "cmake-language-server" },
    filetypes = { "cmake" },
    init_options = {
        buildDirectory = "build",
        hostInfo = "neovim",
    },
    root_dir = function()
        return vim.fn.getcwd()
    end,
}
