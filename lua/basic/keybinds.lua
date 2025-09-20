------------------------------------- default -----------------------------------
-- leader 键设置为空格
vim.g.mapleader = ","

-- 插入模式下的上下左右移动
-- vim.keymap.set('i', "<A-k>", "<up>", {})
-- vim.keymap.set('i', "<A-j>", "<down>", {})
-- vim.keymap.set('i', "<A-h>", "<left>", {})
-- vim.keymap.set('i', "<A-l>", "<right>", {})

-- 修改分屏大小
vim.keymap.set('n', "<C-up>", "<cmd>res +1<CR>", {})
vim.keymap.set('n', "<C-down>", "<cmd>res -1<CR>", {})
vim.keymap.set('n', "<C-left>", "<cmd>vertical resize-1<CR>", {})
vim.keymap.set('n', "<C-right>", "<cmd>vertical resize+1<CR>", {})

-- 取消搜索的高亮
vim.keymap.set('n', "<Esc>", "<cmd>nohlsearch<cr>", { desc = "nohlsearch" })

-- buffer
-- 切换上一个缓冲区
vim.keymap.set('n', "<C-h>", "<cmd>BufferPrevious<CR>", {})
-- 切换下一个缓冲区
vim.keymap.set('n', "<C-l>", "<cmd>BufferNext<CR>", {})
-- 关闭当前 buffer，由 bufdelete 插件所提供的方法
vim.keymap.set('n', "<C-q>", "<cmd>BufferDelete<CR>", {})
-- 关闭缓冲区
vim.keymap.set('n', "<leader>bc", "<cmd>BufferClose<CR>", { desc = "Buffer Close" })
-- 列出所有缓冲区
vim.keymap.set('n', "<leader>bl", "<cmd>buffers<CR>", { desc = "Buffer List" })


------------------------------------- flash ------------------------------------
vim.keymap.set({ 'n', 'x', 'o' }, "s", "<cmd>lua require('flash').jump()<CR>", { desc = "Flash" })


--------------------------------------- yazi -----------------------------------
vim.keymap.set({ 'n', 'v' }, "<leader>1", "<cmd>Yazi<CR>", { desc = "FileManager" })


------------------------------- overseer 任务管理系统 ---------------------------
vim.keymap.set('n', "<leader>ot", "<cmd>OverseerToggle<cr>",      { desc = "Overseer: Task List" })
vim.keymap.set('n', "<leader>or", "<cmd>OverseerRun<cr>",         { desc = "Overseer: Run task"})
vim.keymap.set('n', "<leader>oq", "<cmd>OverseerQuickAction<cr>", { desc = "Overseer: Action recent task" })
vim.keymap.set('n', "<leader>oi", "<cmd>OverseerInfo<cr>",        { desc = "Overseer: Info" })
vim.keymap.set('n', "<leader>ob", "<cmd>OverseerBuild<cr>",       { desc = "Overseer: Build Task" })
vim.keymap.set('n', "<leader>oa", "<cmd>OverseerTaskAction<cr>",  { desc = "Overseer: Task action" })
vim.keymap.set('n', "<leader>oc", "<cmd>OverseerClearCache<cr>",  { desc = "Overseer: Clear cache" })

-- 定义不同语言的编译运行快捷键
vim.keymap.set("n", "<leader>cb",
function()
    local filetype = vim.bo.filetype
    if filetype == "c" then
        require('overseer').run_template({ name = "gcc build" })
    elseif filetype == "cpp" then
        require('overseer').run_template({ name = "g++ build" })
    elseif filetype == "rust" then
        require('overseer').run_template({ name = "rust build" })
    end
end, { desc = "Compile" })

vim.keymap.set("n", "<leader>cr",
function()
    local filetype = vim.bo.filetype
    if filetype == "c" then
        require('overseer').run_template({ name = "gcc run" })
    elseif filetype == "cpp" then
        require('overseer').run_template({ name = "g++ run" })
    elseif filetype == "rust" then
        require('overseer').run_template({ name = "rust run" })
    elseif filetype == "go" then
        require('overseer').run_template({ name = "go run" })
    elseif filetype == "python" then
        require('overseer').run_template({ name = "script run" })
    elseif filetype == "sh" then
        require('overseer').run_template({ name = "script run" })
    end
end, { desc = "Run" })


