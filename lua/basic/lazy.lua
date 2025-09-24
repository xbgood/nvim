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
	{
		"Pocco81/auto-save.nvim",
	},
	-- 快速的jk
	{
		"rainbowhxch/accelerated-jk.nvim",
	},
	-- 光标移动时突出显示
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
	-- 显示网页色
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {},
	},
	-- 上次编辑的位置
	{
		"ethanholz/nvim-lastplace",
		opts = {},
	},
	-- 查找替换
	{
		"MagicDuck/grug-far.nvim",
		opts = {},
	},
	-- 美丽的消息通知
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
	},
	-- 快速跳转
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
	},
	-- yazi 文件浏览器
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		opts = {},
	},
	-- 自动匹配括号
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	-- 包裹修改
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},
	-- 顶部状态栏
	{
		"romgrk/barbar.nvim",
		event = "BufReadPost",
		opts = {},
	},
	-- 底部美丽的状态栏
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			globalstatus = true,
			refresh = 1000,
		},
	},
	-- 扩展的文本对象
	{
		"chrisgrieser/nvim-various-textobjs",
		lazy = false,
		opts = {
			keymaps = {
				useDefaults = true,
			},
		},
	},
	-- 键位绑定器
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			icons = { separator = "" },
		},
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
	-- 代码注释
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
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
		event = "VeryLazy",
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
	-- 格式化插件 conform
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
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
	-- 跳出括号和引号
	{
		"abecodes/tabout.nvim",
		lazy = false,
		opt = true, -- Set this to true if the plugin is optional
		event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
		priority = 1000,
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>",
				backwards_tabkey = "<S-Tab>",
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
				default_shift_tab = "<C-d>", -- reverse shift default action,
				enable_backwards = true, -- well ...
				completion = false, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
					{ open = "<", close = ">" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
	},
	-- LSP 系列插件
	{
		-- LSP UI 美化
		-- {
		-- 	"nvimdev/lspsaga.nvim",
		-- 	event = "VeryLazy",
		-- 	opts = {
		-- 		extend_gitsigns = true,
		-- 	},
		-- },
		-- LSP 基础服务
		{
			"neovim/nvim-lspconfig",
			dependencies = { "saghen/blink.cmp" },
			config = function()
				require("conf.lspconfig")
			end,
		},
		-- mason 自动安装 LSP 的工具，否则需要手动用npm安装包
		{ "williamboman/mason.nvim", opts = {} },
		-- mason 自动安装相关的包
		{
			-- 说明： mason的包在ensure_installed 中不一定能用，需要在mason中按i手动安装
			"williamboman/mason-lspconfig.nvim",
			event = "VeryLazy",
			config = function()
				require("mason-lspconfig").setup({
					automatic_installation = false,
					ensure_installed = {
						"html",
						"cssls",
						"ts_ls",
						"lua_ls",
						"clangd",
						"bashls",
						"jsonls",
						"yamlls",
						"asm_lsp",
						"pyright",
						"emmet_ls",
						"rust_analyzer",
						"texlab", -- latex 格式化软件
						"marksman", -- markdown 格式化软件
						"ast_grep", -- 像gren一样检索，不过是用语法而非文本
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
					-- keymap = {
					--     ['<Tab>'] = { 'show', 'accept' },
					-- },
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
					ghost_text = {
						enabled = true,
					},
					trigger = {
						show_on_keyword = true,
					},
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
								{ "kind_icon", "label", "label_description", "source_name", "kind", gap = 1 },
							},
						},
					},
				},

				sources = {
					default = { "lsp", "path", "snippets", "buffer", "dictionary" },

					providers = {
						snippets = {
							opts = {
								friendly_snippets = true,
							},
						},
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
				-- 只有首次打开的文件没有安装模块才会自动安装
				auto_install = true,
				sync_install = false,
				ensure_installed = {},
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
			input = { enabled = true },
			picker = { enabled = true },
			scope = { enabled = false },
			words = { enabled = false },
			notify = { enabled = true },
			notifier = { enabled = true },
			scroll = { enabled = true },
			animate = { enabled = true },
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = false }, -- 关闭，写代码干扰大
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
					local snacks = require("snacks")
					local st = snacks.toggle

					_G.dd = function(...)
						snacks.debug.inspect(...)
					end
					_G.bt = function()
						snacks.debug.backtrace()
					end

					vim.print = _G.dd
					--  打开indent
					snacks.indent.enable()
					-- 打开 input
					snacks.input.enable()

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
    -- venn.nvim -- 在nvim中用ascii画图
    -- nvim-toggler 在nvim中将yes/no或者true/false这种快速翻转的插件，类似vim的switch
})
