-- https://github.com/rmagatti/auto-session

-- 推荐设置
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require("auto-session").setup(
    {
        auto_session_enabled = true,
        auto_save_enabled = nil,
        -- 自动加载最后保存的一次会话
        auto_session_enable_last_session = true,
        -- 保存会话时自动关闭 nvim-tree
        -- 这是因为 nvim-tree 如果处于开启
        -- 状态，会破坏会话的保存
        pre_save_cmds = {"tabdo NvimTreeClose"}
    }
)
