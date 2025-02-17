---------------------------------------- overseer 配置 -----------------------------------------
require("overseer").setup({
    strategy = {
        "toggleterm",
        direction = "float",
        auto_scroll = true,
        close_on_exit = false,
        quit_on_exit = "always",
        open_on_start = true,
        hidden = true,
    },
    -- template_dirs = { "overseer.template" },
    templates = { "builtin" },
    auto_detect_success_color = true,
    dap = true,
    task_list = {
        direction = "right",
        default_detail = 1,
        max_width = { 80, 0.2 },
        min_width = { 30, 0.1 },
        width = nil,
        max_height = { 20, 0.1 },
        min_height = 8,
        height = nil,
        separator = "────────────────────────────────────────",
        bindings = {
            ["?"] = "ShowHelp",
            ["g?"] = "ShowHelp",
            ["<CR>"] = "RunAction",
            ["<C-e>"] = "Edit",
            ["o"] = "Open",
            ["<C-v>"] = "OpenVsplit",
            ["<C-s>"] = "OpenSplit",
            ["<C-f>"] = "OpenFloat",
            ["<C-q>"] = "OpenQuickFix",
            ["p"] = "TogglePreview",
            ["<C-l>"] = "IncreaseDetail",
            ["<C-h>"] = "DecreaseDetail",
            ["L"] = "IncreaseAllDetail",
            ["H"] = "DecreaseAllDetail",
            ["["] = "DecreaseWidth",
            ["]"] = "IncreaseWidth",
            ["{"] = "PrevTask",
            ["}"] = "NextTask",
            ["<C-k>"] = "ScrollOutputUp",
            ["<C-j>"] = "ScrollOutputDown",
            ["q"] = "Close",
        },
    },
    actions = {},
    form = {
        border = "rounded",
        zindex = 40,
        min_width = 80,
        max_width = 0.5,
        width = nil,
        min_height = 10,
        max_height = 0.3,
        height = nil,
        win_opts = { winblend = 0, },
    },
    task_launcher = {
        bindings = {
            i = {
                ["<C-s>"] = "Submit",
                ["<C-c>"] = "Cancel",
            },
            n = {
                ["<CR>"] = "Submit",
                ["<C-s>"] = "Submit",
                ["q"] = "Cancel",
                ["?"] = "ShowHelp",
            },
        },
    },
    task_editor = {
        bindings = {
            i = {
                ["<CR>"] = "NextOrSubmit",
                ["<C-s>"] = "Submit",
                ["<Tab>"] = "Next",
                ["<S-Tab>"] = "Prev",
                ["<C-c>"] = "Cancel",
            },
            n = {
                ["<CR>"] = "NextOrSubmit",
                ["<C-s>"] = "Submit",
                ["<Tab>"] = "Next",
                ["<S-Tab>"] = "Prev",
                ["q"] = "Cancel",
                ["?"] = "ShowHelp",
            },
        },
    },
    confirm = {
        border = "rounded",
        zindex = 40,
        min_width = 20,
        max_width = 0.5,
        width = nil,
        min_height = 6,
        max_height = 0.3,
        height = nil,
        win_opts = { winblend = 0, },
    },
    task_win = {
        padding = 2,
        border = "rounded",
        win_opts = { winblend = 0, },
    },
    help_win = {
        border = "rounded",
        win_opts = {},
    },
    component_aliases = {
        default = {
            { "display_duration",    detail_level = 2 },
            "on_output_summarize",
            "on_exit_set_status",
            -- "on_complete_notify",
            { "on_complete_dispose", require_view = { "SUCCESS", "FAILURE" } },
        },
        default_vscode = {
            "default",
            "on_result_diagnostics",
        },
    },
    bundles = {
        save_task_opts = { bundleable = true, },
        autostart_on_load = true,
    },
    preload_components = {},
    default_template_prompt = "allow",
    template_timeout = 3000,
    template_cache_threshold = 100,
    log = {
        {
            type = "echo",
            level = vim.log.levels.WARN,
        },
        {
            type = "file",
            filename = "overseer.log",
            level = vim.log.levels.WARN,
        },
    },
})



