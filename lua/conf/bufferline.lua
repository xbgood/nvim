-- https://github.com/akinsho/bufferline.nvim

require("bufferline").setup(
    {
        options = {
            -- 设置tabs
            mode = "buffers",
            -- 为每个 buffer 都配置一个序数
            numbers = "none", -- "none", "both"
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            -- middle_mouse_command = nil,

            -- 使用内置 LSP 进行诊断
            diagnostics = "nvim_lsp", -- or coc

            -- 不建议更改图标
            indicator_icon = "|",-- "▎",
            buffer_close_icon =  "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",

            max_name_length = 18,
            max_prefix_length = 15,
            tab_size = 11,

            color_icons = true,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_buffer_default_icon = true,
            show_close_icon = false,
            show_tab_indicators = true,
            persist_buffer_sort = true,

            -- 分割符样式："slant" | "thick" | "thin"
            -- 如果是透明背景，不推荐使用 slant
            separator_style = "thin",
            -- 左侧让出 nvim-tree 的位置
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left"
                }
            },
            -- 显示 LSP 报错图标
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " " or (e == "warning" and " " or "")
                    s = s .. n .. sym
                end
                return s
            end
        },


        custom_areas = {
            right = function()
                local result = {}
                local seve = vim.diagnostic.severity
                local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
                local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
                local info = #vim.diagnostic.get(0, {severity = seve.INFO})
                local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

                if error ~= 0 then
                    table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
                end

                if warning ~= 0 then
                    table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
                end

                if hint ~= 0 then
                    table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
                end

                if info ~= 0 then
                    table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
                end
                return result
            end,
        }
    }
)

-- 关闭当前 buffer，由 bufdelete 插件所提供的方法
vim.keybinds.gmap("n", "<C-q>", "<cmd>Bdelete!<CR>", vim.keybinds.opts)
-- 切换上一个缓冲区
vim.keybinds.gmap("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)
-- 切换下一个缓冲区
vim.keybinds.gmap("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", vim.keybinds.opts)
-- 关闭左侧缓冲区
vim.keybinds.gmap("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", vim.keybinds.opts)
-- 关闭右侧缓冲区
vim.keybinds.gmap("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", vim.keybinds.opts)
