---------------------------------------- default --------------------------------------
-- leader 键
vim.g.mapleader = ","

-- 修改分屏大小
vim.keymap.set("n", "<C-up>",    "<cmd>res +1<CR>",            {})
vim.keymap.set("n", "<C-down>",  "<cmd>res -1<CR>",            {})
vim.keymap.set("n", "<C-left>",  "<cmd>vertical resize-1<CR>", {})
vim.keymap.set("n", "<C-right>", "<cmd>vertical resize+1<CR>", {})

-- 取消搜索的高亮
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "nohlsearch" })

------------------------------------ quickfix 快捷键 ----------------------------------
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<CR>",     { desc = "cnext" })
vim.keymap.set("n", "<leader>cp", "<cmd>cprevious<CR>", { desc = "cprev" })
vim.keymap.set("n", "<leader>cw", "<cmd>cwindow<CR>",   { desc = "cwindow" })
vim.keymap.set("n", "<leader>cx", "<cmd>cclose<CR>",    { desc = "cclose" })
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>",     { desc = "copen" })

---------------------------------------- buffers --------------------------------------
-- 上一个缓冲区
vim.keymap.set("n", "<C-h>", ":bprevious<cr>", { desc = "Buffer Prev" })
-- 下一个缓冲区
vim.keymap.set("n", "<C-l>", ":bnext<cr>",     { desc = "Buffer Next" })
-- 关闭当前 buffer
vim.keymap.set("n", "<C-q>", ":bdelete<cr>",   { desc = "Buffer Delete" })
-- 列出所有缓冲区
-- vim.keymap.set("n", "<C-m>", ":buffers<cr>", { desc = "Buffer List" })
-- 将所有buffer各自打开一个窗口
-- vim.keymap.set("n", "<C-k>", ":ball<cr>", { desc = "Buffer All" })
-- 将所有buffer各自打开一个窗口
-- vim.keymap.set("n", "<C-j>", ":tab ball<cr>", { desc = "Tab All" })

------------------------------------- accelerated jk ----------------------------------
vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", { desc = "Accelerated j" })
vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", { desc = "Accelerated k" })

---------------------------------------- markdown  ------------------------------------
-- markdown 预览
vim.keymap.set("n", "<leader>pp", ":MarkdownPreview<CR>", { desc = "Markdown: Perview" })
-- markdown插入图片
vim.keymap.set("n", "<leader>pi", "<cmd>PasteImage<CR>",  { desc = "Markdown: Paste Image" })

---------------------------------------- flash ----------------------------------------
---搜索词
vim.keymap.set({ "n", "x", "o" }, "s", "<cmd>lua require('flash').jump()<CR>", { desc = "Flash" })
-- 搜索行
vim.keymap.set( { "n" }, "<leader>l",
	"<cmd>lua require('flash').jump({ search = { mode = 'search', max_length=0}, label = { after = {0, 0}}, pattern = '^'})<CR>",
	{ desc = "Flash Line Jump" })

------------------------------------- grug-far ----------------------------------------
-- 只替换当前文件
vim.keymap.set( "n", "<leader>rf",
    "<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<CR>",
    { desc = "Replace Current File" })
-- 搜索当前单词
vim.keymap.set( "n", "<leader>rw",
    "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<CR>",
    { desc = "Replace Current Word" })

--------------------------------- overseer 任务管理系统 -------------------------------
vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<cr>",      { desc = "Overseer: Task List" })
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr>",         { desc = "Overseer: Run task" })
vim.keymap.set("n", "<leader>oq", "<cmd>OverseerQuickAction<cr>", { desc = "Overseer: Action recent task" })
vim.keymap.set("n", "<leader>oi", "<cmd>OverseerInfo<cr>",        { desc = "Overseer: Info" })
vim.keymap.set("n", "<leader>ob", "<cmd>OverseerBuild<cr>",       { desc = "Overseer: Build Task" })
vim.keymap.set("n", "<leader>oa", "<cmd>OverseerTaskAction<cr>",  { desc = "Overseer: Task action" })
vim.keymap.set("n", "<leader>oc", "<cmd>OverseerClearCache<cr>",  { desc = "Overseer: Clear cache" })

-- 定义不同语言的编译运行快捷键
vim.keymap.set("n", "<leader>cb", function()
	local filetype = vim.bo.filetype
	if filetype == "c" then
		require("overseer").run_template({ name = "gcc build" })
	elseif filetype == "cpp" then
		require("overseer").run_template({ name = "g++ build" })
	elseif filetype == "rust" then
		require("overseer").run_template({ name = "rust build" })
	end
end, { desc = "Compile" })

