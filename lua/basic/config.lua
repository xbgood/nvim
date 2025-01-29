-- 自动切换输入法（Fcitx 框架）
vim.g.FcitxToggleInput = function()
	local input_status = tonumber(vim.fn.system("fcitx5-remote"))
	if input_status == 2 then vim.fn.system("fcitx5-remote -c") end
end
vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")

-- 指定 undotree 缓存放路径
vim.g.undotree_dir = "~/.cache/nvim/undodir"

-- 开启代码折叠, zc/zo keys
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不折叠
vim.wo.foldlevel = 99

-- 关闭nvim右边的 diagnostic 错误提示
vim.diagnostic.config {
    --  关闭diagnostic 设置
    -- virtual_text = false,
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

-- 设置颜色主题
-- vim.cmd.colorscheme("rose-pine")
vim.cmd.colorscheme("catppuccin-mocha")

vim.cmd([[
    " 设置鼠标拷贝
    set mouse-=a

    " 设置背景透明
    " highlight Normal guibg=none ctermbg=none ctermfg=none

    " undotree
    if has("persistent_undo")
    " 在 config.lua 中定义好了 undotree_dir 全局变量
    let target_path = expand(undotree_dir)
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif
    let &undodir = target_path
    set undofile

    " asyncrun and asynctasks
    " 自动打开 quickfix window ，高度为 8
    let g:asyncrun_open = 8
    " 任务结束时候响铃提醒
    let g:asyncrun_bell = 1
    " 项目根目录
    let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
    " 打开运行界面 vim bottom tab floaterm
    let g:asynctasks_term_pos='floaterm'
    let g:asyncrun_term_reuse=1
    let g:asynctasks_extra_config = ["~/.config/nvim/lua/scripts/asynctasks.ini"]
]])
