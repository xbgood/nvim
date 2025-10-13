--------------------------------------------------
--  一、编辑体验
--------------------------------------------------
vim.o.writebackup   = false         -- 写入时也不备份
vim.o.autowriteall  = true          -- 文件变动自动保存
vim.o.autoread      = true          -- 文件外部变动时自动载入
vim.o.hidden        = true          -- 允许缓冲区未保存时就切换
vim.o.mouse         = "a"           -- 全模式启用鼠标
vim.o.mousehide     = true          -- 输入文本的时候隐藏光标
vim.o.clipboard     = "unnamedplus" -- 与系统剪贴板互通
vim.o.showmatch     = true          -- 是否在插入括号时短暂跳转到另一半括号上
vim.o.ruler         = true          -- 打开状态栏标尺
vim.o.foldenable    = true          -- 是否开启代码折叠
vim.o.foldmethod    = "indent"      -- 指定代码折叠的策略是按照缩进进行的
vim.o.foldlevel     = 1             -- 指定代码折叠的最低层级为 1
vim.o.foldlevelstart= 99            -- 打开文件默认不折叠
vim.o.spell         = false         -- 是否开启单词拼写检查
vim.o.spelllang     = "en_us,cjk"   -- 设定单词拼写检查的语言
vim.o.iskeyword     = "@,48-57"     -- 分词分割

--------------------------------------------------
--  二、界面 & 视觉
--------------------------------------------------
vim.o.termguicolors = true          -- 24 位真色
vim.o.number        = true          -- 绝对行号
vim.o.relativenumber= true          -- 相对行号
vim.o.signcolumn    = "yes"         -- 始终 1 列 sign yes:1
vim.o.cursorline    = true          -- 当前行高亮
vim.o.cursorcolumn  = true          -- 当前列高亮（按需）
vim.o.scrolloff     = 8             -- 上下保留 8 行
vim.o.sidescrolloff = 8             -- 左右保留 8 列
vim.o.wrap          = true          -- 折行
vim.o.linebreak     = false         -- 抵达边界才折行（需 wrap=true）
vim.o.showmode      = true          -- 状态栏插件会显示模式，这里关掉
vim.o.showcmd       = true          -- 右下角显示未打完的命令
vim.o.conceallevel  = 2             -- 隐藏文本，不显示替代字符
vim.o.concealcursor = "nvc"         -- 设置conceal自动隐藏文本
vim.o.list          = false         -- 显示不可见字符
-- 用来替换tab、空格和换行符等的modern符号，需要打开vim.o.list生效
vim.o.listchars     = "tab:▸ ,trail:·,nbsp:+,space:␣,eol:↲"

--------------------------------------------------
--  三、搜索 & 补全
--------------------------------------------------
vim.o.incsearch     = true          -- 增量搜索
vim.o.hlsearch      = true          -- 高亮搜索结果
vim.o.smartcase     = true          -- 含大写时自动区分大小写
vim.o.ignorecase    = true          -- 搜索忽略大小写
vim.o.pumheight     = 20            -- 补全菜单最大高
vim.o.wildoptions   = "pum,fuzzy"   -- 命令行浮窗 + 模糊匹配
vim.o.wildmenu      = false         -- 命名行模式补全，用pum就不用它
vim.o.whichwrap     = "b,s<,>,[,],h,l"           -- 行结尾可以跳到下一行
vim.o.wildmode      = "list:longest,full"        -- 设定命令的补全列表
vim.o.complete      = ".,s,k,w,b,u,i,t,d"        -- 设定自带补全的来源
vim.o.completeopt   = "menuone,noselect,preview" -- 原生补全体验

--------------------------------------------------
--  四、Tab / 缩进 / 格式化
--------------------------------------------------
vim.o.tabstop       = 4             -- 缩进4个空格等于一个Tab
vim.o.shiftwidth    = 4             -- 自动缩进宽度
vim.o.softtabstop   = 4             -- 退格/插入时 Tab 粒度
vim.o.expandtab     = true          -- 用空格代替 Tab
vim.o.autoindent    = true          -- 自动缩进：新行保持上一行缩进
vim.o.smartindent   = true          -- 简单智能缩进
vim.o.shiftround    = true          -- 缩进时对其2倍数

--------------------------------------------------
--  五、性能 & 视觉反馈
--------------------------------------------------
vim.o.updatetime    = 200           -- 无操作时交换文件写到磁盘的等待毫秒数
vim.o.timeout       = true          -- 按钮超时检测
vim.o.timeoutlen    = 300           -- 按键超时时长毫秒数（which-key 友好） 
vim.o.ttimeoutlen   = 50            -- vim响应按键时长
vim.o.redrawtime    = 1000          -- 最大重画时间（大文件防卡）
vim.o.lazyredraw    = false         -- 宏录制时实时重画（true 会闪）
vim.o.winblend      = 0             -- 浮动窗透明度（0-100）
vim.o.pumblend      = 20            -- 补全菜单透明度

--------------------------------------------------
--  六、split / 窗口行为
--------------------------------------------------
vim.o.splitbelow    = true          -- 新 split 放在下方
vim.o.splitright    = true          -- 新 vsplit 放在右侧
vim.o.equalalways   = true          -- 自动等宽/等高所有窗口
vim.o.cmdheight     = 1             -- 命令行高度（0 会堵消息）
vim.o.showtabline   = 0             -- tabline标签栏
vim.o.laststatus    = 0             -- statusline状态栏

--------------------------------------------------
--  七、文件 / 编码
--------------------------------------------------
vim.o.encoding      = "utf-8"       -- 设定各种文本的字符编码
vim.o.fileencoding  = "utf-8"       -- 文件编码方式
vim.o.fileformat    = "unix"        -- 行尾符风格
vim.o.filetype      = "plugin"      -- 设定自动缩进的策略为 plugin
vim.o.syntax        = "off"         -- 语法高亮
vim.o.swapfile      = false         -- 不生成 swap
vim.o.backup        = false         -- 不生成 backup~
vim.o.undofile      = true          -- 持久撤销
-- undo 保存的文件目录 ~.cache/nvim/undo
vim.o.undodir       = vim.fn.stdpath("cache") .. "/undo"

--------------------------------------------------
--  八、高级现代特性和其他
--------------------------------------------------
vim.o.smoothscroll  = true          -- 半屏滚动时平滑（0.10+）
vim.o.mousemodel    = "extend"      -- 右键扩展选择（常规习惯）
vim.o.jumpoptions   = "stack"       -- 跳转列表行为（0.9+）
vim.o.formatoptions = "jcroqlnt"    -- 智能格式化标志
vim.o.shortmess     = "atI"         -- 不显示启动提示信息
-- 更智能 diff: 左右分屏 + 忽略行尾空格 + 上下文 3 行 + 行内单词差异
vim.o.diffopt = 'internal,filler,context:3,iblank,vertical,linematch:60'
-- 列分割提示线，表示在100和150列处各有一条竖线，用来提醒代码行长度
-- vim.o.colorcolumn   = "100,150"


