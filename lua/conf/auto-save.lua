-- https://github.com/Pocco81/AutoSave.nvim

require("auto-save").setup
{
    enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
    -- 触发自动保存的事件（退出插入模式或者普通模式下文本内容发生改变）
    events = { "InsertLeave", "TextChanged" },
    execution_message = {
        message = function() -- message to print on save
            return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18, -- dim the color of `message`
        cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    },
    trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
    conditions = {
        exists = true,
        -- 忽略自动保存的文件名字或文件类型
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true
    },
    write_all_buffers = true, -- write all buffers when the current one meets `condition`
    on_off_commands = false,
    clean_command_line_interval = 0,
    debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
    callbacks = { -- functions to be executed at different intervals
    enabling = nil, -- ran when enabling auto-save
    disabling = nil, -- ran when disabling auto-save
    before_asserting_save = nil, -- ran before checking `condition`
    before_saving = nil, -- ran before doing the actual save
    after_saving = nil -- ran after doing the actual save
}
}
