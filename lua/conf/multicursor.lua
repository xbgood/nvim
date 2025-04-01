local mc = require("multicursor-nvim")
mc.setup()

local set = vim.keymap.set;

-- 打开或关闭多光标功能
set({ "n", "x" }, "<c-n>", mc.toggleCursor)

-- 行添加前后的光标
set({ "n", "x" }, "<up>", function() mc.lineAddCursor(-1) end)
set({ "n", "x" }, "<down>", function() mc.lineAddCursor(1) end)

-- 字符添加前后的光标
set({ "n", "x" }, "n", function() mc.matchAddCursor(1) end)
set({ "n", "x" }, "N", function() mc.matchAddCursor(-1) end)

-- 字符跳过前后的光标
set({ "n", "x" }, "q", function() mc.matchSkipCursor(1) end)
set({ "n", "x" }, "Q", function() mc.matchSkipCursor(-1) end)

mc.addKeymapLayer(function(layerSet)
    -- 选择一个不同的光标
    layerSet({ "n", "x" }, "<left>", mc.prevCursor)
    layerSet({ "n", "x" }, "<right>", mc.nextCursor)

    -- Delete the main cursor.
    -- 删除一个选中的光标
    layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

    -- 开启或清理多光标
    layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end)
end)

-- 多光标样式
local hl = vim.api.nvim_set_hl
hl(0, "MultiCursorCursor", { link = "Cursor" })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MultiCursorSign", { link = "SignColumn" })
hl(0, "MultiCursorMatchPreview", { link = "Search" })
hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