vim.keymap.set("n", "<leader>cr", function()
	local filetype = vim.bo.filetype
	if filetype == "c" then
		require("overseer").run_template({ name = "gcc run" })
	elseif filetype == "cpp" then
		require("overseer").run_template({ name = "g++ run" })
	elseif filetype == "rust" then
		require("overseer").run_template({ name = "rust run" })
	elseif filetype == "go" then
		require("overseer").run_template({ name = "go run" })
	elseif filetype == "python" then
		require("overseer").run_template({ name = "script run" })
	elseif filetype == "sh" then
		require("overseer").run_template({ name = "script run" })
	end
end, { desc = "Run" })

vim.keymap.set("n", "<leader>ct", function()
	local filetype = vim.bo.filetype
	if filetype == "rust" then
		require("overseer").run_template({ name = "rust test" })
	end
end, { desc = "Test" })

-------------------------------------- dap --------------------------------------------
vim.keymap.set({ "i", "n", "v" }, "<F5>",  function() require("dap").continue() end,          { desc = "DAP: continue" })
vim.keymap.set({ "i", "n", "v" }, "<F12>", function() require("dap").step_out() end,          { desc = "DAP: step out" })
vim.keymap.set({ "i", "n", "v" }, "<F9>",  function() require("dap").toggle_breakpoint() end, { desc = "DAP: toggle breakpoint" })
vim.keymap.set({ "i", "n", "v" }, "<F10>", function() require("dap").step_into() end,         { desc = "DAP: step into" })
vim.keymap.set({ "i", "n", "v" }, "<F11>", function() require("dap").step_over() end,         { desc = "DAP: step over" })
vim.keymap.set({ "i", "n", "v" }, "<F8>",  function() require("dap").terminate() end,         { desc = "DAP: terminate" })
-- vim.keymap.set('n', '<Leader>db', function() require('dap').set_breakpoint() end, { desc = "set breakpoint" })

vim.keymap.set("n", "<Leader>dq", function() require("dap").close() end,         { desc = "DAP: close" })
vim.keymap.set("n", "<Leader>dl", function() require("dap").run_last() end,      { desc = "DAP: run last" })
vim.keymap.set("n", "<Leader>du", function() require("dapui").toggle() end,      { desc = "DAP: toggle ui" })
vim.keymap.set("n", "<Leader>dt", function() require("dap").step_back() end,     { desc = "DAP: step back" })
vim.keymap.set("n", "<Leader>de", function() require("dap").pause.toggle() end,  { desc = "DAP: pause" })
vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.toggle() end,   { desc = "DAP: toggle repl" })
vim.keymap.set("n", "<Leader>dd", function() require("dap").disconnect() end,    { desc = "DAP: disconnect" })
vim.keymap.set("n", "<Leader>dR", function() require("dap").run_to_cursor() end, { desc = "DAP: Run to Cursor" })
vim.keymap.set("n", "<Leader>dc", function() require("dap").set_breakpoint(vim.fn.input("[Condition] > ")) end, { desc = "DAP: conditional breakpoint" })
vim.keymap.set("n", "<Leader>di", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, { desc = "DAP: input breakpoint" })

vim.keymap.set("n", "<Leader>de", function() require("dapui").eval() end, { desc = "DAP: evaluate" })
vim.keymap.set("n", "<Leader>dE", function() require("dapui").eval(vim.fn.input("[Expression] > ")) end, { desc = "DAP: evaluate input" })

vim.keymap.set({ "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end,   { desc = "DAP: hover" })
vim.keymap.set({ "n", "v" }, "<Leader>dp", function() require("dap.ui.widgets").preview() end, { desc = "DAP: preview" })
vim.keymap.set("n", "<Leader>df", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.frames) end, { desc = "DAP: frames" })
vim.keymap.set("n", "<Leader>ds", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.scopes) end, { desc = "DAP: scopes" })
-- vim.keymap.set({'n', 'v'}, '<Leader>ds', function() require('dap.ui.widgets').scopes() end,  { desc = "dap scopes" })
-- vim.keymap.set('n', '<Leader>dS', function() require('dap').session() end, { desc = "dap session" })
-- vim.keymap.set('n', '<Leader>dk', function() require('dap').repl.open() end, { desc = "open repl" })
-- vim.keymap.set('n', '<Leader>dc', function() require('dap').repl.close() end, { desc = "close repl" })

