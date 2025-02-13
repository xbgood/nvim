require("Comment").setup({
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
        line = "gcc",  -- 切换行注释
        block = "gbc", --- 切换块注释
    },
    opleader = {
        line = "gc",  -- 可视模式下的行注释
        block = "gb", -- 可视模式下的块注释
    },
    extra = {
        above = "gcO", -- 在当前行上方新增行注释
        below = "gco", -- 在当前行下方新增行注释
        eol = "gcA",   -- 在当前行行尾新增行注释
    },
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    pre_hook = nil,
    post_hook = nil,
})
