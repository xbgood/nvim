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
    -- 中文文档
    { "yianwillis/vimcdoc" },
    -- 精美弹窗
    { "rcarriga/nvim-notify" },
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
        opts = {
            icons = { separator = "", },
        },
    },
    -- 为了能让状态栏显示 git 信息，所以这个插件是必须的
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim", },
        config = function()
            require("conf.nvim-gitsigns")
        end,
    },
    -- 内置终端
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("conf.toggleterm")
        end
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
    -- 美丽的消息通知
    {
        "folke/noice.nvim",
        opts = {},
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    },
    -- 代码注释
    {
        "numToStr/Comment.nvim",
        config = function()
            require("conf.comment")
        end,
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
                            "lua_ls", "clangd", "rust_analyzer", "bashls", "emmet_ls", "html", "ast_grep", "jsonls",
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
                    enabled = false,
                },

                sources = {
                    default = { "lsp", "path", "snippets", "buffer", "markdown" },
                    -- 默认关掉cmdline，否则命令行输入时候会很多干扰
                    providers = {
                        lsp = {
                            name = 'LSP',
                            module = 'blink.cmp.sources.lsp',
                            enabled = true,
                        },
                        -- markdown 模块
                        markdown = {
                            name = "RenderMarkdown",
                            module = "render-markdown.integ.blink",
                            fallbacks = { "lsp" },
                        },
                    },
                },

                -- 实验性质的功能
                signature = { enabled = true },
            },
            opts_extend = { "sources.default" },
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
            "MeanderingProgrammer/render-markdown.nvim",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-tree/nvim-web-devicons",
            },
            opts = {
                render_modes = true,
                pipe_table = { preset = 'round' },
            },
        },
        -- markdown 预览
        {
            "iamcco/markdown-preview.nvim",
            ft = { "markdown" },
            build = "cd app && npm install",
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
    -- 现代化的任务管理系统
    {
        "stevearc/overseer.nvim",
        event = "VeryLazy",
        -- opts = {},
        config = function()
            require("conf.nvim-overseer")
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
        { "catppuccin/nvim",        name = "catppuccin", },
        { "EdenEast/nightfox.nvim", name = "nightfox" },
        { "sainnhe/everforest",     name = "everforest" },
        { "folke/tokyonight.nvim",  name = "tokyonight" },
    },
})
