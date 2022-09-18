-- https://github.com/liuchengxu/vista.vim

vim.cmd( [[
" 缩进显示方式
let g:vista_icon_indent = ["▸ ", ""]
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" 通过那种方式渲染大纲预览（ctags 或者 nvim_lsp）
let g:vista_default_executive = 'ctags'
" let g:vista_default_executive = 'nvim_lsp'

" 启用fzf的预览窗口
" let g:vista_fzf_preview = ['right:50%']

" 选中后光标闪动2下
let g:vista_blink = [3, 100]

" 打开时移至vista窗口
let g:vista_stay_on_open = 1

" 当跳到目标函数后关闭vista窗口 0关闭 1打开
let g:vista_close_on_jump = 1

" 在底部显示详细信息的时间延迟
let g:vistas_cursor_delay = 20

" vista栏宽度
let g:vista_sidebar_width = 30

" 将选中的内容在底部栏回显
let g:vista_echo_cursor = 1


" 启用图标支持"
let g:vista#renderer#enable_icon = 1

let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

]])

-- 打开大纲预览
vim.keybinds.gmap("n", "<leader>2", "<cmd>Vista!!<CR>", vim.keybinds.opts)
