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
	-- 快速的jkhl
    { "xiyaowong/fast-cursor-move.nvim" },
    -- 只要修改来就会自动保存
    { "pocco81/auto-save.nvim",   opts = {} },
    -- Breadcrumbs: 顶部展示层级关系
    { "Bekaboo/dropbar.nvim",     opts = {} },
    -- 上次编辑的位置
    { "ethanholz/nvim-lastplace", opts = {} },
    -- 查找替换
    { "MagicDuck/grug-far.nvim",  opts = {} },
	-- 快速跳转
	{ "folke/flash.nvim",       event = "VeryLazy",    opts = {} },
	-- 代码注释
	{ "numToStr/Comment.nvim",  event = "VeryLazy",    opts = {} },
	-- 包裹修改
	{ "kylechui/nvim-surround", event = "VeryLazy",    opts = {} },
	-- 自动匹配括号
    { "windwp/nvim-autopairs",  event = "InsertEnter", opts = {} },
    -- 文本对齐
    {
        "junegunn/vim-easy-align",
        keys = {
            { mode={'x','v','n'}, 'ga', '<Plug>(EasyAlign)', desc='EasyAlign Section' }
        }
    },
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
		event = "VeryLazy",
		config = function()
			require("conf.multicursor")
		end,
	},
	-- 翻译软件
	{
		"SilverofLight/kd_translate.nvim",
		config = function()
			require("kd").setup({
				window = { height = 20, width = 70 },
			})
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
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("conf.nvim-gitsigns")
		end,
	},
	-- latex 支持
	{
		"lervag/vimtex",
		event = "VeryLazy",
		ft = { "latex", "tex" },
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
	-- 内置终端
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		opts = {
			-- 快捷键
			open_mapping = [[<C-/>]],
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
	-- 格式化插件 conform
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {
			-- checkhealth conform
			formatters_by_ft = {
				cpp      = { "clang-format" },  -- mason 手动安装
				tex      = { "tex-fmt" },       -- mason 手动安装
				markdown = { "mdformat" }, -- mason 手动安装
				c        = { "clang-format" },
				lua      = { "stylua" },
				python   = { "black" },
				rust     = { "rustfmt", lsp_format = "fallback" },
				sh       = { "shfmt" },
				toml     = { "taplo" },
			},
		},
	},
	-- 跳出括号和引号
	{
		"abecodes/tabout.nvim",
		lazy = false,
		opt = true,
		event = "InsertCharPre", -- 插入模式才加载
		priority = 1000,
		config = function()
			require("tabout").setup({
				-- 跳出到括号右边
				tabkey = "<Tab>",
				-- 反向跳到括号左边
				backwards_tabkey = "<S-Tab>",
				act_as_tab = true, -- 不能跳就tab
				act_as_shift_tab = false, -- 不能跳反向缩进
				enable_backwards = true, -- 允许shift-tab往回跳
				completion = false,      -- 补全菜单是关闭tabout
				-- 需要跳出的括号
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
					{ open = "<", close = ">" },
				},
				ignore_beginning = true, -- 光标前是单词字符时不跳出（防误跳）
				exclude = {}, -- 文件类型黑名单
			})
		end,
	},
	-- 语法高亮
	{
		"nvim-treesitter/nvim-treesitter",
        lazy = false,
		build = { ":TSUpdate" },
		config = function()
			require("nvim-treesitter.configs").setup({
				-- 只有首次打开的文件没有安装模块才会自动安装
				auto_install = false,
				sync_install = false,
				ensure_installed = {
                    'c', 'cpp', 'rust', 'bash', 'toml', 'html', 'diff', 'cmake', 'python', 'make', 'go',
                    'latex', 'bibtex', 'markdown', 'lua', 'markdown_inline', 'vimdoc', 'yaml' }
			})
		end,
	},
	-- LSP 系列插件
	{
		-- LSP 基础服务
		{
			"neovim/nvim-lspconfig",
			dependencies = { "saghen/blink.cmp" },
			config = function()
				require("conf.lspconfig")
			end,
		},
		-- mason 自动安装 LSP 的工具，否则需要手动用npm安装包
		{
			"williamboman/mason.nvim",
			opts = {},
		},
		-- mason-lspconfig 关联lsp
		{
			-- 说明： mason的包在ensure_installed 中不一定能用，需要在mason中按i手动安装
			"williamboman/mason-lspconfig.nvim",
			event = "VeryLazy",
			config = function()
				require("mason-lspconfig").setup({
					automatic_installation = false,
					ensure_installed = {
						"html", "cssls", "ts_ls", "lua_ls", "clangd", "bashls", "jsonls", "yamlls",
                        "asm_lsp", "pyright", "emmet_ls", "texlab", "marksman", -- "rust_analyzer",
					},
				})
			end,
		},
		-- blink.cmp 替代nvim.cmp
		{
			"saghen/blink.cmp",
			version = "*",
			dependencies = {
				"rafamadriz/friendly-snippets",
				-- 英文字典补全
				"Kaiser-Yang/blink-cmp-dictionary",
			},
			opts = {
				keymap = {
					preset    = "enter",
					["<CR>"]  = { "accept", "fallback" },

					["<Up>"]  = { "select_prev", "fallback" },
					["<Down"] = { "select_next", "fallback" },
					["<C-p>"] = { "select_prev", "fallback" },
					["<C-n>"] = { "select_next", "fallback" },

					["<C-e>"] = { "hide", "fallback" },
					["<C-y>"] = { "select_and_accept", "fallback" },

					["<C-b>"] = { "scroll_documentation_up", "fallback" },
					["<C-f>"] = { "scroll_documentation_down", "fallback" },

					["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
					["<S-Tab>"]   = { "select_prev", "snippet_backward", "fallback" },
					["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				},

				appearance = {
					use_nvim_cmp_as_default = false,
					nerd_font_variant = "mono",
				},

				cmdline = {
					-- keymap = { ['<Tab>'] = { 'show', 'accept' }, },
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
					trigger = { show_on_keyword = true },
					list = {
						selection = {
							-- 这两个选项互斥的，预选模式会自动选择第一个
							-- 插入模式不会自动选，只有按tab后才会选择第一个
							auto_insert = false,
							preselect = true,
						},
					},
					menu = {
						draw = {
							treesitter = { "lsp" },
							columns = {
								{ "kind_icon", "label", "label_description", "source_name", "kind", gap = 1 },
							},
						},
					},
				},

				sources = {
					default = { "lsp", "path", "snippets", "buffer", "dictionary" },
					providers = {
						snippets = { opts = { friendly_snippets = true } },
						lsp = {
							name = "LSP",
							module = "blink.cmp.sources.lsp",
							opts = {},
							enabled = true,
							async = false,
						},
						-- 英文字典补全
						dictionary = {
							module = "blink-cmp-dictionary",
							name = "Dict",
							async = true,
							min_keyword_length = 3,
							-- 优先级设置较小
							score_offset = -20,
							-- 最多提供5个单词补全
							max_items = 8,
							opts = {
								-- 需要安装words词典
								dictionary_files = { vim.fn.expand("/usr/share/dict/american-english") },
								max_items = 5,
							},
						},
					},
				},
				-- signature 帮助
				signature = { enabled = true },
			},
		},
	},
	-- markdown
	{
		-- markdown 图片插入
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			ft = { "markdown" },
			opts = {},
		},
		-- markdown 文本显示格式
		{
			"MeanderingProgrammer/render-markdown.nvim",
			event = "VeryLazy",
			ft = { "markdown" },
			opts = {
				debounce = 0,
				latex = { enabled = false },
				sign = { enabled = false },
				code = {
					sign = false,
					width = "block",
					min_width = 780,
					border = "thin",
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
			event = "VeryLazy",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		},
	},
	-- dap调试代码
	{
		-- 提供基本的dap支持
		{
			"mfussenegger/nvim-dap",
			event = "VeryLazy",
			config = function()
				require("conf.nvim-dap")
			end,
		},
		-- 提供类似VSCode的调试界面
		{
			"rcarriga/nvim-dap-ui",
			event = "VeryLazy",
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
			event = "VeryLazy",
			opts = {
				virt_text_pos = "eol", -- eol 在行尾显示，inline 在变量定义处显示
			},
		},
	},
	-- 一些功能集合
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- 输入工具，替换系统的vim.ui.input
			input   = { enabled = true },
			-- 自动把光标所在的单词在文件中高亮出来
			words   = { enabled = true },
			-- 负责接受notify数据
			notify  = { enabled = true },
			-- 层级指示线
			indent  = { enabled = true },
			-- 平滑滚动
			scroll  = { enabled = true },
			-- 动画引擎
			animate = { enabled = true },
			-- lazygit 插件
			lazygit = { enabled = true },
			-- 快速打开大文件，抢先加载
			quickfile = { enabled = true },
			-- bdelete 关闭窗口不影响布局
			bufdelete = { enabled = true },
			-- 大文件优化，禁用耗时的功能
			bigfile = {
				notify = true,
				enabled = true,
				size = 1025 * 1024,
			},
			-- 检索工具
			picker = {
				enabled = true,
				sources = {
					files = { cmd = "fd" },
					grep = { cmd = "rg" },
				},
			},
			-- 文件浏览器
			explorer = {
				enabled = true,
				-- 替代默认的netrw
				replace_netrw = true,
			},
			-- 替换系统的vim.notify，用于展示notify
			notifier = {
				enabled = true,
				-- 不压缩内容
				concat = false,
				-- 从顶部显示？
				-- top_down = false,
			},
			-- 各个模块的样式控制代码
			styles = {
				notification = {
					-- notifier 文本过长时换行
					wo = { wrap = true },
				},
			},
			win = {
				style = "picker",
				relative = "editor",
			},
			-- 开启默认窗口
			dashboard = {
				enabled = true,
				formats = {
					key = function(item)
						return {
							{ "[", hl      = "special" },
							{ item.key, hl = "key" },
							{ "]", hl      = "special" },
						}
					end,
				},
				sections = {
					{ title   = "MRU", padding        = 1 },
					{ section = "recent_files", limit = 8, padding = 1 },
					{ title   = "Sessions", padding   = 1 },
					{ section = "projects", padding   = 1 },
					{ title   = "Bookmarks", padding  = 1 },
					{ section = "keys" },
				},
			},
			-- snacks的终端
			-- terminal = {
			-- 	-- 关闭终端terminal
			-- enabled = false,
			-- 	win = {
			-- 		style = "float",
			-- 		height = 0.4,
			-- 		width = 0.8,
			-- 		border = "rounded",
			-- 		title = "Terminal",
			-- 		title_pos = "center",
			-- 		winblend = 10,
			-- 	},
			-- },
			-- 关闭，写代码干扰大
			-- statuscolumn = { enabled = false },
			-- 代码块范围计算
			-- scope = { enabled = false },
			-- 专注模式，自动淡化背景
			-- dim = { enabled = false },
			-- 聚焦写作
			-- zen = { enabled = false },
			-- 图片预览
			-- image = { enabled = true },
		},
	},
	-- 主题颜色
	{
		{ "rose-pine/neovim", name = "rosepine",   opts = { styles = { transparency = false } } },
		{ "catppuccin/nvim",  name = "catppuccin", opts = { transparent_background = false } },
		{ "folke/tokyonight.nvim",  opts = { transparent = false } },
		{ "EdenEast/nightfox.nvim", opts = { options = { transparent = false } } },
        { "sainnhe/everforest", config = function () vim.g.everforest_transparent_background = 0 end },
        { "sainnhe/gruvbox-material" }, { "sainnhe/edge" }, { "sainnhe/sonokai" },
	},
	-- venn.nvim -- 在nvim中用ascii画图
	-- nvim-toggler 在nvim中将yes/no或者true/false这种快速翻转的插件，类似vim的switch
})
