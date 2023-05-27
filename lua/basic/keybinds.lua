-- leader 键设置为空格
vim.g.mapleader = ","

-- 默认的键位设置函数太长了，所以这里将它们重新引用一下
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = { noremap = true, silent = true }
}

-- 插入模下 jj 退出插入模式
vim.keybinds.gmap("i", "jj", "<Esc>", vim.keybinds.opts)

-- 用 H 和 L 代替 ^ 与 $
-- vim.keybinds.gmap("n", "H", "^", vim.keybinds.opts)
-- vim.keybinds.gmap("v", "H", "^", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "L", "$", vim.keybinds.opts)
-- vim.keybinds.gmap("v", "L", "$", vim.keybinds.opts)

-- 将 C-u 和 C-d 调整为上下滑动 10 行而不是半页
-- vim.keybinds.gmap("n", "<C-u>", "10k", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "<C-d>", "10j", vim.keybinds.opts)

-- 插入模式下的上下左右移动
vim.keybinds.gmap("i", "<A-k>", "<up>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-j>", "<down>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-h>", "<left>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-l>", "<right>", vim.keybinds.opts)

-- 修改分屏大小
vim.keybinds.gmap("n", "<C-up>", "<cmd>res +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-down>", "<cmd>res -1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-left>", "<cmd>vertical resize-1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-right>", "<cmd>vertical resize+1<CR>", vim.keybinds.opts)

-- 正常模式下按 ESC 取消高亮显示
vim.keybinds.gmap("n", "<ESC>", ":nohlsearch<CR>", vim.keybinds.opts)

-- 通过 leader cs 切换拼写检查
-- vim.keybinds.gmap("n", "<leader>cs", "<cmd>set spell!<CR>", vim.keybinds.opts)

-- AsyncTask 快捷键，编译运行
vim.keybinds.gmap("n", "<leader>cb", ":AsyncTask file-build<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>cr", ":AsyncTask file-run<CR>", vim.keybinds.opts)

-- markdown preview
vim.keybinds.gmap("n", "<leader>pp", ":MarkdownPreview<CR>", vim.keybinds.opts)

-- markdown runcodeblock 运行markdown代码块
vim.keybinds.gmap("n", "<leader>pr", ":call org#main#runCodeBlock()<CR>", vim.keybinds.opts)

-- markdown image-paste 插入图片
vim.keybinds.gmap("n", "<leader>pi", ":call mdip#MarkdownClipboardImage()<CR>", vim.keybinds.opts)

-- 用 astyle 来格式化代码
vim.keybinds.gmap("n", "<leader>cc", "<cmd>%!astyle --style=google --indent=spaces=4<CR>", vim.keybinds.opts)

-- nvim-notify 显示历史弹窗记录
vim.keybinds.gmap("n", "<leader>fn", "<cmd>lua require('telescope').extensions.notify.notify()<CR>", vim.keybinds.opts)

