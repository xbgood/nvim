-- https://github.com/lukas-reineke/indent-blankline.nvim

-- vim.opt.list = true
-- 分割符用点号*
-- vim.opt.listchars:append "space:⋅"
-- 分隔符enter
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup({
    -- 分割线之间的分割符
    space_char_blankline = " ",
    -- 显示当前所在区域
    show_current_context = true,
    -- 显示当前所在区域的开始位置
    show_current_context_start = true,
    -- 显示行尾符
    show_end_of_line = true
})
