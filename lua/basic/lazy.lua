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
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", },
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
        "mikavilpas/yazi.nvim", opts = {}, event = "VeryLazy",
        keys = { { "<leader>1", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "FileManager", }, },
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
                        ensure_installed = {
                            "lua_ls", "pyright", "clangd", "rust_analyzer", "bashls", "emmet_ls", "html",
                            "jsonls", "yamlls", "gopls", "cssls", "prosemd_lsp", "ts_ls", "ltex",
                        },
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
			-- 改变vimtex的默认按键为,
			vim.g.maplocalleader = ","
			-- vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
		end,
	},
	-- markdown
	{
		-- markdown 文本显示格式
		{
			"MeanderingProgrammer/render-markdown.nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
			opts = {
                render_modes = true,
                pipe_table = { preset = 'round' },
            },
		},
		-- markdown 预览
		{
			"iamcco/markdown-preview.nvim", ft = { "markdown" },
			build = "cd app && npm install",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
		},
		-- markdown 图片插入
        {
            "HakonHarnes/img-clip.nvim", opts = {},
            event = "VeryLazy",
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
	-- 现代化的任务管理系统
	-- {
	-- 	"stevearc/overseer.nvim",
	-- 	opts = {},
	-- 	config = function()
	-- 		require("conf.nvim-overseer")
	-- 	end,
	-- },
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
			"rose-pine/neovim", name = "rose-pine",
			config = function()
				require("conf.rose-pine")
			end,
		},
		{
			-- catppuccin 改个别名，因为它的名字是 nvim，可能会冲突
			"catppuccin/nvim", name = "catppuccin",
			config = function()
				require("conf.catppuccin")
			end,
		},
	},
	-- 一些功能集合
    {
        "folke/snacks.nvim",
		event = "VeryLazy",
        opts = {
            scope = { enabled = true },
            words = { enabled = true },
            -- notify = { enabled = true },
            -- notifier = { enabled = true },
            scroll = { enabled = true },
            animate = { enabled = true },
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            -- styles = { notification = { wo = { wrap = true } } }
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                local sk = Snacks

                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...) sk.debug.inspect(...) end
                _G.bt = function() sk.debug.backtrace() end
                vim.print = _G.dd

                --  打开indent
                sk.indent.enable()
                sk.input.enable()

                -- Create some toggle mappings
                local st = sk.toggle
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
                st.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
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

        keys = {
            -- zen
            { "<leader>z",   function() Snacks.zen() end, desc = "Toggle Zen Mode" },

            -- scratch
            { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
            { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },

            -- notifier
            { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
            { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },

            -- lazygit
            { "<leader>lf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
            { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
            { "<leader>ll", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },

            -- find
            { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
            { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },

            -- git
            { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
            { "<leader>gg", function() Snacks.picker.git_log() end, desc = "Git Log" },

            -- Grep
            { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
            { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
            { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },

            -- search
            { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
            { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
            { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
            { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
            { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
            { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
            { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
            { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
            { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
            { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
            { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
            { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
            { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
            { "<leader>sp", function() Snacks.picker.projects() end, desc = "Projects" },

            -- LSP
            { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
            { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        },
    },

})
