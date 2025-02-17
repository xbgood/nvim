-- 设置调试相关的字符和颜色
local dap_breakpoint_color = {
    breakpoint = {
        ctermbg = 0,
        fg = '#993939',
        bg = '#31353f',
    },
    logpoing = {
        ctermbg = 0,
        fg = '#61afef',
        bg = '#31353f',
    },
    stopped = {
        ctermbg = 0,
        fg = '#98c379',
        bg = '#31353f'
    },
}

vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

local dap_breakpoint = {
    error = {
        text = "",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    condition = {
        text = '',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
    },
    rejected = {
        text = "",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    logpoint = {
        text = '',
        texthl = 'DapLogPoint',
        linehl = 'DapLogPoint',
        numhl = 'DapLogPoint',
    },
    stopped = {
        text = '',
        texthl = 'DapStopped',
        linehl = 'DapStopped',
        numhl = 'DapStopped',
    },
}

vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

--------------------------------- dap configurations -------------------------------
local dap = require("dap")

-- python
dap.adapters.python = {
    type = 'executable',
    command = 'python',
    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        -- 在终端显示结果
        -- console = "integratedTerminal",
        pythonPath = function()
            return '/usr/bin/python'
        end,
        stopOnEntry = true, -- 在入口处暂停
    },
}

-- gdb
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = {
        "-q", -- 不显示gdb的开机提示信息
        "--interpreter=dap",
        "--eval-command", "set print pretty on",
    },
}

-- c
dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            local default_file = vim.fn.expand("%:p:r") .. ".out"
            if vim.fn.filereadable(default_file) == 1 then
                -- 打开在overseer默认编译为file.out的可执行文件
                return default_file
            else
                -- 如果不存在file.out可执行文件则手动输入c编译的可执行文件名
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = true,
        -- 在入口处暂停
        stopOnEntry = true,
        MIMode = "gdb",
        -- 允许在repl中直接输入gdb命令
        miDebuggerArgs = '-interpreter=console',
    },
}

-- cpp
dap.configurations.cpp = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            local default_file = vim.fn.expand("%:p:r") .. ".out"
            if vim.fn.filereadable(default_file) == 1 then
                -- 打开在overseer默认编译为file.out的可执行文件
                return default_file
            else
                -- 如果不存在file.out可执行文件则手动输入cpp编译的可执行文件名
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = true,
        -- 在入口处暂停
        stopOnEntry = true,
        MIMode = "gdb",
        -- 允许在repl中直接输入gdb命令
        miDebuggerArgs = '-interpreter=console',
    },
}

-- rust
dap.configurations.rust = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            local default_file = vim.fn.expand("%:p:r") .. ".out"
            if vim.fn.filereadable(default_file) == 1 then
                -- 打开在overseer默认编译为file.out的可执行文件
                return default_file
            else
                -- 如果不存在file.out可执行文件则手动输入cpp编译的可执行文件名
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = true,
        -- 在入口处暂停
        stopOnEntry = true,
    },
}
