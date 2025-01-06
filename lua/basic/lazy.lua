-- lazy插件管理
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- 中文文档
    { "yianwillis/vimcdoc" },
    -- undo tree
    { "mbbill/undotree" },
    -- 键位绑定器
    { "folke/which-key.nvim" },
    -- 多光标模式
    { "terryma/vim-multiple-cursors" },
    -- 查找替换
    {
        'MagicDuck/grug-far.nvim',
        config = function()
            require('grug-far').setup({
                -- options, see Configuration section below
                -- there are no required options atm
                -- engine = 'ripgrep' is default, but 'astgrep' can be specified
            });
        end
    },
    -- nvim-tree
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = {
            -- 依赖一个图标插件
            "kyazdani42/nvim-web-devicons"
        },
        config = function()
            -- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
            require("conf.nvim-tree")
        end,
    },
    -- 为状态栏提供上下文信息
    {
        "SmiteshP/nvim-gps",
        dependencies = "nvim-treesitter/nvim-treesitter"
    },
    -- 为了能让状态栏显示 git 信息，所以这个插件是必须的
    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            -- 依赖于该插件（一款 Lua 开发使用的插件）
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("conf.gitsigns")
        end
    },
    -- 支持 LSP 状态的 buffer 栏
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
        },
        config = function()
            require("conf.bufferline")
        end
    },
    -- 美丽的状态栏
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("conf.nvim-lualine")
        end
    },
    -- 搜索时显示条目
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require('hlslens').setup()
        end
    },
    -- 自动匹配括号
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "vim" },
            })
        end
    },
    -- 快速跳转
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
        config = function()
            require("conf.nvim-flash")
        end

    },
    -- 快速跳转
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            indent = { enabled = true }, -- 开启缩进线
            input = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    },
    -- 包裹修改
    {
        "ur4ltz/surround.nvim",
        config = function()
            require("surround").setup({ mappings_style = "surround" })
        end
    },
    -- 自动保存
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("conf.auto-save")
        end
    },
    -- 自动恢复光标位置
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require("conf.nvim-lastplace")
        end
    },
    -- 内置终端
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("conf.toggleterm")
        end
    },
    -- 精美弹窗
    {
        "rcarriga/nvim-notify",
        config = function()
            require("conf.nvim-notify")
        end
    },
    -- todo tree
    {
        "folke/todo-comments.nvim",
        config = function()
            require("conf.todo-comments")
        end
    },
    -- 美丽的消息通知
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            "rcarriga/nvim-notify",
        }
    },
    -- LSP 基础服务
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        config = function()
            require("conf.nvim-lspconfig")
        end
    },
    -- 自动安装 LSP
    {
        "williamboman/mason.nvim",
        config = function()
            require("conf.mason")
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("conf.mason-lspconfig")
        end
    },
    -- LSP UI 美化
    {
        "kkharji/lspsaga.nvim",
        config = function()
            require("conf.lspsaga")
        end
    },
    -- LSP 进度提示
    {
        "j-hui/fidget.nvim",
        tag = 'legacy',
        config = function()
            require("fidget").setup({
                window = { blend = 0, }
            })
        end
    },
    -- blink.cmp
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        opts = {
            -- 'default' for mappings similar to built-in completion
            keymap = { preset = 'default' },

            appearance = {
                -- use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
        opts_extend = { "sources.default" }
    },
    -- 插入模式获得函数签名
    {
        "ray-x/lsp_signature.nvim",
        name = "lsp-signature",
        config = function()
            require("conf.lsp-signature")
        end
    },
    -- 灯泡提示代码行为
    { "kosayoda/nvim-lightbulb", },
    -- 语法高亮
    {
        "nvim-treesitter/nvim-treesitter",
        build = { ":TSUpdate" },
        dependencies = {
            "p00f/nvim-ts-rainbow" -- 彩虹括号
        },
        config = function()
            require("conf.nvim-treesitter")
        end
    },
    -- 代码注释
    {
        "numToStr/Comment.nvim",
        config = function()
            require("conf.comment")
        end
    },
    -- 为不支持 LSP 高亮的主题提供默认高亮方案
    {
        "folke/lsp-colors.nvim",
        config = function()
            require("conf.lsp-colors")
        end
    },
    -- view tree
    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("conf.symbols-outline")
        end
    },
    -- latex
    {
        'lervag/vimtex',
        opt = true,
        config = function()
            -- vim.cmd([[
            --     filetype plugin indent on
            --     syntax enable
            -- ]])
            vim.g.tex_flavor = 'latex'
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_view_general_viewer = 'zathura'
            -- 设置neovim-remote
            vim.g.vimtex_compiler_progname = 'nvr'
            vim.g.vimtex_compiler_latexmk_engines = { _ = '-pdflatex' }
            vim.g.tex_comment_nospell = 1
            -- 忽略警告
            vim.g.vimtex_quickfix_open_on_warning = 0
            -- 关闭编译报错自动弹出错误窗口
            vim.g.vimtex_quickfix_mode = 0
            -- vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
            -- 改变vimtex的默认按键为,
            vim.g.maplocalleader = ","
        end,
        ft = 'tex'
    },
    -- markdown
    {
        -- markdown 文本显示格式
        {
            'MeanderingProgrammer/render-markdown.nvim',
            dependencies = {
                'nvim-treesitter/nvim-treesitter',
                'nvim-tree/nvim-web-devicons'
            },
            opts = {},
        },
        -- markdown preview
        {
            "iamcco/markdown-preview.nvim",
            ft = 'markdown',
            build = 'cd app && npm install',
            init = function()
                vim.g.mkdp_filetypes = { "markdown" }
            end,
        },
        -- vim markdown
        { "preservim/vim-markdown", },
        -- markdown image paste
        {
            "img-paste-devs/img-paste.vim",
            init = function()
                vim.cmd([[
                    " markdown preview
                    let g:mkdp_auto_start = 1
                    let g:mkdp_auto_close = 1
                    let g:mkdp_theme = 'light' "light/dark
                    let g:mdip_imgdir = 'assets/images'
                    let g:mkdp_browser='firefox'
                ]])
            end,
        },
        -- markdown table
        --{ "dhruvasagar/vim-table-mode", },
        -- markdown org
        --{ "demonlord1997/markdown-org", },
    },
    -- quick jk
    {
        "PHSix/faster.nvim",
        event = { "VimEnter *" },
        config = function()
            vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', { noremap = false, silent = true })
            vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', { noremap = false, silent = true })
            -- if you need map in visual mode
            vim.api.nvim_set_keymap('v', 'j', '<Plug>(faster_vmove_j)', { noremap = false, silent = true })
            vim.api.nvim_set_keymap('v', 'k', '<Plug>(faster_vmove_k)', { noremap = false, silent = true })
        end
    },
    -- run code
    {
        -- asyncrun 编译代码
        { "skywind3000/asyncrun.vim", },
        -- tasks 任务系统
        { "skywind3000/asynctasks.vim", },
    },
    {
        {
            -- 优秀的暗色主题
            "rose-pine/neovim",
            name = 'rose-pine',
            config = function()
                require("conf.rose-pine")
            end,
        },
        {
            "catppuccin/nvim",
            -- 改个别名，因为它的名字是 nvim，可能会冲突
            name = "catppuccin",
            config = function()
                -- 插件加载完成后自动运行 lua/conf/catppuccin.lua 文件中的代码
                require("conf.catppuccin")
            end,
        },
    },
    -- 显示网页色
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        opts = {}
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
               "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    -- 自动代码补全系列插件
    -- 该插件已经被放弃，用blink.cmp来代替
    -- {
    --     "hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
    --     dependencies = {
    --         -- LuaSnip引擎
    --         { "L3MON4D3/LuaSnip" },
    --         { 'saadparwaiz1/cmp_luasnip' },
    --         -- vsnip引擎
    --         -- { "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
    --         -- { "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
    --         { "hrsh7th/cmp-nvim-lsp" },                       -- 替换内置 omnifunc，获得更多补全
    --         { "hrsh7th/cmp-path" },                           -- 路径补全
    --         { "hrsh7th/cmp-buffer" },                         -- 缓冲区补全
    --         { "hrsh7th/cmp-cmdline" },                        -- 命令补全
    --         { "hrsh7th/cmp-calc" },                           --输入数学算式（如1+1=）自动计算
    --         { "hrsh7th/cmp-emoji" },                          --输入: 可以显示表情
    --         { "f3fora/cmp-spell" },                           -- 拼写建议
    --         { "onsails/lspkind-nvim" },                       -- 为补全添加类似 vscode 的图标
    --         { "rafamadriz/friendly-snippets" },               -- 提供多种语言的代码片段
    --         { "lukas-reineke/cmp-under-comparator" },         -- 让补全结果的排序更加智能
    --         { "tzachar/cmp-tabnine", build = "./install.sh" } -- tabnine 源,提供基于 AI 的智能补全
    --     },
    --     config = function()
    --         require("conf.nvim-cmp")
    --     end
    -- },
    -- -- 全局替换, 用grag-far来代替
    -- {
    --     "nvim-pack/nvim-spectre",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim", -- Lua 开发模块
    --         "BurntSushi/ripgrep"     -- 文字查找
    --     },
    --     config = function()
    --         require("conf.nvim-spectre")
    --     end
    -- },
    -- 显示缩进线，用snacks的indent来代替来，这个太麻烦来。
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     config = function()
    --         require("ibl").setup({
    --             debounce = 100,
    --             indent = { char = "|" },
    --             whitespace = {
    --                 highlight = { "Whitespace", "NonText" },
    --                 remove_blankline_trail = true,
    --             },
    --             scope = {
    --                 enabled = true,
    --                 show_start = true,
    --                 show_end = false,
    --             },
    --         })
    --     end
    -- },
    -- 模糊查找，用fzf-lua来代替
    -- {
    --     "nvim-telescope/telescope.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim", -- Lua 开发模块
    --         "BurntSushi/ripgrep",    -- 文字查找
    --         "sharkdp/fd"             -- 文件查找
    --     },
    --     config = function()
    --         require("conf.telescope")
    --     end
    -- },
})
