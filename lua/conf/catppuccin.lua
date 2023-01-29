-- https://github.com/catppuccin/nvim

require("catppuccin").setup({
	{
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = {
			light = "latte",
			dark = "mocha",
		},
		transparent_background = true,
		-- 使用终端背景色
		term_color = false,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		no_italic = false,
		no_bold = false,
		-- 代码样式
		styles = {
			comments = { "italic" },
			conditions = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_override = {},
		custom_highlights = {},
		-- 为不同的插件统一样式风格
		-- 尽管这里有一些插件还没有安装，但是先将它们
		-- 设置为 true 并不影响
		integrations = {
			cmp = true,
			gitsigns = true,
			gitgutter = false,
			telescope = true,
			which_key = true,
			bufferline = true,
			markdown = true,
			dashboard = true,
			fidget = true,
			ts_rainbow = true,
			hop = true,
			notify = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false
			},
			nvimtree = {
				enabled = true,
				show_root = false,
				-- 透明背景
				transparent_panel = false,
			},
			neotree = {
				enabled = false,
				show_root = false,
				transparent_panel = false,
			},
			lsp_saga = false,
			lsp_trouble = false,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			lightspeed = false,
			telekasten = false,
			aerial = false,
			beacon = false,
			coc_nvim = false,
			harpoon = false,
			illuminate = false,
			leap = true,
			mason = true,
			mini = false,
			neotest = false,
			noice = false,
			overseer = false,
			pounce = false,
			semantic_tokens = false,
			symbols_outline = false,
			treesitter = true,
			treesitter_context = true,
			vimwiki = false,
			-- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
			dap = {
				enabled = true,
				enable_ui = true,
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			navic = {
				enabled = false,
				custom_bg = "NONE",
			},
		}
	}
})
