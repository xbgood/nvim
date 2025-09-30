-- fcitx5 自动切换输入法
vim.g.FcitxToggleInput = function()
    local input_status = tonumber(vim.fn.system("fcitx5-remote"))
    if input_status == 2 then vim.fn.system("fcitx5-remote -c") end
end
vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")


-- undotree 缓存放路径
local function setup_undotree()
    local undo_dir = vim.fn.expand("~/.cache/nvim/undodir")
    if vim.fn.isdirectory(undo_dir) == 0 then
        local success = vim.fn.mkdir(undo_dir, 'p', '0700')
        if success == 0 then
            vim.notify("Failed to create undotree directory: " .. undo_dir, vim.log.levels.ERROR)
            return
        else
            vim.notify("Create undotree directory: " .. undo_dir)
        end
    end
    vim.opt.undofile = true
    vim.opt.undodir = undo_dir
end
setup_undotree()


-- 关闭nvim右边的 diagnostic 错误提示
vim.diagnostic.config {
    --  关闭diagnostic 设置
    -- virtual_text = false,

    -- 设置diagnostic 前缀
    virtual_text = { prefix = "●" },

    severity_sort = true,
    update_in_insert = false,

    -- 设置符号栏符号
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
}


-- markdown 预览设置
vim.g.mkdp_filetypes = { "markdown" }
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_browser = 'firefox'
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_theme = 'light'
vim.g.mkdp_markdown_css = "/home/wallen/.config/nvim/lua/scripts/markdown.css"


-- colorscheme 颜色主题
-- vim.cmd.colorscheme("everforest")
vim.cmd.colorscheme("nightfox")
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("tokyonight")

