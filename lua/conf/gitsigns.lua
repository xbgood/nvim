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
    signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
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

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        -- 将当前行的改动提交到暂存区，即add
        map({ 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>')
        -- 撤销提交暂存区，即undo
        map({ 'n', 'v' }, '<leader>gu', ':Gitsigns undo_stage_hunk<CR>')
        -- 重置当前行的改动
        map({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>')
        -- 将当前buffer的改动提交到暂存区
        map('n', '<leader>gS', gs.stage_buffer)
        -- 重置当前buffer的改动
        map('n', '<leader>gR', gs.reset_buffer)
        -- 显示出当前buffer被删除的行
        map('n', '<leader>gt', gs.toggle_deleted)
        -- 新建窗口显示差异，类似git diff
        map('n', '<leader>gd', gs.diffthis)
        -- 预览当前行的改动，即diff
        map('n', '<leader>gp', gs.preview_hunk)
        -- 查看上一处的改动
        map('n', '<leader>gk', gs.prev_hunk)
        -- 查看下一处的改动
        map('n', '<leader>gj', gs.next_hunk)
        -- 显示当前上一个提交的内容
        map('n', '<leader>gb', function() gs.blame_line { full = true } end)
        -- 在当前行的后面显示提交记录
        map('n', '<leader>gc', gs.toggle_current_line_blame)

    end
}
