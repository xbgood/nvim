-- lazy插件管理
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- 多光标模式
    { "mg979/vim-visual-multi" },
    -- 自动保存
    { "Pocco81/auto-save.nvim" },
    -- 快速的jk
    { "rainbowhxch/accelerated-jk.nvim" },
    -- 光标移动时突出显示
    { "sphamba/smear-cursor.nvim",          opts = {} },
    -- 显示网页色
    { 'brenoprata10/nvim-highlight-colors', opts = {} },
    -- 顶部状态栏
    { "romgrk/barbar.nvim",                 opts = {} },
    -- 上次编辑的位置
    { "ethanholz/nvim-lastplace",           opts = {} },
    -- 查找替换
    { "MagicDuck/grug-far.nvim",            opts = {} },
    -- 底部美丽的状态栏
    { "nvim-lualine/lualine.nvim",          opts = {} },
    -- 美丽的消息通知
    { "folke/noice.nvim",                   opts = {}, event = "VeryLazy" },
    -- 快速跳转
    { "folke/flash.nvim",                   opts = {}, event = "VeryLazy" },
    -- yazi 文件浏览器
    { "mikavilpas/yazi.nvim",               opts = {}, event = "VeryLazy" },
    -- markdown 图片插入
    { "HakonHarnes/img-clip.nvim",          opts = {}, event = "VeryLazy" },
    -- 自动匹配括号
    { "windwp/nvim-autopairs",              opts = {}, event = "InsertEnter" },
    -- 包裹修改
    { "kylechui/nvim-surround",             opts = {}, event = "VeryLazy" },
    -- 键位绑定器
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { icons = { separator = "" } },
    },
    -- 现代化的任务管理系统
    {
        "stevearc/overseer.nvim",
        event = "VeryLazy",
        -- opts = {},
        config = function()
            require("conf.nvim-overseer")
        end,
    },
    -- 为了能让状态栏显示 git 信息，所以这个插件是必须的
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim", },
        config = function()
            require("conf.nvim-gitsigns")
        end,
    },
    -- latex 支持
    {
        "lervag/vimtex",
        lazy = false,
        ft = "tex",
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    },
    -- 代码注释
    {
        "numToStr/Comment.nvim",
        opts = {
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

        },
    },
    -- 内置终端
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            open_mapping = [[<C-t>]], -- 快捷键
            direction = 'float',
            terminal_mappings = true,
            shell = vim.o.shell,
            start_in_insert = true,
            close_on_exit = true,
            auto_scroll = true,
            persist_size = true,
            persist_mode = true,
            shade_terminals = true,
            shading_factor = -80,
            shading_ratio = -6,
            hide_numbers = true,
            size = 10,

            float_opts = {
                close_on_esc = true,
                shading_factor = 0.9,
                relative = 'editor',
                border = 'curved',
                width = 80,
                height = 20,
                row = 100,
                col = 200,
                winblend = 3,
                title_pos = 'left',
                zindex = 10,
            },

            winbar = {
                enabled = true,
                name_formatter = function(term)
                    return term.name
                end
            },
        }
    },
    -- LSP 系列插件
    {
        -- LSP UI 美化
        { "nvimdev/lspsaga.nvim", opts = { extend_gitsigns = true }, },
        -- LSP 基础服务
        {
            "neovim/nvim-lspconfig",
            dependencies = { "saghen/blink.cmp" },
            config = function()
                require("conf.lspconfig")
            end,
        },
        -- mason 自动安装相关的包
        {
            -- mason 自动安装 LSP 的工具，否则需要手动用npm安装包
            { "williamboman/mason.nvim", opts = {} },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup({
                        ensure_installed = {
                            "ast_grep", "lua_ls", "clangd", "rust_analyzer", "bashls", "emmet_ls", "html", "jsonls",
                            "yamlls", "gopls", "cssls", "prosemd_lsp", "ts_ls", "asm_lsp", "pyright", "texlab"
                        },
                    })
                end,
            },
        },
        -- blink.cmp 替代nvim.cmp
        {
            "saghen/blink.cmp",
            version = "*",
            dependencies = "rafamadriz/friendly-snippets",
            opts = {
                keymap = {
                    preset      = "enter",
                    ["<S-Tab>"] = { "select_prev", "fallback" },
                    ["<C-p>"]   = { "select_prev", "fallback" },
                    ["<Up>"]    = { "select_prev", "fallback" },
                    ["<Down"]   = { "select_next", "fallback" },
                    ["<Tab>"]   = { "select_next", "fallback" },
                    ["<C-n>"]   = { "select_next", "fallback" },

                    ["<C-e>"]   = { "hide" },
                    ["<C-y>"]   = { "select_and_accept" },
                    ["<C-b>"]   = { "scroll_documentation_up", "fallback" },
                    ["<C-f>"]   = { "scroll_documentation_down", "fallback" },
                    ["<C-tab>"] = { "show", "show_documentation", "hide_documentation" },
                },

                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "mono",
                },

                cmdline = {
                    completion = {
                        -- 幽灵文本：后面灰色提示的文本
                        ghost_text = { enabled = true },
                        -- 弹窗列表
                        menu = { auto_show = false },
                    }
                },

                -- 补全配置
                completion = {
                    documentation = { auto_show = true },
                    ghost_text = { enabled = true },
                    list = {
                        selection = {
                            preselect = true,
                            auto_insert = true,
                        },
                    },
                    menu = {
                        draw = {
                            treesitter = { 'lsp' },
                            columns = {
                                { "label", "label_description", gap = 1, },
                                {
                                    "kind_icon", -- 图标
                                    -- "kind", -- 类型，文本提示
                                }
                            }
                        },
                    },
                },

                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },

                    providers = {
                        lsp = {
                            name = 'LSP',
                            module = 'blink.cmp.sources.lsp',
                            opts = {},
                            enabled = true,
                            async = false,
                        },
                    },
                },

                -- 实验性质的功能
                signature = { enabled = true },
            },
        },
    },
    -- 语法高亮
    {
        "nvim-treesitter/nvim-treesitter",
        build = { ":TSUpdate" },
        config = function()
            require("nvim-treesitter.configs").setup({
                sync_install = false,
                ensure_installed = {
                    "c", "cpp", "lua", "vim", "html", "rust", "python", "go", "markdown", "markdown_inline",
                    "bash", "diff", "ini", "json", "sql", "yaml", "vimdoc", "toml", "regex"
                },
                highlight = {
                    enable = true,
                    -- 使用 treesitter 高亮而不是 neovim 内置的高亮
                    additional_vim_regex_highlighting = false
                },
            })
        end,
    },
    -- markdown
    {
        -- markdown 文本显示格式
        {
            "OXY2DEV/markview.nvim",
            lazy = false,
            dependencies = { "nvim-tree/nvim-web-devicons", },
            opts = {
                code_blocks = { sign = false, label_direction = "left" },
            }
        },

        -- markdown 预览
        {
            "iamcco/markdown-preview.nvim",
            build = "cd app && bash install.sh",
            ft = { "markdown" },
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        },
    },
    -- tab跳出括号
    {
        'abecodes/tabout.nvim',
        lazy = false,
        opt = true,
        priority = 1000,
        event = 'InsertCharPre',
        dependencies = { "nvim-treesitter/nvim-treesitter", },
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>',             -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true,            -- shift content if tab out is not possible
                act_as_shift_tab = false,     -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = '<C-t>',        -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = '<C-d>',  -- reverse shift default action,
                enable_backwards = true,      -- well ...
                completion = false,           -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' }
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end,
    },
    -- dap调试代码
    {
        -- 提供基本的dap支持
        {
            "mfussenegger/nvim-dap",
            config = function()
                require('conf.nvim-dap')
            end,
        },
        -- 提供类似VSCode的调试界面
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "mfussenegger/nvim-dap",
                "nvim-neotest/nvim-nio"
            },
            config = function()
                require("conf.dapui")
            end,
        },
        -- 在调试的代码附近用虚显的文件显示变量信息
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {
                virt_text_pos = 'eol', -- eol 在行尾显示，inline 在变量定义处显示
            },
        },
    },
    -- 一些功能集合
    {
        "folke/snacks.nvim",
        event = "VeryLazy",
        priority = 1000,
        lazy = true,
        opts = {
            input        = { enabled = true },
            picker       = { enabled = true },
            scope        = { enabled = true },
            words        = { enabled = true },
            notify       = { enabled = true },
            notifier     = { enabled = true },
            scroll       = { enabled = true },
            animate      = { enabled = true },
            bigfile      = { enabled = true },
            quickfile    = { enabled = true },
            statuscolumn = { enabled = true },
            styles       = { notification = { wo = { wrap = true } } },
            explorer     = { enabled = true, replace_netrw = true },
            dashboard    = {
                formats = {
                    key = function(item) return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } } end,
                },
                sections = {
                    { title = "MRU",            padding = 1 },
                    { section = "recent_files", limit = 8,  padding = 1 },
                    { title = "Sessions",       padding = 1 },
                    { section = "projects",     padding = 1 },
                    { title = "Bookmarks",      padding = 1 },
                    { section = "keys" },
                },
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...) require('snacks').debug.inspect(...) end
                    _G.bt = function() require('snacks').debug.backtrace() end
                    vim.print = _G.dd

                    --  打开indent
                    require('snacks').indent.enable()
                    require('snacks').input.enable()

                    -- Create some toggle mappings
                    local st = require('snacks').toggle
                    -- 拼写
                    st.option("spell", { name = "Spelling" }):map("<leader>us")
                    -- 是否折行
                    st.option("wrap", { name = "Wrap" }):map("<leader>uw")
                    -- 相对行号
                    st.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                    -- 行号
                    st.line_number():map("<leader>ul")
                    -- 关闭打开diagnostics
                    st.diagnostics():map("<leader>ud")
                    -- 打开conceal
                    st.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
                        "<leader>uc")
                    -- 切换 treesitter 配色
                    st.treesitter():map("<leader>uT")
                    -- 打开背景
                    st.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
                    -- 打开函数的参数提醒
                    st.inlay_hints():map("<leader>uh")
                    -- 打开indentline
                    st.indent():map("<leader>ug")
                    -- 打开dim
                    st.dim():map("<leader>uD")
                end,
            })
        end,
    },
    -- 主题颜色
    {
        { "rose-pine/neovim",       name = "rosepine", },
        -- { "catppuccin/nvim",        name = "catppuccin", },
        { "EdenEast/nightfox.nvim", name = "nightfox" },
        -- { "sainnhe/everforest",     name = "everforest" },
        -- { "folke/tokyonight.nvim",  name = "tokyonight" },
    },
})
