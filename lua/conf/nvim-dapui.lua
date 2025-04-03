local dap, dapui                                   = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config           = function() dapui.open() end
dap.listeners.before.launch.dapui_config           = function() dapui.open() end

require("dapui").setup({
    icons = {
        current_frame = "",
        collapsed = "",
        expanded = ""
    },
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        edit = "e",
        open = "o",
        repl = "r",
        remove = "d",
        toggle = "t"
    },
    controls = {
        element = "repl",
        enabled = true,
        icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = ""
        }
    },
    layouts = {
        {
            elements = {
                { id = "watches",     size = 0.25 },
                { id = "scopes",      size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks",      size = 0.25 },
            },
            position = "left",
            size = 40
        },
        {
            elements = {
                -- 关闭console终端
                -- { id = "console", size = 0.5 },
                -- { id = "repl",    size = 0.5 },
                { id = "repl", size = 1.0 },
            },
            position = "bottom",
            size = 10
        }
    },
    element_mappings = {},
    expand_lines = true,
    force_buffers = true,
    floating = {
        border = "single",
        mappings = {
            close = { "q", "<Esc>" }
        }
    },
    render = {
        indent = 1,
        max_value_lines = 100
    }
})
