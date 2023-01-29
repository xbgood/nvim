-- 自动切换输入法（Fcitx 框架）
vim.g.FcitxToggleInput = function()
	local input_status = tonumber(vim.fn.system("fcitx-remote"))
	if input_status == 2 then
		vim.fn.system("fcitx-remote -c")
	end
end

-- vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")

-- 指定 undotree 缓存存放路径
vim.g.undotree_dir = "~/.cache/nvim/undodir"

-- 指定代码片段存储路径，这个目录我们在第二章节的时候已经创建好了
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet/"

-- markdown preview
vim.cmd([[
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
" let g:mkdp_theme = 'dark'
let g:mkdp_theme = 'light'
let g:mdip_imgdir = '.img'
let g:asyncrun_open = 6
set mouse-=a
]])

-- 设置背景色
vim.g.background_transparency = true

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

-- 设置tab的默认大小
vim.cmd([[
set shiftwidth=4
set tabstop=4
set softtabstop=4
]])

-- 开启代码折叠, zc/zo keys
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不折叠
vim.wo.foldlevel = 99

-- 设置颜色主题
vim.cmd.colorscheme "rose-pine"
-- vim.cmd.colorscheme "github_dark_default"
-- vim.cmd.colorscheme "catppuccin-mocha"
-- vim.cmd.colorscheme "dracula"


