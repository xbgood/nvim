return {
    filetypes = { "c", "cpp", "objc", "objcpp" },
    log_level = 2,
    root_dir = function()
        return vim.fn.getcwd()
    end,
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"} ;
        };
    }
}

