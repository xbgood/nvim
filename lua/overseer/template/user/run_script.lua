return {
    name = "run script",

    builder = function()
        local file = vim.fn.expand("%:p")
        local cmd = { file }

        if vim.bo.filetype == "python" then
            cmd = { "python3", file }
        end
        if vim.bo.filetype == "sh" then
            cmd = { "sh", file }
        end

        return {
            cmd = cmd,
            components = {
                { "open_output", direction = "float" },
                "on_result_diagnostics",
                "default",
            },
        }
    end,
    condition = { filetype = { "sh", "python", }, },
}
