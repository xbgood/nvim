
-- install: 
-- npm install -g awk-language-server
return {
    filetypes = { "awk" },
    cmd = { "awk-language-server" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    init_options = {
        hostInfo = "neovim"
    },
}
