-- install:
-- npm i -g vscode-langservers-extracted
return {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    init_options = {
        provideFormatter = true,
    },
    root_dir = function()
        return vim.fn.getcwd()
    end
}
