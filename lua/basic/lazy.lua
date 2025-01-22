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
	-- 多光标模式
    { "mg979/vim-visual-multi" },
	-- 自动保存
	{ "Pocco81/auto-save.nvim" },
	-- fzf 搜索工具
	{ "ibhagwan/fzf-lua", opts = {} },
    -- 光标移动时突出显示
    { 'danilamihailov/beacon.nvim' },
	-- 顶部状态栏
    { "romgrk/barbar.nvim", opts = {}, },
    -- 上次编辑的位置
    { "ethanholz/nvim-lastplace", opts = {} },
	-- 查找替换
	{ "MagicDuck/grug-far.nvim", opts = {} },
	-- 底部美丽的状态栏
	{ "nvim-lualine/lualine.nvim", opts = {} },
	-- 键位绑定器
	{ "folke/which-key.nvim", opts = {}, event = "VeryLazy", },
	-- 自动匹配括号
	{ "windwp/nvim-autopairs", opts = {}, event = "InsertEnter", },
	-- 代码格式化
	{
		"stevearc/conform.nvim",
		config = function()
			require("conf.conform")
		end,
	},
	-- 为了能让状态栏显示 git 信息，所以这个插件是必须的
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim", },
		config = function()
			require("conf.gitsigns")
		end,
	},
	-- 精美弹窗
	{
		"rcarriga/nvim-notify",
		config = function()
			require("conf.nvim-notify")
		end,
	},
	-- 快速跳转
	{
		"folke/flash.nvim", opts = {},
		event = "VeryLazy",
        keys = { { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" }, },
	},
	-- 包裹修改
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({ })
        end
    },
	-- 快速的jk
    {
        "rainbowhxch/accelerated-jk.nvim",
        config =function()
            vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
            vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
        end
    },
	-- 美丽的消息通知
	{
		"folke/noice.nvim", opts = {},
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	-- 显示网页色
	{
        'brenoprata10/nvim-highlight-colors',
		config = function()
            require('nvim-highlight-colors').setup({})
		end,
	},
	-- 代码注释
	{
		"numToStr/Comment.nvim",
		config = function()
			require("conf.comment")
		end,
	},
    -- yazi 文件浏览器
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = { { "<leader>1", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "FileManager", }, },
        opts = { open_for_directories = false, },
    },
	-- 内置终端
	{
		"voldikss/vim-floaterm",
		config = function()
			-- 浮动窗口类型
			vim.g.floaterm_wintype = "float"
			-- 在窗口中间显示
			vim.g.floaterm_position = "bottomright"
			-- 终端宽(0,1)
			vim.g.floaterm_width = 0.5
			-- 终端高(0,1)
			vim.g.floaterm_height = 0.6
			-- 终端标题
			vim.g.floaterm_title = "floaterm: $1/$2"
			vim.g.floaterm_autoclose = 2
		end,
	},
    -- lazigit 提交代码到git
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
        -- dependencies = { "nvim-lua/plenary.nvim", },
        keys = {
            { "<leader>sg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
    },
	-- 一些功能集合
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			indent = { enabled = true }, -- 开启缩进线
			input = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			-- scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},
    -- LSP 系列插件
    {
        -- LSP UI 美化
        { "nvimdev/lspsaga.nvim", opts = {}, },
        -- LSP 基础服务
        {
            "neovim/nvim-lspconfig",
            dependencies = { "saghen/blink.cmp" },
            config = function()
                require("conf.nvim-lspconfig")
            end,
        },
        -- mason 自动安装相关的包
        {
            -- mason 自动安装 LSP 的工具，否则需要手动用npm安装包
            { "williamboman/mason.nvim", opts = {}, },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup({
                        ensure_installed = { "lua_ls", "pyright", "clangd", "rust_analyzer", "bashls", "emmet_ls", "html", "jsonls", "yamlls", "gopls", "cssls", "prosemd_lsp", "ts_ls", "ltex", },
                    })
                end,
            },
        },
        -- blink.cmp 替代nvim.cmp
        {
            "saghen/blink.cmp", version = "*",
            dependencies = "rafamadriz/friendly-snippets",
            opts = {
                keymap = {
                    preset = "enter",
                    ["<Up>"] = { "select_prev", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "fallback" },
                    ["<C-p>"] = { "select_prev", "fallback" },
                    ["<Down"] = { "select_next", "fallback" },
                    ["<Tab>"] = { "select_next", "fallback" },
                    ["<C-n>"] = { "select_next", "fallback" },

                    ["<C-e>"] = { "hide" },
                    ["<C-y>"] = { "select_and_accept" },

                    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

                    -- ['<Tab>']     = { 'snippet_forward', 'fallback' },
                    -- ['<S-Tab>']   = { 'snippet_backward', 'fallback' },
                    ["<C-tab>"] = { "show", "show_documentation", "hide_documentation" },
                },

                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "mono",
                },

                sources = {
                    default = { "lsp", "path", "snippets", "buffer", "markdown" },
                    -- 默认关掉cmdline，否则命令行输入时候会很多干扰
                    cmdline = {},
                    providers = {
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
		"nvim-treesitter/nvim-treesitter", build = { ":TSUpdate" },
		config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "cpp", "lua", "vim", "html", "rust", "python", "go", "markdown", "markdown_inline", "bash", "diff", "ini", "json", "sql", "yaml", "vimdoc", "toml", "regex" },
                sync_install = false,
                indent = { enable = true },
                highlight = {
                    enable = true,
                    -- 使用 treesitter 高亮而不是 neovim 内置的高亮
                    additional_vim_regex_highlighting = false
                },
            })
		end,
	},
	-- latex 支持
	{
		"lervag/vimtex", opt = true, ft = "tex",
		config = function()
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_view_general_viewer = "zathura"
			-- 设置neovim-remote
			vim.g.vimtex_compiler_progname = "nvr"
			vim.g.vimtex_compiler_latexmk_engines = { _ = "-pdflatex" }
			-- 不拼写检查
			vim.g.tex_comment_nospell = 1
			-- 忽略警告
			vim.g.vimtex_quickfix_open_on_warning = 0
			-- 关闭编译报错自动弹出错误窗口
			vim.g.vimtex_quickfix_mode = 0
			-- vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
			-- 改变vimtex的默认按键为,
			vim.g.maplocalleader = ","
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
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
		},
		-- markdown 图片插入
        {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = { },
            keys = { { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste Image" }, },
        },
        -- nvim 预览markdown中的图片
        -- {
        --     "3rd/image.nvim", opts = {},
        --     config = function()
        --         require("conf.images")
        --     end
        -- },
	},
	-- 运行代码的任务系统
	{
		-- asyncrun 编译代码
		{ "skywind3000/asyncrun.vim" },
		-- tasks 任务系统
		{ "skywind3000/asynctasks.vim" },
	},
	-- 现代化的任务管理系统
	-- {
	-- 	"stevearc/overseer.nvim",
	-- 	opts = {},
	-- 	config = function()
	-- 		require("conf.nvim-overseer")
	-- 	end,
	-- },
	-- 主题颜色
	{
		{
			-- 优秀的暗色主题
			"rose-pine/neovim",
			name = "rose-pine",
			config = function()
				require("conf.rose-pine")
			end,
		},
		{
			-- catppuccin 颜色
			"catppuccin/nvim",
			-- 改个别名，因为它的名字是 nvim，可能会冲突
			name = "catppuccin",
			config = function()
				require("conf.catppuccin")
			end,
		},
	},
})
