-- lazy插件管理
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- 自动保存
	{ "Pocco81/auto-save.nvim" },
	-- 快速的jk
	{ "rainbowhxch/accelerated-jk.nvim" },
	-- 光标移动时突出显示
	{ "sphamba/smear-cursor.nvim", opts = {} },
	-- 显示网页色
	{ "brenoprata10/nvim-highlight-colors", opts = {} },
	-- 顶部状态栏
	{ "romgrk/barbar.nvim", opts = {} },
	-- 上次编辑的位置
	{ "ethanholz/nvim-lastplace", opts = {} },
	-- 查找替换
	{ "MagicDuck/grug-far.nvim", opts = {} },
	-- 底部美丽的状态栏
	{ "nvim-lualine/lualine.nvim", opts = {} },
	-- 美丽的消息通知
	-- 问题是经常性底部弹出7行关不掉
	-- { "folke/noice.nvim",                   opts = {}, event = "VeryLazy" },
	-- 快速跳转
	{ "folke/flash.nvim", opts = {}, event = "VeryLazy" },
	-- yazi 文件浏览器
	{ "mikavilpas/yazi.nvim", opts = {}, event = "VeryLazy" },
	-- 自动匹配括号
	{ "windwp/nvim-autopairs", opts = {}, event = "InsertEnter" },
	-- 包裹修改
	{ "kylechui/nvim-surround", opts = {}, event = "VeryLazy" },
	-- 扩展的文本对象
	{
		"chrisgrieser/nvim-various-textobjs",
		lazy = false,
		opts = { keymaps = { useDefaults = true } },
	},
	-- 键位绑定器
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = { icons = { separator = "" } },
	},
	-- 多光标模式
	-- { "mg979/vim-visual-multi" },
	{
		"jake-stewart/multicursor.nvim",
		config = function()
			require("conf.multicursor")
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
	-- 为了能让状态栏显示 git 信息，所以这个插件是必须的
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("conf.nvim-gitsigns")
		end,
	},
	-- latex 支持
	{
		"lervag/vimtex",
		lazy = false,
		-- 快捷键：
		-- ll 编译文件 lv 查看pdf文档
		-- li 文件信息、lt 打开目录、li 查看插入模式下定义的映射、K 查看宏包信息。按 q 关闭
		init = function()
			vim.g.maplocalleader = ","
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "pdflatex"
			-- 不拼写检查
			-- vim.g.tex_comment_nospell = 1
			-- 忽略警告
			-- vim.g.vimtex_quickfix_open_on_warning = 0
			-- 关闭编译报错自动弹出错误窗口
			-- vim.g.vimtex_quickfix_mode = 1
		end,
	},
	-- 代码注释
	{
		"numToStr/Comment.nvim",
		opts = {
			padding = true,
			sticky = true,
			ignore = nil,
			toggler = {
				line = "gcc", -- 切换行注释
				block = "gbc", --- 切换块注释
			},
			opleader = {
				line = "gc", -- 可视模式下的行注释
				block = "gb", -- 可视模式下的块注释
			},
			extra = {
				above = "gcO", -- 在当前行上方新增行注释
				below = "gco", -- 在当前行下方新增行注释
				eol = "gcA", -- 在当前行行尾新增行注释
			},
			mappings = {
				basic = true,
				extra = true,
			},
			pre_hook = nil,
			post_hook = nil,
		},
	},
	-- 内置终端
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<C-t>]], -- 快捷键
			direction = "float",
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
				relative = "editor",
				border = "curved",
				width = 80,
				height = 20,
				row = 100,
				col = 200,
				winblend = 3,
				title_pos = "left",
				zindex = 10,
			},

			winbar = {
				enabled = true,
				name_formatter = function(term)
					return term.name
				end,
			},
		},
	},
	-- LSP 系列插件
	{
		-- LSP UI 美化
		{ "nvimdev/lspsaga.nvim", opts = { extend_gitsigns = true } },
		-- LSP 基础服务
		{
			"neovim/nvim-lspconfig",
			dependencies = { "saghen/blink.cmp" },
			config = function()
				require("conf.lspconfig")
			end,
		},
		{
			"stevearc/conform.nvim",
			opts = {
				-- checkhealth conform
				formatters_by_ft = {
					cpp = { "clang-format" }, -- mason 手动安装
					tex = { "tex-fmt" }, -- mason 手动安装
					markdown = { "mdformat" }, -- mason 手动安装
					c = { "clang-format" },
					lua = { "stylua" },
					python = { "black" },
					rust = { "rustfmt", lsp_format = "fallback" },
					sh = { "shfmt" },
					toml = { "taplo" },
				},
			},
		},
		-- mason 自动安装相关的包
		{ -- 说明： mason的包在ensure_installed 中不一定能用，需要在mason中按i手动安装
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					-- mason 自动安装 LSP 的工具，否则需要手动用npm安装包
					{ "williamboman/mason.nvim", opts = {} },
				},
				config = function()
					require("mason-lspconfig").setup({
						ensure_installed = {
							"html",
							"cssls",
							"ts_ls",
							"lua_ls",
							"clangd",
							"bashls",
							"jsonls",
							"yamlls",
							"texlab", -- latex 格式化软件
							"asm_lsp",
							"pyright",
							"marksman", -- markdown 格式化软件
							"ast_grep", -- 像gren一样检索，不过是用语法而非文本
							"emmet_ls",
							"rust_analyzer",
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
					preset = "enter",
					["<S-Tab>"] = { "select_prev", "fallback" },
					["<C-p>"] = { "select_prev", "fallback" },
					["<Up>"] = { "select_prev", "fallback" },
					["<Down"] = { "select_next", "fallback" },
					["<Tab>"] = { "select_next", "fallback" },
					["<C-n>"] = { "select_next", "fallback" },

					["<C-e>"] = { "hide" },
					["<C-y>"] = { "select_and_accept" },
					["<C-b>"] = { "scroll_documentation_up", "fallback" },
					["<C-f>"] = { "scroll_documentation_down", "fallback" },
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
					},
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
							treesitter = { "lsp" },
							columns = {
								{ "label", "label_description", gap = 1 },
								{
									"kind_icon", -- 图标
									-- "kind", -- 类型，文本提示
								},
							},
						},
					},
				},

				sources = {
					default = { "lsp", "path", "snippets", "buffer" },

					providers = {
						lsp = {
							name = "LSP",
							module = "blink.cmp.sources.lsp",
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
					"c",
					"cpp",
					"lua",
					"vim",
					"html",
					"rust",
					"python",
					"go",
					"markdown",
					"markdown_inline",
					"bash",
					"diff",
					"ini",
					"json",
					"sql",
					"yaml",
					"vimdoc",
					"toml",
					"regex",
				},
				highlight = {
					enable = true,
					-- 使用 treesitter 高亮而不是 neovim 内置的高亮
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	-- markdown
	{
		-- markdown 图片插入
		{ "HakonHarnes/img-clip.nvim", opts = {}, event = "VeryLazy" },
		-- markdown 文本显示格式
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				debounce = 0,
				latex = { enabled = false },
				sign = { enabled = false },
				code = {
					sign = false,
					width = "block",
					min_width = 80,
					border = "thin",
					left_pad = 1,
					right_pad = 1,
				},
				heading = {
					border = true,
					-- 插入模式保持渲染效果
					render_modes = true,
					-- 对齐
					position = "inline",
				},
				-- anti_conceal = {
				--     disabled_modes = { 'n' },
				--     ignore = {
				--         bullet = true,
				--         head_border = true,
				--         head_background = true,
				--     }
				-- },
				completions = {
					blink = { enabled = true },
					lsp = { enabled = true },
				},
			},
		},
		-- markdown 预览
		{
			"iamcco/markdown-preview.nvim",
			build = "cd app && bash install.sh",
			ft = { "markdown" },
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		},
	},
	-- dap调试代码
	{
		-- 提供基本的dap支持
		{
			"mfussenegger/nvim-dap",
			config = function()
				require("conf.nvim-dap")
			end,
		},
		-- 提供类似VSCode的调试界面
		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
				"mfussenegger/nvim-dap",
				"nvim-neotest/nvim-nio",
			},
			config = function()
				require("conf.nvim-dapui")
			end,
		},
		-- 在调试的代码附近用虚显的文件显示变量信息
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {
				virt_text_pos = "eol", -- eol 在行尾显示，inline 在变量定义处显示
			},
		},
	},
	-- 一些功能集合
	{
		"folke/snacks.nvim",
		-- event = "VeryLazy",
		priority = 1000,
		lazy = false,
		opts = {
			input = { enabled = true },
			picker = { enabled = true },
			scope = { enabled = true },
			words = { enabled = true },
			notify = { enabled = true },
			notifier = { enabled = true },
			scroll = { enabled = true },
			animate = { enabled = true },
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = false },
			styles = { notification = { wo = { wrap = true } } },
			explorer = { enabled = true, replace_netrw = true },
			image = { enabled = true },
			dashboard = {
				formats = {
					key = function(item)
						return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
					end,
				},
				sections = {
					{ title = "MRU", padding = 1 },
					{ section = "recent_files", limit = 8, padding = 1 },
					{ title = "Sessions", padding = 1 },
					{ section = "projects", padding = 1 },
					{ title = "Bookmarks", padding = 1 },
					{ section = "keys" },
				},
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						require("snacks").debug.inspect(...)
					end
					_G.bt = function()
						require("snacks").debug.backtrace()
					end
					vim.print = _G.dd

					--  打开indent
					require("snacks").indent.enable()
					require("snacks").input.enable()

					-- Create some toggle mappings
					local st = require("snacks").toggle
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
					st.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>uc")
					-- 切换开关 treesitter 配色
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
		{
			"rose-pine/neovim",
			name = "rosepine",
			config = function()
				require("conf.rose-pine")
			end,
		},
		{ "catppuccin/nvim", name = "catppuccin" },
		{ "EdenEast/nightfox.nvim", name = "nightfox" },
		{ "sainnhe/everforest", name = "everforest" },
		{ "folke/tokyonight.nvim", name = "tokyonight" },
	},
})
