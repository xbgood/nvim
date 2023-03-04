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
    { "yianwillis/vimcdoc", },
    -- 更好用的ft
    { "rhysd/clever-f.vim" },
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
    -- 搜索时显示条目
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("conf.hlslens")
        end
    },
    -- 显示缩进线
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("conf.indent-blankline")
        end
    },
    -- 自动匹配括号
    {
        "windwp/nvim-autopairs",
        config = function()
            require("conf.nvim-autopairs")
        end
    },
    -- 快速跳转
    {
        "ggandor/leap.nvim",
        keys = { "s", "S" },
        config = function()
            require("leap").set_default_keymaps()
            vim.keymap.set('n', "s", function ()
                local current_window = vim.fn.win_getid()
                require('leap').leap { target_windows = { current_window } }
            end)
        end,
    },
    -- 包裹修改
    {
        "ur4ltz/surround.nvim",
        config = function()
            require("conf.surround")
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
    -- 多光标模式
    {
        "terryma/vim-multiple-cursors",
        config = function()
            require("conf.vim-multiple-cursors")
        end
    },
    -- 内置终端
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("conf.toggleterm")
        end
    },
    -- undo tree
    { "mbbill/undotree", },
    -- 键位绑定器
    {
        "folke/which-key.nvim",
        config = function()
            require("conf.which-key")
        end
    },
    -- 模糊查找
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Lua 开发模块
            "BurntSushi/ripgrep", -- 文字查找
            "sharkdp/fd" -- 文件查找
        },
        config = function()
            require("conf.telescope")
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
    -- 为状态栏提供上下文信息
    {
        "SmiteshP/nvim-gps",
        dependencies = "nvim-treesitter/nvim-treesitter"
    },
    -- 美丽的状态栏
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("conf.nvim-lualine")
        end
    },
    -- LSP 基础服务
    {
        "neovim/nvim-lspconfig",
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
        config = function()
            require("conf.fidget")
        end
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
    {
        "kosayoda/nvim-lightbulb",
        config = function()
            require("conf.nvim-lightbulb")
        end
    },
    -- 自动代码补全系列插件
    {
        "hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
        dependencies = {
            { "onsails/lspkind-nvim" }, -- 为补全添加类似 vscode 的图标
            { "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
            { "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
            { "hrsh7th/cmp-nvim-lsp" }, -- 替换内置 omnifunc，获得更多补全
            { "hrsh7th/cmp-path" }, -- 路径补全
            { "hrsh7th/cmp-buffer" }, -- 缓冲区补全
            { "hrsh7th/cmp-cmdline" }, -- 命令补全
            { "f3fora/cmp-spell" }, -- 拼写建议
            { "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
            { "lukas-reineke/cmp-under-comparator" }, -- 让补全结果的排序更加智能
            { "tzachar/cmp-tabnine", build = "./install.sh" } -- tabnine 源,提供基于 AI 的智能补全
        },
        config = function()
            require("conf.nvim-cmp")
        end
    },
    -- 语法高亮
    {
        "nvim-treesitter/nvim-treesitter",
        build = { ":TSupdate" },
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
    -- markdown
    {
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
        { "img-paste-devs/img-paste.vim", },
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
        { "projekt0n/github-nvim-theme", name = 'github-theme', },
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
    -- 全局替换
    {
        "nvim-pack/nvim-spectre",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Lua 开发模块
            "BurntSushi/ripgrep" -- 文字查找
        },
        config = function()
            require("conf.nvim-spectre")
        end
    },
    -- 显示网页色
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("conf.nvim-colorizer")
        end
    },
    {
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers", -- This is the important bit!
        config = function()
            require("conf.neorg")
        end,
    },
    -- -- 快速运行代码片段
    -- {
    -- 	"michaelb/sniprun",
    -- 	build = 'bash ./install.sh',
    -- 	config = function()
    -- 		require("conf.sniprun")
    -- 	end
    -- },
})
