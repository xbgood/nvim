return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    -- 禁用 Pyright 的诊断信息（使用 pylint）
    handlers = {
        ---@diagnostic disable-next-line: unused-vararg
        ["textDocument/publishDiagnostics"] = function(...)
        end
    },
    filetypes = { "python" },
    cmd = { "pyright-langserver", "--stdio" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off"
            }
        }
    }
}
