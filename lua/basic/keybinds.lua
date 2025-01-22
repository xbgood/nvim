-- leader 键设置为空格
vim.g.mapleader = ","

-- 默认的键位设置函数太长了，所以这里将它们重新引用一下
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = { noremap = true, silent = true },
}

-- 插入模下 jj 退出插入模式
-- vim.keybinds.gmap("i", "jj", "<Esc>", vim.keybinds.opts)

-- 将 C-u 和 C-d 调整为10行而不是半页
vim.keybinds.gmap("n", "<C-u>", "10k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-d>", "10j", vim.keybinds.opts)

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


-- 切换拼写检查
vim.keybinds.gmap('n', "<leader>cs", "<cmd>set spell!<cr>", { desc = "Spell Check" })

-------------------------------------- conform -------------------------------------
-- 用 leader cf 格式化代码
vim.keybinds.gmap("n", "<leader>cf", "<cmd>lua require('conform').format()<CR>", { desc = "formatter" })

------------------------------------ 查看 undotree ---------------------------------
vim.keybinds.gmap("n", "<leader>3", ":UndotreeToggle<CR>", { desc = "Undotree" })

-------------------------------------  markdown  -----------------------------------
-- markdown preview
vim.keybinds.gmap("n", "<leader>pp", ":MarkdownPreview<CR>", { desc = "Markdown Perview" })

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
vim.keybinds.gmap("n", "<leader>bc", "<cmd>BufferClose<CR>", { desc = "Buffer Close" })
-- 列出所有缓冲区
vim.keybinds.gmap("n", "<leader>bl", "<cmd>buffers<CR>", { desc = "Buffer List" })

------------------------------------- grug-far ---------------------------------
-- 只替换当前文件
vim.keybinds.gmap( "n", "<leader>sf", "<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<CR>", { desc = "Replace Current File" })
-- 搜索当前单词
vim.keybinds.gmap( "n", "<leader>sw", "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<CR>", { desc = "Replace Current Word" })

------------------------------------ floaterm -----------------------------------
vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
-- 打开普通终端
vim.keybinds.gmap("n", "<leader>tw", "<cmd>FloatermNew<CR>", { desc = "Floaterm New" })
-- 退出终端插入模式
vim.keybinds.gmap("n", "<leader>tk", "<cmd>FloatermKill<CR>", { desc = "Floaterm Kill" })
vim.keybinds.gmap("n", "<leader>tp", "<cmd>FloatermPrev<CR>", { desc = "Floaterm Prev" })
vim.keybinds.gmap("n", "<leader>tn", "<cmd>FloatermNext<CR>", { desc = "Floaterm Next" })
-- 打开或关闭所有终端
vim.keybinds.gmap("n", "<leader>tt", "<cmd>FloatermToggle<CR>", { desc = "Floaterm Toggle" })

--------------------------------- quickfix 快捷键 -------------------------------
vim.keybinds.gmap("n", "<leader>cn", "<cmd>cnext<CR>", { desc = "cnext" })
vim.keybinds.gmap("n", "<leader>cp", "<cmd>cprevious<CR>", { desc = "cprev" })
vim.keybinds.gmap("n", "<leader>cw", "<cmd>cwindow<CR>", { desc = "cwindow" })
vim.keybinds.gmap("n", "<leader>cx", "<cmd>cclose<CR>", { desc = "cclose" })
vim.keybinds.gmap("n", "<leader>co", "<cmd>copen<CR>", { desc = "copen" })

------------------------------- overseer 任务管理系统 ---------------------------
-- vim.keybinds.gmap("n", "<Leader>ct", "<cmd>OverseerToggle<cr>", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "<Leader>cr", "<cmd>OverseerRun<cr>", vim.keybinds.opts)

----------------------------------- AsyncTask 编译运行 -----------------------------
vim.keybinds.gmap("n", "<leader>cb", ":AsyncTask build<CR>", { desc = "task build" })
vim.keybinds.gmap("n", "<leader>cr", ":AsyncTask run<CR>", { desc = "task run" })

