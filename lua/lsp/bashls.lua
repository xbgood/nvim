-- install:
-- npm i -g bash-language-server
return {
    filetypes = { "sh" },
    log_level = 2,
    root_dir = function()
        return vim.fn.getcwd()
    end,
    cmd = { "bash-language-server", "start" },
    cmd_env = { GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)" },
    -- root_dir = util.find_git_ancestor,
    init_options = {
        hostInfo = "neovim"
    },
}
