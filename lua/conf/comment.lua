-- https://github.com/numToStr/Comment.nvim
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring


require("Comment").setup(
    {
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
            -- 切换行注释
            line = "gcc",
            --- 切换块注释
            block = "gbc"
        },
        opleader = {
            -- 可视模式下的行注释
            line = "gc",
            -- 可视模式下的块注释
            block = "gb"
        },
        extra = {
            -- 在当前行上方新增行注释
            above = "gcO",
            -- 在当前行下方新增行注释
            below = "gco",
            -- 在当前行行尾新增行注释
            eol = "gcA"
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            ---Extra mapping; `gco`, `gcO`, `gcA`
            extra = true,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = nil,
    }
)
