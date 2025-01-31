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

-- 取消搜索的高亮
vim.keybinds.gmap('n', "<Esc>", "<cmd>nohlsearch<cr>", { desc = "nohlsearch" })


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

--------------------------------- quickfix 快捷键 -------------------------------
vim.keybinds.gmap("n", "<leader>cn", "<cmd>cnext<CR>", { desc = "cnext" })
vim.keybinds.gmap("n", "<leader>cp", "<cmd>cprevious<CR>", { desc = "cprev" })
vim.keybinds.gmap("n", "<leader>cw", "<cmd>cwindow<CR>", { desc = "cwindow" })
vim.keybinds.gmap("n", "<leader>cx", "<cmd>cclose<CR>", { desc = "cclose" })
vim.keybinds.gmap("n", "<leader>co", "<cmd>copen<CR>", { desc = "copen" })

------------------------------- overseer 任务管理系统 ---------------------------
vim.keymap.set("n", "<leader>cb", "<cmd>OverseerBuild<cr>", { desc = "Build Task"})
vim.keymap.set("n", "<leader>cr", "<cmd>OverseerRun<cr>", { desc = "Run Task"})
vim.keymap.set("n", "<leader>cq", "<cmd>OverseerQuickAction<cr>", { desc = "Quick Action"})

-------------------------------------  markdown  -----------------------------------
-- markdown preview
vim.keybinds.gmap("n", "<leader>pp", ":MarkdownPreview<CR>", { desc = "Markdown Perview" })
