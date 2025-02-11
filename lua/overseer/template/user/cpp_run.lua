return {
    name = "g++ run",

    builder = function()
        local file = vim.fn.expand("%:p")
        -- local outfile = vim.fn.expand("%:p:r") .. ".out"
        local outfile = "a.out"

        return {
            cmd = { "g++", "-Wall", file, "-o", outfile, "-g", "&&", outfile },
            -- cmd = { outfile },
            components = {
                -- 先后顺序，为改成 && 执行了，更加好些
                -- { "dependencies", task_names = { { cmd = { "g++", "-Wall", file, "-o", outfile }, } } },
                { "open_output", direction = "float" },
                -- 运行结束删除可执行文件
                { "run_after",   task_names = { { cmd = { "rm", outfile } } } },
                "on_result_diagnostics",
                "default"
            },
        }
    end,
    condition = { filetype = { "cpp" } },
}
