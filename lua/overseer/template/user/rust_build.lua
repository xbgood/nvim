return {
    name = "rust build and run",

    builder = function()
        local file = vim.fn.expand("%:p")
        local outfile = vim.fn.expand("%:p:r")

        return {
            cmd = { "rustc", file, "&&", outfile },
            components = {
                { "open_output", direction = "float" },
                -- 运行结束删除可执行文件
                { "run_after",   task_names = { { cmd = { "rm", outfile } } } },
                "on_result_diagnostics",
                "default"
            },
        }
    end,
    condition = { filetype = { "rust" } },
}