------------------------------------- accelerated jk -----------------------------
vim.keymap.set('n', "j", "<Plug>(accelerated_jk_gj)", { desc = "Accelerated j" })
vim.keymap.set('n', "k", "<Plug>(accelerated_jk_gk)", { desc = "Accelerated k" })


------------------------------------- grug-far -----------------------------------
-- 只替换当前文件
vim.keymap.set('n', "<leader>rf", "<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<CR>", { desc = "Replace Current File" })
-- 搜索当前单词
vim.keymap.set('n', "<leader>rw", "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<CR>", { desc = "Replace Current Word" })


------------------------------------- markdown  -----------------------------------
-- markdown 预览
vim.keymap.set('n', "<leader>pp", ":MarkdownPreview<CR>", { desc = "Markdown: Perview" })
-- markdown插入图片
vim.keymap.set('n', "<leader>pi", "<cmd>PasteImage<CR>",  { desc = "Markdown: Paste Image" })


-------------------------------------- dap ----------------------------------------
vim.keymap.set({ 'i', 'n', 'v' }, "<F5>",  function() require('dap').continue() end,  { desc = "DAP: continue" })
vim.keymap.set({ 'i', 'n', 'v' }, "<F12>", function() require('dap').step_out() end,  { desc = "DAP: step out" })
vim.keymap.set({ 'i', 'n', 'v' }, "<F9>",  function() require('dap').toggle_breakpoint() end, { desc = "DAP: toggle breakpoint" })
-- vim.keymap.set('n', '<Leader>db', function() require('dap').set_breakpoint() end, { desc = "set breakpoint" })
vim.keymap.set({ 'i', 'n', 'v' }, "<F10>", function() require('dap').step_into() end, { desc = "DAP: step into" })
vim.keymap.set({ 'i', 'n', 'v' }, "<F11>", function() require('dap').step_over() end, { desc = "DAP: step over" })
vim.keymap.set({ 'i', 'n', 'v' }, "<F8>",  function() require('dap').terminate() end, { desc = "DAP: terminate" })

vim.keymap.set('n', '<Leader>dq', function() require('dap').close() end, { desc = "DAP: close" })
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "DAP: run last" })
vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end, { desc = "DAP: toggle ui" })
vim.keymap.set('n', '<Leader>dt', function() require('dap').step_back() end, { desc = "DAP: step back" })
vim.keymap.set('n', '<Leader>de', function() require('dap').pause.toggle() end, { desc = "DAP: pause" })
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.toggle() end, { desc = "DAP: toggle repl" })
vim.keymap.set('n', '<Leader>dd', function() require('dap').disconnect() end, { desc = "DAP: disconnect" })
vim.keymap.set('n', '<Leader>dR', function() require('dap').run_to_cursor() end, { desc = "DAP: Run to Cursor" })
vim.keymap.set('n', '<Leader>dc', function() require('dap').set_breakpoint(vim.fn.input '[Condition] > ') end, {desc = "DAP: conditional breakpoint" })
vim.keymap.set('n', '<Leader>di', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "DAP: input breakpoint" })

vim.keymap.set('n', '<Leader>de', function() require('dapui').eval() end, { desc = "DAP: evaluate" })
vim.keymap.set('n', '<Leader>dE', function() require('dapui').eval(vim.fn.input '[Expression] > ') end, { desc = "DAP: evaluate input" })

