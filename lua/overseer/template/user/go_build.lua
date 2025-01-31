return {
    name = "run go",

    builder = function()
        local file = vim.fn.expand("%:p")
        local outfile = vim.fn.expand("%:p:r")
        local cmd = { "go", "run", file }

        return {
            cmd = cmd,
            components = {
                { "open_output", direction = "float" },
                -- 运行结束删除可执行文件，针对go文件
                { "run_after",   task_names = { { cmd = { "rm", outfile } } } },
                "on_result_diagnostics",
                "default",
            },
        }
    end,
    condition = { filetype = { "go" } },
}
