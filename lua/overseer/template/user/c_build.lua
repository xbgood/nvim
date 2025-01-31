return {
    name = "gcc build and run",

    builder = function()
        local file = vim.fn.expand("%:p")
        local outfile = vim.fn.expand("%:p:r") .. ".out"

        return {
            cmd = { outfile },
            components = {
                {
                    "dependencies", task_names = {{
                        cmd = { "gcc", "-Wall", file, "-o", outfile },
                    }}
                },
                { "open_output", direction = "float" },
                -- 运行结束删除可执行文件
                { "run_after",   task_names = { { cmd = { "rm", outfile } } } },
                "on_result_diagnostics",
                "default"
            },
        }
    end,
    condition = { filetype = { "c" } },
}
