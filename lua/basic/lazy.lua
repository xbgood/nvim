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
	-- 灯泡提示代码行为
	{ "kosayoda/nvim-lightbulb" },
	-- 为状态栏提供上下文信息
	{ "SmiteshP/nvim-gps" },
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
	-- 查找替换
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({
				-- options, see Configuration section below
				-- engine = 'ripgrep' is default, but 'astgrep' can be specified
				engine = "ripgrep",
			})
		end,
	},
	-- fzf 搜索工具
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		dependencies = { "echasnovski/mini.icons" },
		opts = {},
	},
	-- 问题显示插件
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
	-- 格式化
	{
		"stevearc/conform.nvim",
		config = function()
			require("conf.conform")
		end,
	},
	-- nvim-tree
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			-- 依赖一个图标插件
			"kyazdani42/nvim-web-devicons",
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
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("conf.gitsigns")
		end,
	},
	-- 支持 LSP 状态的 buffer 栏
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"famiu/bufdelete.nvim", -- 删除 buffer 时不影响现有布局
		},
		config = function()
			require("conf.bufferline")
		end,
	},
	-- 美丽的状态栏
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("conf.nvim-lualine")
		end,
	},
	-- 搜索时显示条目
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()
		end,
	},
	-- 自动匹配括号
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "vim" },
			})
		end,
	},
	-- 快速跳转
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		config = function()
			require("conf.nvim-flash")
		end,
	},
	-- 一些功能集合
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here or leave it empty to use the default settings refer to the configuration section below
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
		end,
	},
	-- 自动保存
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("conf.auto-save")
		end,
	},
	-- 自动恢复光标位置
	{
		"ethanholz/nvim-lastplace",
		config = function()
			require("conf.nvim-lastplace")
		end,
	},
	-- 精美弹窗
	{
		"rcarriga/nvim-notify",
		config = function()
			require("conf.nvim-notify")
		end,
	},
	-- todo tree
	{
		"folke/todo-comments.nvim",
		config = function()
			require("conf.todo-comments")
		end,
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
			"rcarriga/nvim-notify",
		},
	},
	-- LSP 基础服务
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			require("conf.nvim-lspconfig")
		end,
	},
	-- 自动安装 LSP
	{
		"williamboman/mason.nvim",
		config = function()
			require("conf.mason")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("conf.mason-lspconfig")
		end,
	},
	-- LSP UI 美化
	{
		"kkharji/lspsaga.nvim",
		config = function()
			require("conf.lspsaga")
		end,
	},
	-- LSP 进度提示
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("fidget").setup({
				window = { blend = 0 },
			})
		end,
	},
	-- blink.cmp 替代nvim.cmp
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
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
				default = { "lsp", "path", "snippets", "buffer" },
				-- 默认关掉cmdline，否则命令行输入时候会很多干扰
				cmdline = {},
			},

			-- 实验性质的功能
			signature = { enabled = true },
		},
	},
	-- 插入模式获得函数签名
	{
		"ray-x/lsp_signature.nvim",
		name = "lsp-signature",
		config = function()
			require("conf.lsp-signature")
		end,
	},
	-- 语法高亮
	{
		"nvim-treesitter/nvim-treesitter",
		build = { ":TSUpdate" },
		dependencies = {
			"p00f/nvim-ts-rainbow", -- 彩虹括号
		},
		config = function()
			require("conf.nvim-treesitter")
		end,
	},
	-- 代码注释
	{
		"numToStr/Comment.nvim",
		config = function()
			require("conf.comment")
		end,
	},
	-- 为不支持 LSP 高亮的主题提供默认高亮方案
	{
		"folke/lsp-colors.nvim",
		config = function()
			require("conf.lsp-colors")
		end,
	},
	-- 函数树
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("conf.symbols-outline")
		end,
	},
	-- latex 支持
	{
		"lervag/vimtex",
		opt = true,
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
		ft = "tex",
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
			opts = {},
		},
		-- markdown preview
		{
			"iamcco/markdown-preview.nvim",
			ft = "markdown",
			build = "cd app && npm install",
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
		},
		-- vim markdown
		{ "preservim/vim-markdown" },
		-- markdown image paste
		{
			-- markdown preview
			"img-paste-devs/img-paste.vim",
			config = function()
				vim.g.mkdp_auto_start = 1
				vim.g.mkdp_auto_close = 1
				vim.g.mkdp_theme = "light" --light/dark
				vim.g.mdip_imgdir = "assets/images"
				vim.g.mkdp_browser = "firefox"
			end,
		},
		-- markdown table
		--{ "dhruvasagar/vim-table-mode", },
		-- markdown org
		--{ "demonlord1997/markdown-org", },
	},
	-- 快速的jk
	{
		"PHSix/faster.nvim",
		event = { "VimEnter *" },
		config = function()
			vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_j)", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_k)", { noremap = false, silent = true })
			-- if you need map in visual mode
			vim.api.nvim_set_keymap("v", "j", "<Plug>(faster_vmove_j)", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("v", "k", "<Plug>(faster_vmove_k)", { noremap = false, silent = true })
		end,
	},
	-- 运行代码的任务系统
	{
		-- asyncrun 编译代码
		{ "skywind3000/asyncrun.vim" },
		-- tasks 任务系统
		{ "skywind3000/asynctasks.vim" },
	},
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
		end,
	},
})
