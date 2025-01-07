-- 自动切换输入法（Fcitx 框架）
vim.g.FcitxToggleInput = function()
    local input_status = tonumber(vim.fn.system("fcitx5-remote"))
    if input_status == 2 then
        vim.fn.system("fcitx5-remote -c")
    end
end
vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")

-- 指定 undotree 缓存放路径
vim.g.undotree_dir = "~/.cache/nvim/undodir"

-- 自定义代码片段存储路径
-- vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet/"

-- 开启代码折叠, zc/zo keys
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不折叠
vim.wo.foldlevel = 99

-- 设置颜色主题
vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("catppuccin-mocha")

-- 设置背景色透明
vim.g.background_transparency = true

vim.cmd([[
    " 设置鼠标拷贝
    " set mouse-=a

    " 设置背景透明
    " highlight Normal guibg=none ctermbg=none ctermfg=none

    " nvim-lightbulb
    autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

    " undotree
    if has("persistent_undo")
    " 在 config.lua 中定义好了 undotree_dir 全局变量
    let target_path = expand(undotree_dir)
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif
    let &undodir = target_path
    set undofile

    " ---------------- vim-flaoterm --------------
    let g:floaterm_wintype       = 'float'           " 浮动窗口类型。
    let g:floaterm_position      = 'bottomright'     " 在窗口中间显示。
    let g:floaterm_width         = 0.5               " 终端宽(0,1)
    let g:floaterm_height        = 0.6               " 终端高(0,1)
    let g:floaterm_title         = 'floaterm: $1/$2' " 终端标题
    let g:floaterm_autoclose = 2

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

    " LuaSnip 使用代码片段补全的时候的快捷键，tab下一个，shift+tab返回上一个
    " press <Tab> to expand or jump in a snippet. These can also be mapped separately
    " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
    " imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
    " -1 for jumping backwards.
    " inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
]])
