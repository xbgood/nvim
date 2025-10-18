-- fcitx5 自动切换输入法
vim.g.FcitxToggleInput = function()
	local input_status = tonumber(vim.fn.system("fcitx5-remote"))
	if input_status == 2 then
		vim.fn.system("fcitx5-remote -c")
	end
end
vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")

-- snacks.notifier 内置lsp进度条
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), "info", {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

-- diagnostic 错误提示
vim.diagnostic.config({
    -- 虚拟文本前缀
	virtual_text = { prefix = "●" },

	-- 出错处下划线
	underline = true,
	-- 插入模式不更新，避免闪动
	update_in_insert = false,
	-- 错误排在警告前
	severity_sort = true,

	float = {
		border = "rounded",
		header = "Diagnostic:",
	},

	-- 设置符号栏符号
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN]  = "",
			[vim.diagnostic.severity.INFO]  = "",
			[vim.diagnostic.severity.HINT]  = "",
		},
	},
})

-- markdown 预览设置
vim.g.mkdp_auto_start       = 0
vim.g.mkdp_auto_close       = 1
vim.g.mkdp_refresh_slow     = 0
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_theme            = "light"
vim.g.mkdp_browser          = "firefox"
vim.g.mkdp_filetypes        = { "markdown" }
vim.g.mkdp_markdown_css     = "/home/wallen/.config/nvim/lua/scripts/markdown.css"

-- nvim default
-- vim.cmd.colorscheme("habamax")
-- vim.cmd.colorscheme("default")
-- vim.cmd.colorscheme("quiet")
-- vim.cmd.colorscheme("slate")
-- vim.cmd.colorscheme("zaibatsu")
-- vim.cmd.colorscheme("wildcharm")
-- vim.cmd.colorscheme("unokai")

-- colorscheme 颜色主题
vim.cmd.colorscheme("everforest")
vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("edge")
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("gruvbox-material")
-- vim.cmd.colorscheme("sonokai")

-- nightfox主题
-- vim.cmd.colorscheme("nightfox")
-- vim.cmd.colorscheme("nordfox")
-- vim.cmd.colorscheme("duskfox")
-- vim.cmd.colorscheme("carbonfox")
-- vim.cmd.colorscheme("terafox")
-- vim.cmd.colorscheme("dayfox")