-- bufferline --
-- 关闭当前 buffer，由 bufdelete 插件所提供的方法
vim.keybinds.gmap("n", "<C-q>", "<cmd>Bdelete!<CR>", vim.keybinds.opts)
-- 切换上一个缓冲区
vim.keybinds.gmap("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)
-- 切换下一个缓冲区
vim.keybinds.gmap("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", vim.keybinds.opts)
-- 关闭左侧缓冲区
vim.keybinds.gmap("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", vim.keybinds.opts)
-- 关闭右侧缓冲区
vim.keybinds.gmap("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", vim.keybinds.opts)

-- aerial --
-- 打开大纲预览
vim.keybinds.gmap("n", "<leader>2", "<cmd>SymbolsOutline<CR>", vim.keybinds.opts)

-- telescope --
-- 查找文件
vim.keybinds.gmap("n", "<leader>ff", "<cmd>Telescope find_files theme=ivy<CR>", vim.keybinds.opts)
-- 查找文字
vim.keybinds.gmap("n", "<leader>fw", "<cmd>Telescope live_grep theme=ivy<CR>", vim.keybinds.opts)
-- 查找buffers
vim.keybinds.gmap("n", "<leader>fb", "<cmd>Telescope buffers theme=ivy<CR>", vim.keybinds.opts)
-- 查找帮助文档
vim.keybinds.gmap("n", "<leader>fh", "<cmd>Telescope help_tags theme=ivy<CR>", vim.keybinds.opts)
-- 查找最近打开的文件
vim.keybinds.gmap("n", "<leader>fo", "<cmd>Telescope oldfiles theme=ivy<CR>", vim.keybinds.opts)
-- 查找 marks 标记
vim.keybinds.gmap("n", "<leader>fm", "<cmd>Telescope marks theme=ivy<CR>", vim.keybinds.opts)
-- 查找git commits
vim.keybinds.gmap("n", "<leader>fg", "<cmd>Telescope git_commits theme=ivy<CR>", vim.keybinds.opts)
--当前buffer内查找
vim.keybinds.gmap("n", "<leader>fB", "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<CR>", vim.keybinds.opts)
-- 查找快捷键
vim.keybinds.gmap("n", "<leader>fk", "<cmd>Telescope keymaps theme=ivy<CR>", vim.keybinds.opts)
-- 查找man文档
vim.keybinds.gmap("n", "<leader>fM", "<cmd>Telescope man_pages theme=ivy<CR>", vim.keybinds.opts)

-- 查找 TODO 标签
vim.keybinds.gmap("n", "<leader>ft", "<cmd>TodoTelescope theme=ivy<CR>", vim.keybinds.opts)


-- nvim-hlslens --
vim.keybinds.gmap("n", "n", "<Cmd>execute('normal!'.v:count1.'n')<CR><Cmd>lua require('hlslens').start()<CR>",
    vim.keybinds.opts)
vim.keybinds.gmap("n", "N", "<Cmd>execute('normal!'.v:count1.'N')<CR><Cmd>lua require('hlslens').start()<CR>",
    vim.keybinds.opts)
vim.keybinds.gmap("n", "*", "*<Cmd>lua require('hlslens').start()<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", vim.keybinds.opts)


-- nvim-spectre --
-- 全项目替换
vim.keybinds.gmap("n", "<leader>sp", "<cmd>lua require('spectre').open()<CR>", vim.keybinds.opts)
-- 只替换当前文件
vim.keybinds.gmap("n", "<leader>sf", "viw:lua require('spectre').open_file_search()<CR>", vim.keybinds.opts)
-- 全项目中搜索当前单词
vim.keybinds.gmap("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>sw", "<esc>:lua require('spectre').open_visual()<CR>", vim.keybinds.opts)


-- toggleterm --
-- 退出终端插入模式
vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
-- 打开普通终端
vim.keybinds.gmap("n", "<leader>tt", "<cmd>exe v:count.'ToggleTerm'<CR>", vim.keybinds.opts)
-- 打开浮动终端
vim.keybinds.gmap("n", "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<CR>", vim.keybinds.opts)
-- 打开或关闭所有终端
vim.keybinds.gmap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", vim.keybinds.opts)


-- 查看 undotree
vim.keybinds.gmap("n", "<leader>3", ":UndotreeToggle<CR>", vim.keybinds.opts)


-- nvim-tree --
-- 目录后加上反斜杠 /
-- vim.g.nvim_tree_add_trailing = 1
-- 按 leader 1 打开文件树
vim.keybinds.gmap("n", "<leader>1", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)
-- 按 leader fc 在文件树中找到当前以打开文件的位置
vim.keybinds.gmap("n", "<leader>fc", "<cmd>NvimTreeFindFile<CR>", vim.keybinds.opts)
-- 默认按键
-- o     ：打开目录或文件
-- a     ：新增目录或文件
-- r     ：重命名目录或文件
-- x     ：剪切目录或文件
-- c     ：复制目录或文件
-- d     ：删除目录或文件
-- y     ：复制目录或文件名称
-- Y     ：复制目录或文件相对路径
-- gy    ：复制目录或文件绝对路径
-- p     ：粘贴目录或文件
-- s     ：使用系统默认程序打开目录或文件
-- <Tab> ：预览文件但不移动光标
-- <C-v> ：垂直分屏打开文件
-- <C-x> ：水平分屏打开文件
-- <C-]> ：进入光标下的目录
-- <C-r> ：重命名目录或文件，删除已有目录名称
-- -     ：返回上层目录
-- I     ：切换隐藏文件/目录的可见性
-- H     ：切换点文件的可见性
-- R     ：刷新资源管理器
-- 另外，文件资源管理器操作和操作文档方式一致，可按 / ? 进行搜索


-- vim-multiple-cursors
-- 关闭默认键位绑定
vim.g.multi_cursor_use_default_mapping = 0
-- 应用键位
-- 开始选择单词
vim.g.multi_cursor_start_word_key = "gb"
-- 向后选择
vim.g.multi_cursor_next_key = "<C-n>"
-- 取消当前选择
vim.g.multi_cursor_prev_key = "<C-p>"
-- 跳过选择
vim.g.multi_cursor_skip_key = "<C-x>"
-- 退出选择
vim.g.multi_cursor_quit_key = "<ESC>"
