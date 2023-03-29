-- https://github.com/rcarriga/nvim-notify

local notify_opts = {
    -- 动画样式
    -- fade_in_slide_out
    -- fade
    -- slide
    -- static
    stages = "fade",
    -- 超时时间，默认 5s
    timeout = 3000,
    background_colour = "#000000",
}

-- 如果是透明背景，则需要设置背景色
if vim.g.background_transparency then
    notify_opts.background_colour = "#ffffff"
end

vim.notify = require("notify")

vim.notify.setup(notify_opts)
