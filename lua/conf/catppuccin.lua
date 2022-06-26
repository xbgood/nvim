-- https://github.com/catppuccin/nvim

require("catppuccin").setup(
    {
        -- 透明背景
        -- transparent_background = vim.g.background_transparency,
        transparent_background = true,
        -- 使用终端背景色
        term_color = false,
        -- 代码样式
        styles = {
            comments = "italic",
            conditions = "italic",
            loops = "NONE",
            functions = "BOLD",
            keywords = "NONE",
            strings = "NONE",
            variables = "NONE",
            numbers = "NONE",
            booleans = "NONE",
            properties = "NONE",
            types = "NONE",
            operators = "NONE",
        },
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
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = "italic",
                    hints = "italic",
                    warnings = "italic",
                    information = "italic"
                },
                underlines = {
                    errors = "underline",
                    hints = "underline",
                    warnings = "underline",
                    information = "underline"
                }
            },
            -- 后面我们自己会手动设置
            lsp_saga = false,
            lsp_trouble = false,
            dashboard = true,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            lightspeed = false,
            telekasten = true,
        }
    }
)

-- 应用主题
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd([[colorscheme catppuccin]])
