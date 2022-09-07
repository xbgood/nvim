-- https://github.com/sbdchd/neoformat

-- WARN: neoformat 手动安装各语言的代码格式化程序
-- https://github.com/sbdchd/neoformat#supported-filetypes

-- 当没有找到格式化程序时，将按照如下方式自动格式化

-- 1.自动对齐
vim.g.neoformat_basic_format_align = 1
-- 2.自动删除行尾空格
vim.g.neoformat_basic_format_trim = 1
-- 3.将制表符替换为空格
vim.g.neoformat_basic_format_retab = 0
vim.g.neoformat_run_all_formatter = 1

-- 只提示错误消息
vim.g.neoformat_only_msg_on_error = 1


-- neoformat 格式化代码
vim.keybinds.gmap("n", "<leader>cf", "<cmd>Neoformat<CR>", vim.keybinds.opts)

-- 用 astyle 来格式化代码
vim.keybinds.gmap("n", "<leader>cc", "<cmd>%!astyle --style=google --indent=spaces=4 --ascii --exclude=3rdparty<CR>", vim.keybinds.opts)
