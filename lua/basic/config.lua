-- fcitx5 自动切换输入法
vim.g.FcitxToggleInput = function()
	local input_status = tonumber(vim.fn.system("fcitx5-remote"))
	if input_status == 2 then
		vim.fn.system("fcitx5-remote -c")
	end
end
vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")

-- 关闭nvim右边的 diagnostic 错误提示
vim.diagnostic.config({
	--  关闭diagnostic 设置
	-- virtual_text = false,

	-- 设置diagnostic 前缀
	virtual_text = {
		-- 虚拟文本前缀
		prefix = "●",
		spacing = 4,
		-- 与代码留空
		suffix = " ",
		-- 只有 >= 警告才显示
		-- severity_limit = 'Warning',
	},

	-- 出错处下划线
	underline = true,
	-- 插入模式不更新，避免闪动
	update_in_insert = false,
	-- 错误排在警告前
	severity_sort = true,

	float = {
		header = "Diagnostic:",
		border = "rounded",
	},

	-- 设置符号栏符号
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})

-- markdown 预览设置
vim.g.mkdp_filetypes = { "markdown" }
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_browser = "firefox"
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_theme = "light"
vim.g.mkdp_markdown_css = "/home/wallen/.config/nvim/lua/scripts/markdown.css"

-- colorscheme 颜色主题
vim.cmd.colorscheme("everforest")
-- vim.cmd.colorscheme("nightfox")
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("tokyonight")