vim.keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end,   { desc = "DAP: hover" })
vim.keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end, { desc = "DAP: preview" })
vim.keymap.set('n', '<Leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end, { desc = "DAP: frames" })
vim.keymap.set('n', '<Leader>ds', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end, { desc = "DAP: scopes" })
-- vim.keymap.set({'n', 'v'}, '<Leader>ds', function() require('dap.ui.widgets').scopes() end,  { desc = "dap scopes" })
-- vim.keymap.set('n', '<Leader>dS', function() require('dap').session() end, { desc = "dap session" })
-- vim.keymap.set('n', '<Leader>dk', function() require('dap').repl.open() end, { desc = "open repl" })
-- vim.keymap.set('n', '<Leader>dc', function() require('dap').repl.close() end, { desc = "close repl" })


--------------------------------- quickfix 快捷键 -------------------------------
vim.keymap.set('n', "<leader>cn", "<cmd>cnext<CR>",     { desc = "cnext" })
vim.keymap.set('n', "<leader>cp", "<cmd>cprevious<CR>", { desc = "cprev" })
vim.keymap.set('n', "<leader>cw", "<cmd>cwindow<CR>",   { desc = "cwindow" })
vim.keymap.set('n', "<leader>cx", "<cmd>cclose<CR>",    { desc = "cclose" })
vim.keymap.set('n', "<leader>co", "<cmd>copen<CR>",     { desc = "copen" })


------------------------------------- snacks -----------------------------------
-- Zen 专注编程模式
vim.keymap.set('n', "<leader>uz", "<cmd>lua require('snacks').zen()<cr>", { desc = "Zen" })
-- colorscheme 主题
vim.keymap.set('n', "<leader>uC", "<cmd>lua require('snacks').picker.colorschemes()<cr>", { desc = "Colorschemes" })
-- 在屏幕下面打开终端
vim.keymap.set('n', "<C-/>", "<cmd>lua require('snacks').terminal()<cr>", { desc = "Toggle Terminal" })
-- 重命名文件名
vim.keymap.set('n', "<leader>cR", "<cmd>lua require('snacks').rename.rename_file()<cr>", { desc = "Rename File" })
-- 搜索过的文本记录
vim.keymap.set('n', "<leader>s/", "<cmd>lua require('snacks').picker.search_history()<cr>", { desc = "Searched History" })

-- Notifier
vim.keymap.set('n', "<leader>sn", "<cmd>lua require('snacks').picker.notifications()<cr>", { desc = "Notification" })
-- all notification
vim.keymap.set('n', "<leader>uy", "<cmd>lua require('snacks').notifier.show_history()<cr>", { desc = "Notification History" })
-- hide notifier
vim.keymap.set('n', "<leader>un", "<cmd>lua require('snacks').notifier.hide()<cr>", { desc = "Dismiss All Notifications" })

-- LSP
vim.keymap.set('n', "<leader>ss", "<cmd>lua require('snacks').picker.lsp_symbols()<cr>", { desc = "LSP Symbols" })
vim.keymap.set('n', "<leader>sS", "<cmd>lua require('snacks').picker.lsp_workspace_symbols()<cr>", { desc = "LSP Workspace Symbols" })

-- Scratch 一个便签的功能
vim.keymap.set('n', "<leader>.", "<cmd>lua require('snacks').scratch()<cr>", { desc = "Toggle Scratch Buffer" })
vim.keymap.set('n', "<leader>st", "<cmd>lua require('snacks').scratch.select()<cr>", { desc = "Scratch Select" })

-- LazyGit
vim.keymap.set('n', "<leader>zf", "<cmd>lua require('snacks').lazygit.log_file()<cr>", { desc = "Lazygit: Current File Git History" })
vim.keymap.set('n', "<leader>zg", "<cmd>lua require('snacks').lazygit()<cr>", { desc = "Lazygit: Toggle Open" })
vim.keymap.set('n', "<leader>zl", "<cmd>lua require('snacks').lazygit.log()<cr>", { desc = "Lazygit: Git Log (cwd)" })

-- Find
vim.keymap.set('n', "<leader>fc", "<cmd>lua require('snacks').picker.files({ cwd = vim.fn.stdpath('config') }) <cr>", { desc = "Find Config File" })
vim.keymap.set('n', "<leader>ff", "<cmd>lua require('snacks').picker.files() <cr>", { desc = "Find Files" })
vim.keymap.set('n', "<leader>fg", "<cmd>lua require('snacks').picker.git_files()<cr>", { desc = "Find Git Files" })
-- 搜索最近打开的文件
vim.keymap.set('n', "<leader>fr", "<cmd>lua require('snacks').picker.recent()<cr>", { desc = "Recent" })
vim.keymap.set('n', "<leader>ft", "<cmd>lua require('snacks').picker.smart()<cr>", { desc = "Smart Find Files" })
vim.keymap.set('n', "<leader>fb", "<cmd>lua require('snacks').picker.buffers()<cr>", { desc = "Buffers" })
vim.keymap.set('n', "<leader>fB", "<cmd>lua require('snacks').picker.buffers({ hidden = true, nofile = true, })<cr>", { desc = "Buffers(all)" })
-- 搜索项目目录
vim.keymap.set('n', "<leader>fp", "<cmd>lua require('snacks').picker.projects()<cr>", { desc = "Projects" })

-- Git
vim.keymap.set('n', "<leader>gd", "<cmd>lua require('snacks').picker.git_diff()<cr>", { desc = "Git Diff (Hunks)" })
vim.keymap.set('n', "<leader>gf", "<cmd>lua require('snacks').picker.git_log_file()<cr>", { desc = "Git Log File" })
vim.keymap.set('n', "<leader>gg", "<cmd>lua require('snacks').picker.git_log()<cr>", { desc = "Git Log" })
vim.keymap.set('n', "<leader>gb", "<cmd>lua require('snacks').picker.git_branches()<cr>", { desc = "Git Branches" })
vim.keymap.set('n', "<leader>gB", "<cmd>lua require('snacks').gitbrowse()<cr>", { desc = "Git Browse" })
vim.keymap.set('n', "<leader>gs", "<cmd>lua require('snacks').picker.git_status()<cr>", { desc = "Git Status" })
vim.keymap.set('n', "<leader>gS", "<cmd>lua require('snacks').picker.git_stash()<cr>", { desc = "Git Stash" })

-- 搜索项目Diagnostics
vim.keymap.set('n', "<leader>sd", "<cmd>lua require('snacks').picker.diagnostics()<cr>", { desc = "Diagnostics" })
vim.keymap.set('n', "<leader>sD", "<cmd>lua require('snacks').picker.diagnostics_buffer()<cr>", { desc = "Buffer Diagnostics" })

-- Grep Word
vim.keymap.set('n', "<leader>sg", "<cmd>lua require('snacks').picker.grep()<cr>", { desc = "Grep Current Dir" })
vim.keymap.set('n', "<leader>sw", "<cmd>lua require('snacks').picker.grep_word()<cr>", { desc = "Visual selection or word" })
vim.keymap.set('n', "<leader>sb", "<cmd>lua require('snacks').picker.grep_buffers()<cr>", { desc = "Grep Buffer" })
vim.keymap.set('n', "<leader>sB", "<cmd>lua require('snacks').picker.lines()<cr>", { desc = "Buffer Lines" })

-- search
vim.keymap.set('n', "<leader>sa", "<cmd>lua require('snacks').picker.autocmds()<cr>", { desc = "Autocmds" })
vim.keymap.set('n', "<leader>sc", "<cmd>lua require('snacks').picker.command_history()<cr>", { desc = "Command History" })
vim.keymap.set('n', "<leader>sC", "<cmd>lua require('snacks').picker.commands()<cr>", { desc = "Commands" })
vim.keymap.set('n', "<leader>se", "<cmd>lua require('snacks').explorer()<cr>", { desc = "File Explorer" })
vim.keymap.set('n', "<leader>sh", "<cmd>lua require('snacks').picker.help()<cr>", { desc = "Help Pages" })
vim.keymap.set('n', "<leader>sH", "<cmd>lua require('snacks').picker.highlights()<cr>", { desc = "Highlights" })
vim.keymap.set('n', "<leader>si", "<cmd>lua require('snacks').picker.icons()<cr>", { desc = "Icons" })
vim.keymap.set('n', "<leader>sj", "<cmd>lua require('snacks').picker.jumps()<cr>", { desc = "Jumps" })
vim.keymap.set('n', "<leader>sk", "<cmd>lua require('snacks').picker.keymaps()<cr>", { desc = "Keymaps" })
vim.keymap.set('n', "<leader>sl", "<cmd>lua require('snacks').picker.loclist()<cr>", { desc = "Location List" })
vim.keymap.set('n', "<leader>sm", "<cmd>lua require('snacks').picker.marks()<cr>", { desc = "Marks" })
vim.keymap.set('n', "<leader>sM", "<cmd>lua require('snacks').picker.man()<cr>", { desc = "Man Pages" })
vim.keymap.set('n', "<leader>sr", "<cmd>lua require('snacks').picker.registers()<cr>", { desc = "Registers" })
vim.keymap.set('n', "<leader>sR", "<cmd>lua require('snacks').picker.resume()<cr>", { desc = "Resume" })
--  显示当前文件的修改列表
vim.keymap.set('n', "<leader>sq", "<cmd>lua require('snacks').picker.qflist()<cr>", { desc = "Quickfix List" })
-- 显示undo树
vim.keymap.set('n', "<leader>su", "<cmd>lua require('snacks').picker.undo()<cr>", { desc = "UndoTree" })


------------------------------------- gitsigns -----------------------------------
-- 显示neovim的新闻
vim.keymap.set('n', "<leader>pn", function() require('snacks').win({
    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
    width = 0.6, height = 0.6,
    wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3, },
}) end, { desc = "Neovim News", })

