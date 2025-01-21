-- leader 键设置为空格
vim.g.mapleader = ","

-- 插入模下 jj 退出插入模式
vim.keybinds.gmap("i", "jj", "<Esc>", vim.keybinds.opts)

-- 默认的键位设置函数太长了，所以这里将它们重新引用一下
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = { noremap = true, silent = true },
}

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

-- 用 leader cf 格式化代码
vim.keybinds.gmap("n", "<leader>cf", "<cmd>lua require('conform').format()<CR>", vim.keybinds.opts)

------------------------------------ 查看 undotree ---------------------------------
vim.keybinds.gmap("n", "<leader>3", ":UndotreeToggle<CR>", vim.keybinds.opts)

--------------------------------------- aerial -------------------------------------
-- 打开大纲预览
vim.keybinds.gmap("n", "<leader>2", "<cmd>AerialToggle!<CR>", vim.keybinds.opts)

---------------------------- AsyncTask 快捷键，编译运行 ----------------------------
vim.keybinds.gmap("n", "<leader>cb", ":AsyncTask build<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>cr", ":AsyncTask run<CR>", vim.keybinds.opts)

-------------------------------------  markdown  -----------------------------------
-- markdown preview
vim.keybinds.gmap("n", "<leader>pp", ":MarkdownPreview<CR>", vim.keybinds.opts)

-- nvim-notify 显示历史弹窗记录
-- vim.keybinds.gmap("n", "<leader>fn", "<cmd>lua require('telescope').extensions.notify.notify()<CR>", vim.keybinds.opts)

------------------------------------- buffer --------------------------------------
-- 切换上一个缓冲区
vim.keybinds.gmap("n", "<C-h>", "<cmd>BufferPrevious<CR>", vim.keybinds.opts)
-- 切换下一个缓冲区
vim.keybinds.gmap("n", "<C-l>", "<cmd>BufferNext<CR>", vim.keybinds.opts)
-- 关闭当前 buffer，由 bufdelete 插件所提供的方法
vim.keybinds.gmap("n", "<C-q>", "<cmd>BufferDelete<CR>", vim.keybinds.opts)
-- 关闭缓冲区
vim.keybinds.gmap("n", "<leader>bc", "<cmd>BufferClose<CR>", vim.keybinds.opts)
-- 列出所有缓冲区
vim.keybinds.gmap("n", "<leader>bl", "<cmd>buffers<CR>", vim.keybinds.opts)


------------------------------------ fzf-lua ---------------------------------------
-- 查找文件
vim.keybinds.gmap("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", vim.keybinds.opts)
-- 查找文字
vim.keybinds.gmap("n", "<leader>fw", "<cmd>lua require('fzf-lua').live_grep()<CR>", vim.keybinds.opts)
-- 查找帮助文档
vim.keybinds.gmap("n", "<leader>fh", "<cmd>lua require('fzf-lua').tags_grep()<CR>", vim.keybinds.opts)
-- 查找最近打开的文件
vim.keybinds.gmap("n", "<leader>fo", "<cmd>lua require('fzf-lua').oldfiles()<CR>", vim.keybinds.opts)
-- 查找 marks 标记
vim.keybinds.gmap("n", "<leader>fm", "<cmd>lua require('fzf-lua').marks()<CR>", vim.keybinds.opts)
-- 查找git commits
vim.keybinds.gmap("n", "<leader>fg", "<cmd>lua require('fzf-lua').git_commits()<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fs", "<cmd>lua require('fzf-lua').git_status()<CR>", vim.keybinds.opts)
--当前buffer内查找
vim.keybinds.gmap("n", "<leader>fb", "<cmd>lua require('fzf-lua').lgrep_curbuf()<CR>", vim.keybinds.opts)
-- 查找快捷键
vim.keybinds.gmap("n", "<leader>fk", "<cmd>lua require('fzf-lua').keymaps()<CR>", vim.keybinds.opts)
-- 查找theme标签
vim.keybinds.gmap("n", "<leader>ft", "<cmd>lua require('fzf-lua').colorschemes()<CR>", vim.keybinds.opts)
-- 查找man文档
vim.keybinds.gmap("n", "<leader>fM", "<cmd>lua require('fzf-lua').manpages()<CR>", vim.keybinds.opts)
-- 查找buffers
vim.keybinds.gmap("n", "<leader>fB", "<cmd>lua require('fzf-lua').buffers()<CR>", vim.keybinds.opts)

----------------------------------- nvim-hlslens -------------------------------
vim.keybinds.gmap( "n", "n", "<Cmd>execute('normal!'.v:count1.'n')<CR><Cmd>lua require('hlslens').start()<CR>", vim.keybinds.opts)
vim.keybinds.gmap( "n", "N", "<Cmd>execute('normal!'.v:count1.'N')<CR><Cmd>lua require('hlslens').start()<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "*", "*<Cmd>lua require('hlslens').start()<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", vim.keybinds.opts)

------------------------------------- grug-far ---------------------------------
-- 只替换当前文件
vim.keybinds.gmap( "n", "<leader>sf", "<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<CR>", vim.keybinds.opts)
-- 搜索当前单词
vim.keybinds.gmap( "n", "<leader>sw", "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<CR>", vim.keybinds.opts)

------------------------------------ floaterm -----------------------------------
vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
-- 打开普通终端
vim.keybinds.gmap("n", "<leader>tw", "<cmd>FloatermNew<CR>", vim.keybinds.opts)
-- 退出终端插入模式
vim.keybinds.gmap("n", "<leader>tk", "<cmd>FloatermKill<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>tp", "<cmd>FloatermPrev<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>tn", "<cmd>FloatermNext<CR>", vim.keybinds.opts)
-- 打开或关闭所有终端
vim.keybinds.gmap("n", "<leader>tt", "<cmd>FloatermToggle<CR>", vim.keybinds.opts)

--------------------------------- quickfix 快捷键 -------------------------------
vim.keybinds.gmap("n", "<leader>cn", "<cmd>cnext<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>cp", "<cmd>cprevious<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>cw", "<cmd>cwindow<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>cc", "<cmd>cc<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>cx", "<cmd>cclose<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>co", "<cmd>copen<CR>", vim.keybinds.opts)

------------------------------- overseer 任务管理系统 ---------------------------
vim.keybinds.gmap("n", "<Leader>ot", "<cmd>OverseerToggle<cr>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<Leader>or", "<cmd>OverseerRun<cr>", vim.keybinds.opts)
