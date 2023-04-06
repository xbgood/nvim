-- 自动切换输入法（Fcitx 框架）
vim.g.FcitxToggleInput = function()
    local input_status = tonumber(vim.fn.system("fcitx5-remote"))
    if input_status == 2 then
        vim.fn.system("fcitx5-remote -c")
    end
end

vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")

-- nvim-lightbulb
vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
-- 指定 undotree 缓存存放路径
vim.g.undotree_dir = "~/.cache/nvim/undodir"

-- 自定义代码片段存储路径
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet/"

-- undotree
vim.cmd([[
	if has("persistent_undo")
	" 在 config.lua 中定义好了 undotree_dir 全局变量
	let target_path = expand(undotree_dir)
	if !isdirectory(target_path)
	call mkdir(target_path, "p", 0700)
	endif
	let &undodir = target_path
	set undofile
]])

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
    " markdown preview
    let g:mkdp_auto_start = 0
    let g:mkdp_auto_close = 1
    let g:mkdp_theme = 'light' "light/dark"
    let g:mdip_imgdir = '.img' " 这里的设置好像没有效果，要修改插件的源码
    " 设置asyncrun
    let g:asyncrun_open = 6
    " 设置鼠标拷贝
    set mouse-=a
    " 设置背景透明
    highlight Normal guibg=None ctermbg=None
]])
