-- https://github.com/lewis6991/gitsigns.nvim
-- TODO: 您也可以绑定一些快捷键位快速查看 git 信息
-- 参见：https://github.com/lewis6991/gitsigns.nvim/#keymaps

require('gitsigns').setup {
    signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged_enable          = true,
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
        follow_files = true
    },
    auto_attach                  = true,
    attach_to_untracked          = true,
    current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil, -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },

    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Navigation
        vim.keymap.set('n', ']c', function()
                if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, { expr = true, desc = "Git Next Hunk" })

        vim.keymap.set('n', '[c', function()
                if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, { expr = true, desc = "Git Prev Hunk" })

        -- Actions

        -- 将当前行的改动提交到暂存区，即add
        vim.keymap.set({ 'n', 'v' }, '<leader>gs', gs.stage_hunk, { desc = "Git Stage Hunk" })
        -- 撤销提交暂存区，即undo
        vim.keymap.set({ 'n', 'v' }, '<leader>gu', gs.undo_stage_hunk, { desc = "Git Undo Stage Hunk" })
        -- 重置当前行的改动
        vim.keymap.set({ 'n', 'v' }, '<leader>gr', gs.reset_hunk, { desc = "Git Reset Hunk" })

        -- 查看上一处的改动
        vim.keymap.set('n', '<leader>gk', gs.prev_hunk, { desc = "Git Prev Hunk" })
        -- 查看下一处的改动
        vim.keymap.set('n', '<leader>gj', gs.next_hunk, { desc = "Git Next Hunk" })

        -- 将当前buffer的改动提交到暂存区
        vim.keymap.set('n', '<leader>gS', gs.stage_buffer, { desc = "Git Stage Buffer" })
        -- 重置当前buffer的改动
        vim.keymap.set('n', '<leader>gR', gs.reset_buffer, { desc = "Git Reset Buffer" })

        -- 显示出当前buffer被删除的行
        vim.keymap.set('n', '<leader>gt', gs.toggle_deleted, { desc = "Git Toggle Deleted" })
        --  显示当前文件的修改列表
        vim.keymap.set('n', '<leader>gl', gs.setqflist, { desc = "Git File List" })
        --  显示当前项目的所有修改列表
        vim.keymap.set('n', '<leader>gQ', function() gs.setqflist('all') end, { desc = "Git Project List" })

        -- 新建窗口显示差异，类似git diff
        -- vim.keymap.set('n', '<leader>gd', gs.diffthis, { desc = "Git Diff" }) -- 用snacks的diff代替
        vim.keymap.set('n', '<leader>gD', function() gs.diffthis('~') end, { desc = "Git All Diff" })

        -- 预览当前行的改动，即diff
        vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { desc = "Git Preview Hunk" })
        -- 在当前行上面显示修改
        vim.keymap.set('n', '<leader>gi', gs.preview_hunk_inline, { desc = "Git Preview Hunk Inline" })

        -- 选择当前修改过的代码
        vim.keymap.set('n', '<leader>ge', gs.select_hunk, { desc = "Git Select Hunk" })

        -- 显示当前上一个提交的内容
        vim.keymap.set('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = "Git Blame Line" })
        -- 在当前行的后面显示提交记录
        vim.keymap.set('n', '<leader>gc', gs.toggle_current_line_blame, { desc = "Git Toggle Current Line Blame" })

    end
}