---------------------------------------- snacks ---------------------------------------
-- 拼写
require("snacks").toggle.option("spell", { name = "Spelling" }):map("<leader>us")
-- 是否折行
require("snacks").toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
-- Relative Number
require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
-- Line Number
require("snacks").toggle.line_number():map("<leader>ul")
-- 关闭打开diagnostics
require("snacks").toggle.diagnostics():map("<leader>ud")
-- 打开conceal
require("snacks").toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
-- 切换开关 treesitter 配色
require("snacks").toggle.treesitter():map("<leader>uT")
-- 打开背景
require("snacks").toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
-- 打开函数的参数提醒
require("snacks").toggle.inlay_hints():map("<leader>uh")
-- dim 模式，聚焦视觉，淡化背景
require("snacks").toggle.dim():map("<leader>uD")
-- zen 模式，沉浸式写作
require("snacks").toggle.zen():map("<leader>uz")

-- 显示neovim的新闻
vim.keymap.set("n", "<leader>pn", function() require("snacks").win({
		file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1], width = 0.6, height = 0.6,
		wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 },
	}) end, { desc = "Neovim News" })

-- colorscheme 主题
vim.keymap.set("n", "<leader>uC", "<cmd>lua require('snacks').picker.colorschemes()<cr>",   { desc = "Colorschemes" })

-- 打开indentline
vim.keymap.set("n", "<leader>ug", "<cmd>lua require('snacks').indent()<cr>",                { desc = "Indent Line" })

-- 在屏幕下面打开终端
vim.keymap.set("n", "<C-t>",      "<cmd>lua require('snacks').terminal.toggle()<cr>",       { desc = "Toggle Terminal" })

-- 重命名文件名
vim.keymap.set("n", "<leader>cR", "<cmd>lua require('snacks').rename.rename_file()<cr>",    { desc = "Rename File" })

-- 搜索历史
vim.keymap.set("n", "<leader>s/", "<cmd>lua require('snacks').picker.search_history()<cr>", { desc = "Searched History" })

-- 搜索历史通知
vim.keymap.set("n", "<leader>sn", "<cmd>lua require('snacks').picker.notifications()<cr>",  { desc = "Notification" })
--
vim.keymap.set("n", "<leader>uy", "<cmd>lua require('snacks').notifier.show_history()<cr>", { desc = "Notification History" })
-- hide notifier
vim.keymap.set("n", "<leader>un", "<cmd>lua require('snacks').notifier.hide()<cr>",         { desc = "Dismiss All Notifications" })

