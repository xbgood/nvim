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

-- 设置背景色
vim.g.background_transparency = true

-- 设置颜色主题
vim.cmd.colorscheme "rose-pine"
-- vim.cmd.colorscheme "catppuccin-mocha"

vim.cmd([[
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

    " 设置asyncrun
    let g:asyncrun_open = 6

    " 设置鼠标拷贝
    set mouse-=a

    " 设置背景透明
    highlight Normal guibg=None ctermbg=None

    " LuaSnip 使用代码片段补全的时候的快捷键，tab下一个，shift+tab返回上一个
    " press <Tab> to expand or jump in a snippet. These can also be mapped separately
    " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
    " -1 for jumping backwards.
    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
]])