-- Navigation
vim.keymap.set('n', ']h', function() if vim.wo.diff then return ']c' end
        vim.schedule(function() require('gitsigns').next_hunk() end)
    return '<Ignore>' end, { expr = true, desc = "Git Next Hunk" })

vim.keymap.set('n', '[h', function() if vim.wo.diff then return '[c' end
        vim.schedule(function() require('gitsigns').prev_hunk() end)
    return '<Ignore>' end, { expr = true, desc = "Git Prev Hunk" })

-- 撤销提交暂存区，即undo
vim.keymap.set({ 'n', 'v' }, '<leader>gu', require('gitsigns').undo_stage_hunk, { desc = "Git Undo Stage Hunk" })
-- 重置当前行的改动
vim.keymap.set({ 'n', 'v' }, '<leader>gr', require('gitsigns').reset_hunk, { desc = "Git Reset Hunk" })

-- 查看上一处的改动
vim.keymap.set('n', '<leader>gk', require('gitsigns').prev_hunk, { desc = "Git Prev Hunk" })
-- 查看下一处的改动
vim.keymap.set('n', '<leader>gj', require('gitsigns').next_hunk, { desc = "Git Next Hunk" })
-- 重置当前buffer的改动
vim.keymap.set('n', '<leader>gR', require('gitsigns').reset_buffer, { desc = "Git Reset Buffer" })