-- Scratch 一个便签的功能
vim.keymap.set("n", "<leader>.",  "<cmd>lua require('snacks').scratch()<cr>",        { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<leader>st", "<cmd>lua require('snacks').scratch.select()<cr>", { desc = "Scratch Select" })

-- LazyGit
vim.keymap.set("n", "<leader>zf", "<cmd>lua require('snacks').lazygit.log_file()<cr>", { desc = "Lazygit: Current File Git History" })
vim.keymap.set("n", "<leader>zg", "<cmd>lua require('snacks').lazygit()<cr>",          { desc = "Lazygit: Toggle Open" })
vim.keymap.set("n", "<leader>zl", "<cmd>lua require('snacks').lazygit.log()<cr>",      { desc = "Lazygit: Git Log (cwd)" })

-- 搜索nvim的配置文件
vim.keymap.set("n", "<leader>fc", "<cmd>lua require('snacks').picker.files({ cwd = vim.fn.stdpath('config') }) <cr>", { desc = "Find Config File" })
-- 搜索当前目录下的所有文件
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('snacks').picker.files() <cr>",    { desc = "Find Files" })
-- 搜索git跟踪的文件
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('snacks').picker.git_files()<cr>", { desc = "Find Git Files" })
-- 搜索最近打开的文件
vim.keymap.set("n", "<leader>fr", "<cmd>lua require('snacks').picker.recent()<cr>",    { desc = "Recent" })
-- 智能搜索：优先搜索最近打开、其次git、最后全盘fd
vim.keymap.set("n", "<leader>ft", "<cmd>lua require('snacks').picker.smart()<cr>",     { desc = "Smart Find Files" })
-- 从所有buffers中搜索打开指定buffer
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('snacks').picker.buffers()<cr>",   { desc = "Buffers" })
-- 搜索项目目录
vim.keymap.set("n", "<leader>fp", "<cmd>lua require('snacks').picker.projects()<cr>",  { desc = "Projects" })

-- 搜索diff hunk：检索把当前的所有hunk列表
vim.keymap.set("n", "<leader>gd", "<cmd>lua require('snacks').picker.git_diff()<cr>",     { desc = "Git Diff (Hunks)" })
-- 搜索提交历史
vim.keymap.set("n", "<leader>gl", "<cmd>lua require('snacks').picker.git_log()<cr>",      { desc = "Git Log" })
-- 搜索当前行的提交历史
vim.keymap.set("n", "<leader>gL", "<cmd>lua require('snacks').picker.git_log_line()<cr>", { desc = "Git Log Line" })
-- 搜索当前文件的提交历史
vim.keymap.set("n", "<leader>gf", "<cmd>lua require('snacks').picker.git_log_file()<cr>", { desc = "Git Log File" })
-- 搜索所有分支，用于切分支
vim.keymap.set("n", "<leader>gb", "<cmd>lua require('snacks').picker.git_branches()<cr>", { desc = "Git Branches" })
-- 将当前代码在github的浏览器中打开
vim.keymap.set("n", "<leader>gB", "<cmd>lua require('snacks').gitbrowse()<cr>",           { desc = "Git Browse" })
-- 搜索status文件列表
vim.keymap.set("n", "<leader>gs", "<cmd>lua require('snacks').picker.git_status()<cr>",   { desc = "Git Status" })
-- 搜索stash文件列表
vim.keymap.set("n", "<leader>gS", "<cmd>lua require('snacks').picker.git_stash()<cr>",    { desc = "Git Stash" })

-- 搜索当前文件符号
vim.keymap.set("n", "<leader>ss", "<cmd>lua require('snacks').picker.lsp_symbols()<cr>",           { desc = "LSP Symbols" })
-- 搜索全项目符号
vim.keymap.set("n", "<leader>sS", "<cmd>lua require('snacks').picker.lsp_workspace_symbols()<cr>", { desc = "LSP Workspace Symbols" })
-- 搜索lsp的引用
vim.keymap.set('n', "gr",         "<cmd>lua require('snacks').picker.lsp_references()<cr>",        { desc = "References" })

-- 搜索当前buffer的诊断Diagnostics
vim.keymap.set("n", "<leader>sd", "<cmd>lua require('snacks').picker.diagnostics_buffer()<cr>",    { desc = "Buffer Diagnostics" })
-- 搜索项目或者所有buffers的诊断Diagnostics
vim.keymap.set("n", "<leader>sD", "<cmd>lua require('snacks').picker.diagnostics()<cr>",           { desc = "Diagnostics" })

-- 全局文本搜索
vim.keymap.set("n", "<leader>sg", "<cmd>lua require('snacks').picker.grep()<cr>",                  { desc = "Grep Current Dir" })
-- 全局搜索光标所在的单词
vim.keymap.set({ "n", "v" }, "<leader>sw", "<cmd>lua require('snacks').picker.grep_word()<cr>", { desc = "Visual selection or word" })
-- 从所有buffers中检索你输入的单词
vim.keymap.set("n", "<leader>sb", "<cmd>lua require('snacks').picker.grep_buffers()<cr>",       { desc = "Grep Buffer" })

-- 搜索自动命令
vim.keymap.set("n", "<leader>sa", "<cmd>lua require('snacks').picker.autocmds()<cr>",        { desc = "Autocmds" })
-- 搜索最近的命令历史
vim.keymap.set("n", "<leader>sc", "<cmd>lua require('snacks').picker.command_history()<cr>", { desc = "Command History" })
-- 搜索所有的命令
vim.keymap.set("n", "<leader>sC", "<cmd>lua require('snacks').picker.commands()<cr>",        { desc = "Commands" })
-- 文件浏览器
vim.keymap.set("n", "<leader>se", "<cmd>lua require('snacks').explorer()<cr>",               { desc = "File Explorer" })
-- 搜索内置的帮助标签
vim.keymap.set("n", "<leader>sh", "<cmd>lua require('snacks').picker.help()<cr>",       { desc = "Help Pages" })
-- 搜索nvim设置的高亮
vim.keymap.set("n", "<leader>sH", "<cmd>lua require('snacks').picker.highlights()<cr>", { desc = "Highlights" })
-- 搜索Nerd Fonts图标
vim.keymap.set("n", "<leader>si", "<cmd>lua require('snacks').picker.icons()<cr>",      { desc = "Icons" })
-- 搜索全局跳转历史
vim.keymap.set("n", "<leader>sj", "<cmd>lua require('snacks').picker.jumps()<cr>",      { desc = "Jumps" })
-- 搜索所有快捷键
vim.keymap.set("n", "<leader>sk", "<cmd>lua require('snacks').picker.keymaps()<cr>",    { desc = "Keymaps" })
-- 搜索本地列表
vim.keymap.set("n", "<leader>sl", "<cmd>lua require('snacks').picker.loclist()<cr>",    { desc = "Location List" })
-- 搜索全局书签marks
vim.keymap.set("n", "<leader>sm", "<cmd>lua require('snacks').picker.marks()<cr>",      { desc = "Marks" })
-- 搜索man中的所有文档
vim.keymap.set("n", "<leader>sM", "<cmd>lua require('snacks').picker.man()<cr>",        { desc = "Man Pages" })
-- 搜索寄存器内容
vim.keymap.set("n", "<leader>sr", "<cmd>lua require('snacks').picker.registers()<cr>",  { desc = "Registers" })
-- 执行上一次搜索的命令
vim.keymap.set("n", "<leader>sR", "<cmd>lua require('snacks').picker.resume()<cr>",     { desc = "Resume" })
--  显示当前文件的修改列表
vim.keymap.set("n", "<leader>sq", "<cmd>lua require('snacks').picker.qflist()<cr>",     { desc = "Quickfix List" })
-- 显示undo撤销树
vim.keymap.set("n", "<leader>su", "<cmd>lua require('snacks').picker.undo()<cr>",       { desc = "UndoTree" })
-- 从zoxide历史中搜索
vim.keymap.set("n", "<leader>sz", "<cmd>lua require('snacks').picker.zoxide()<cr>",     { desc = "Zoxide" })

-------------------------------------- gitsigns ---------------------------------------

-- 将当前行的改动提交到暂存区
vim.keymap.set("n", "gs", require("gitsigns").stage_hunk,   { desc = "Git Stage Hunk" })
-- 将当前buffer的改动提交到暂存区
vim.keymap.set("n", "gS", require("gitsigns").stage_buffer, { desc = "Git Stage Buffer" })

-- 在当前行的后面显示提交记录
vim.keymap.set("n", "<leader>gc", require("gitsigns").toggle_current_line_blame, { desc = "Git Current Line Blame" })

-- 取消当前buffer的改动，相当于 git checkout *
vim.keymap.set("n", "<leader>gR", require("gitsigns").reset_buffer, { desc = "Git Reset Buffer" })

-- 取消当前行的改动
vim.keymap.set({ "n", "v" }, "<leader>gr", require("gitsigns").reset_hunk, { desc = "Git Reset Hunk" })

-- 预览当前行的改动，即diff
vim.keymap.set("n", "<leader>gp", require("gitsigns").preview_hunk, { desc = "Git Preview Hunk" })

-- 在当前行上面显示修改，类似preview_hunk功能
vim.keymap.set("n", "<leader>gi", require("gitsigns").preview_hunk_inline, { desc = "Git Preview Hunk Inline" })

-- 查看上一处的改动
vim.keymap.set("n", "<leader>gk", require("gitsigns").prev_hunk,      { desc = "Git Prev Hunk" })

-- 查看下一处的改动
vim.keymap.set("n", "<leader>gj", require("gitsigns").next_hunk,      { desc = "Git Next Hunk" })

-- 显示出当前buffer被删除的行
vim.keymap.set("n", "<leader>gt", require("gitsigns").toggle_deleted, { desc = "Git Toggle Deleted" })

-- 选择当前修改过的代码
vim.keymap.set("n", "<leader>ge", require("gitsigns").select_hunk,    { desc = "Git Select Hunk" })

-- 显示当前文件的修改
vim.keymap.set("n", "<leader>gq", require("gitsigns").setqflist,      { desc = "Git File Hunks List" })

--  显示当前项目的所有修改列表
vim.keymap.set("n", "<leader>gQ", function() require("gitsigns").setqflist("all") end, { desc = "Git Project Hunks List" })

-- 新建窗口显示差异，类似git diff
-- vim.keymap.set('n', '<leader>gd', require('gitsigns').diffthis, { desc = "Git Diff" }) -- 用snacks的diff代替
-- git diff HEAD~1
vim.keymap.set("n", "<leader>gD", function() require("gitsigns").diffthis("~") end, { desc = "Git All Diff" })

-- 撤销上一次提交暂存区 undo stage
vim.keymap.set({ "n", "v" }, "<leader>gu", require("gitsigns").undo_stage_hunk, { desc = "Git Undo Stage Hunk" })

-- git blame
vim.keymap.set("n", "<leader>ga", function() require("gitsigns").blame({ full = true }) end, { desc = "Git Blame" })
vim.keymap.set("n", "<leader>gg", function() require("gitsigns").blame_line({ full = true }) end, { desc = "Git Blame Line" })

-------------------------------------- vim.buf.lsp ------------------------------------
---删除系统lsp内置的快捷键
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grt")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")

-- 跳转到上一个错误提示的地方
vim.keymap.set("n", "g[", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Prev Diagnostic [LSP]" })

-- 跳转到下一个错误提示的地方
vim.keymap.set("n", "g]", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next Diagnostic [LSP]" })

-- 跳转到声明
vim.keymap.set("n", "gd", vim.lsp.buf.declaration,     { desc = "Goto Declaration [LSP]" })

-- 跳转到定义
vim.keymap.set("n", "ge", vim.lsp.buf.definition,      { desc = "Goto Definition [LSP]" })

-- 跳转到类型定义
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Goto Type Definition [LSP]" })

-- 跳转到接口的实现
vim.keymap.set("n", "gi", vim.lsp.buf.implementation,  { desc = "Goto Implementation [LSP]" })

-- 重命名变量名
vim.keymap.set("n", "gm", vim.lsp.buf.rename,          { desc = "Rename [LSP]" })

-- 修正错误code action
vim.keymap.set("n", "gq", vim.lsp.buf.code_action,     { desc = "Code Action [LSP]" })

-- 查看错误的提示
vim.keymap.set("n", "go", vim.diagnostic.open_float,   { desc = "Diagnostic Show [LSP]" })

-- 查看文档的标签目录
vim.keymap.set("n", "gO", vim.lsp.buf.document_symbol, { desc = "Document Symbols [LSP]" })

-- 列出引用过该变量的地方
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References [LSP]" })

-- 集中列出所有的错误提示
vim.keymap.set("n", "gl", vim.diagnostic.setloclist,  { desc = "Diagnostic List [LSP]" })

-- 该函数被那些函数调用
vim.keymap.set("n", "gp", vim.lsp.buf.incoming_calls, { desc = "Income Calls [LSP]" })

-- 该函数调用过那些函数（调用链）
vim.keymap.set("n", "gn", vim.lsp.buf.outgoing_calls, { desc = "Outgo Calls [LSP]" })

-- 继承关系
vim.keymap.set("n", "gy", vim.lsp.buf.typehierarchy, { desc = "Typehierarchy [LSP]" })

-- 查看函数签名
vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, { desc = "Signature Help [LSP]" })

-- 查看函数原型
vim.keymap.set("n", "K",     vim.lsp.buf.hover, { desc = "Hover Doc [LSP]" })

-- 插入模式下看函数原型
vim.keymap.set("i", "<C-k>", vim.lsp.buf.hover, { desc = "Hover Doc [LSP]" })

-- 添加工作目录
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder,    { desc = "Add Folder [Workspace]" })

-- 移除当前文件的详细目录
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Folder [Workspace]" })

-- 列出当前nvim的工作目录
vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "List Folders [Workspace]" })

-- 工作区搜索
vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol(vim.fn.input("Symbols: ")) end, { desc = "Workspace Search [Workspace]" })

-- lsp 代码格式化
vim.keymap.set("n", "<leader>cF", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format Code [LSP]" })

-- conform插件代码自动格式化
vim.keymap.set("n", "<leader>cf", function() require("conform").format({ async = true, lsp_fallback = true }) end, { desc = "Format Code [Conform]" })

------------------------------------- kd translate ------------------------------------
-- 翻译
vim.keymap.set("n", "<leader>kd", ":TranslateNormal<CR>", { desc = "Translate" })
vim.keymap.set("v", "<leader>kd", ":TranslateVisual<CR>", { desc = "Translate" })

---------------------------------------- others ---------------------------------------
---注释comments
-- gcc : 注释
-- gbc : 块注释
-- gcw : 单词注释
-- gc$ : 光标到行尾注释
-- gco : 光标下方新增注释
-- gcO : 光标上方新增注释
-- gcA : 光标行尾新增注释
-- gcii: 注释内部
-- gca}: 注释{}的内容包括{} 

-- 文本对齐
-- ga: 文本对齐






