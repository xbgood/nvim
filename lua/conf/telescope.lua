-- https://github.com/nvim-telescope/telescope.nvim
-- 配置参考 https://vimawesome.com/plugin/telescope-nvim-care-of-itself
-- WARN: telescope 手动安装依赖 fd 和 repgrep
-- https://github.com/sharkdp/fd
-- https://github.com/BurntSushi/ripgrep
-- theme: dropdown, ivy

require('telescope').setup({
    pickers = {
        -- Your special builtin config goes in here
        buffers = {
            sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
                i = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                    -- Right hand side can also be the name of the action as a string
                    -- ["<c-d>"] = "delete_buffer",
                },
                n = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                }
            }
        },
        find_files = {
            theme = "dropdown"
        }
    },
    extensions = {
        -- Your extension config goes in here
    },
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                mirror = false,
            },
            vertical = {
                mirror = false,
            }
        },
        file_sorter = require 'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
    }
})