------------------------------------------------------ 配置编译源码的命令 -------------------------------
local overseer = require("overseer")
-- gcc
overseer.register_template(
    {
        name = "gcc build",

        builder = function()
            local file = vim.fn.expand("%:p")
            local outfile = vim.fn.expand("%:p:r") .. ".out"

            return {
                cmd = { "gcc", "-Wall", file, "-o", outfile, "-g" },
                components = {
                    { "open_output", direction = "float" },
                    "on_result_diagnostics",
                    "default"
                },
            }
        end,
        condition = { filetype = { "c" } },
    }
)
-- gcc run
overseer.register_template(
    {
        name = "gcc run",

        builder = function()
            local file = vim.fn.expand("%:p")
            local outfile = vim.fn.expand("%:p:r") .. ".out"

            return {
                cmd = { "gcc", "-Wall", file, "-o", outfile, "-g", "&&", outfile },
                components = {
                    { "open_output", direction = "float" },
                    -- 运行结束删除可执行文件
                    { "run_after",   task_names = { { cmd = { "rm", outfile } } } },
                    "on_result_diagnostics",
                    "default"
                },
            }
        end,
        condition = { filetype = { "c" } },
    }
)

-- g++ run
overseer.register_template({
    name = "g++ build",

    builder = function()
        local file = vim.fn.expand("%:p")
        local outfile = vim.fn.expand("%:p:r") .. ".out"

        return {
            cmd = { "g++", "-Wall", file, "-o", outfile, "-g" },
            components = {
                { "open_output", direction = "float" },
                -- 运行结束删除可执行文件
                -- { "run_after",   task_names = { { cmd = { "rm", outfile } } } },
                "on_result_diagnostics",
                "default"
            },
        }
    end,
    condition = { filetype = { "cpp" } },
})

overseer.register_template({
    name = "g++ run",

    builder = function()
        local file = vim.fn.expand("%:p")
        local outfile = vim.fn.expand("%:p:r") .. ".out"

        return {
            cmd = { "g++", "-Wall", file, "-o", outfile, "-g", "&&", outfile },
            -- cmd = { outfile },
            components = {
                -- 先后顺序，为改成 && 执行了，更加好些
                -- { "dependencies", task_names = { { cmd = { "g++", "-Wall", file, "-o", outfile }, } } },
                { "open_output", direction = "float" },
                -- 运行结束删除可执行文件
                { "run_after",   task_names = { { cmd = { "rm", outfile } } } },
                "on_result_diagnostics",
                "default"
            },
        }
    end,
    condition = { filetype = { "cpp" } },
})

-- rust
overseer.register_template({
    name = "rust build",

    builder = function()
        local file = vim.fn.expand("%:p")
        local outfile = vim.fn.expand("%:p:r") .. ".out"

        return {
            cmd = { "rustc", file, "-o", outfile, "-g" },
            components = {
                { "open_output", direction = "float" },
                -- 运行结束删除可执行文件
                "on_result_diagnostics",
                "default"
            },
        }
    end,
    condition = { filetype = { "rust" } },
})

overseer.register_template({
    name = "rust run",

    builder = function()
        local file = vim.fn.expand("%:p")
        local outfile = vim.fn.expand("%:p:r") .. ".out"

        return {
            cmd = { "rustc", file, "-o", outfile, "-g", "&&", outfile },
            components = {
                { "open_output", direction = "float" },
                -- 运行结束删除可执行文件
                { "run_after",   task_names = { { cmd = { "rm", outfile } } } },
                "on_result_diagnostics",
                "default"
            },
        }
    end,
    condition = { filetype = { "rust" } },
})

-- go
overseer.register_template({
    name = "go run",

    builder = function()
        local file = vim.fn.expand("%:p")
        local outfile = vim.fn.expand("%:p:r") .. ".out"
        local cmd = { "go", "run", file }

        return {
            cmd = cmd,
            components = {
                { "open_output", direction = "float" },
                -- 运行结束删除可执行文件，针对go文件
                { "run_after",   task_names = { { cmd = { "rm", outfile } } } },
                "on_result_diagnostics",
                "default",
            },
        }
    end,
    condition = { filetype = { "go" } },
})

-- script
overseer.register_template({
    name = "script run",

    builder = function()
        local file = vim.fn.expand("%:p")
        local cmd = { file }

        if vim.bo.filetype == "python" then
            cmd = { "python3", file }
        end
        if vim.bo.filetype == "sh" then
            cmd = { "sh", file }
        end

        return {
            cmd = cmd,
            components = {
                { "open_output", direction = "float" },
                "on_result_diagnostics",
                "default",
            },
        }
    end,
    condition = { filetype = { "sh", "python", }, },
})