-- 显示出当前buffer被删除的行
vim.keymap.set('n', '<leader>gt', require('gitsigns').toggle_deleted, { desc = "Git Toggle Deleted" })

vim.keymap.set('n', '<leader>gl', function() require('gitsigns').blame_line { full = true } end, { desc = "Git Blame Line" })

-- 新建窗口显示差异，类似git diff
-- vim.keymap.set('n', '<leader>gd', require('gitsigns').diffthis, { desc = "Git Diff" }) -- 用snacks的diff代替
vim.keymap.set('n', '<leader>gD', function() require('gitsigns').diffthis('~') end, { desc = "Git All Diff" })

-- 预览当前行的改动，即diff
vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk, { desc = "Git Preview Hunk" })
-- 在当前行上面显示修改
vim.keymap.set('n', '<leader>gi', require('gitsigns').preview_hunk_inline, { desc = "Git Preview Hunk Inline" })

-- 选择当前修改过的代码
vim.keymap.set('n', '<leader>ge', require('gitsigns').select_hunk, { desc = "Git Select Hunk" })

-- 在当前行的后面显示提交记录
vim.keymap.set('n', '<leader>gc', require('gitsigns').toggle_current_line_blame, { desc = "Git Toggle Current Line Blame" })

--  显示当前项目的所有修改列表
vim.keymap.set('n', '<leader>gQ', function() require('gitsigns').setqflist('all') end, { desc = "Git Project List" })


------------------------------------- Lspsaga -----------------------------------
-- 查看错误的提示
vim.keymap.set('n', 'go', "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Lsp Diagnostic Show" })
-- vim.keymap.set('n', 'go', vim.diagnostic.open_float, opts) -- 和上面的一样效果，就是显示不如上面好看
-- 集中列出所有的错误提示
-- vim.keymap.set('n', 'gl', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', 'gl', "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Lsp Diagnostic List" })

-- 跳转到上一个错误提示的地方
-- vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'g[', "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Lsp Diagnostic Prev" })
-- 跳转到下一个错误提示的地方
-- vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'g]', "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Lsp Diagnostic Next" })

-- 显示函数定义
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'gd', "<cmd>Lspsaga peek_definition<CR>", { desc = "Lsp Show Definition" })
-- 跳转到函数声明
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gD', "<cmd>Lspsaga goto_definition<CR>", { desc = "Lsp Goto Definition" })

-- 将当前行的改动提交到暂存区，即add
vim.keymap.set('n', 'gs', require('gitsigns').stage_hunk,   { desc = "Git Stage Hunk" })
-- 将当前buffer的改动提交到暂存区
vim.keymap.set('n', 'gS', require('gitsigns').stage_buffer, { desc = "Git Stage Buffer" })

-- 显示当前变量的类型
-- vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', 'gt', "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Lsp Show Type Definition" })
-- 跳转到当前变量的类型
vim.keymap.set('n', 'gT', "<cmd>Lspsaga goto_type_definition<CR>", { desc = "Lsp Goto Type Definition" })

-- 类似fzf显示使用过该变量的行
vim.keymap.set('n', 'gf', "<cmd>Lspsaga finder<CR>", { desc = "Lsp Finder" })
-- implementation
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Lsp Goto Implementation" })
-- 列出引用过该变量或函数的地方
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Lsp References" })

-- 查看函数原型
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) -- 下面的更加美观
vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", { desc = "Lsp Hover Doc" })
-- 插入模式下看函数原型
-- vim.keymap.set('i', '<C-k>', vim.lsp.buf.hover, bufopts)
vim.keymap.set('i', '<C-k>', "<cmd>Lspsaga hover_doc<CR>", { desc = "Lsp Hover Doc" })

-- 重命名变量名
-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts) -- 和下面的一样的功能，就是显示和细节不一样，总的来说下面的好看点。
vim.keymap.set('n', 'gm', "<cmd>Lspsaga rename<CR>", { desc = "Lsp Rename" })
-- 修正错误code action
-- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- 和下面一样的功能，下面好看
vim.keymap.set('n', 'ga', "<cmd>Lspsaga code_action<CR>", { desc = "Lsp Code Action" })

-- 函数树，替代来aerial.nvim，按键o用来折叠展开或进入，q离开，e进入
vim.keymap.set('n', '<leader>2', "<cmd>Lspsaga outline<CR>", { desc = "Lsp Outline" })
-- 添加工作目录
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = "Workspace: Add Folder" })
-- 移除当前文件的详细目录
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = "Workspace: Remove Folder" })
-- 列出当前nvim的工作目录
vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "Workspace: List Folders" })

-- 代码自动格式化，不过这个用插件ok
vim.keymap.set('n', '<leader>cf', function() require("conform").format {async = true, lsp_fallback = true } end, { desc = "Conform Format" })
vim.keymap.set('n', '<leader>cF', function() vim.lsp.buf.format { async = true, } end, { desc = "Lsp Format" })

-- vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, bufopts)


