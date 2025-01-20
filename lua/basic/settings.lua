-- 设定各种文本的字符编码
vim.o.encoding = "utf-8"
-- 文件编码方式
vim.o.fileencoding = "utf-8"
-- 不显示启动提示信息
vim.o.shortmess = "atI"
-- 设定在无操作时，交换文件刷写到磁盘的等待毫秒数（默认为 4000）
vim.o.updatetime = 100
-- 设定等待按键时长的毫秒数
vim.o.timeoutlen = 500
-- 是否在屏幕最后一行显示命令
vim.o.showcmd = true
-- 显示左侧的图标提示列
vim.o.signcolumn = "yes"
-- 右侧代码长度参考线
-- vim.o.colorcolumn = "160"
-- 是否允许缓冲区未保存时就切换
vim.o.hidden = true
-- 输入文本的时候隐藏光标
vim.o.mousehide = true
-- 设置conceal自动隐藏文本
vim.o.concealcursor = "i"
-- 完全不显示隐藏文本
vim.o.conceallevel = 3
-- 是否开启 xterm 兼容的终端 24 位色彩支持
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 是否高亮当前文本行
vim.o.cursorline = true
-- 是否开启语法高亮
vim.o.syntax = "enable"
-- 是否显示绝对行号
vim.o.number = false
-- 是否显示相对行号
vim.o.relativenumber = false
-- 设定光标上下两侧最少保留的屏幕行数
vim.o.scrolloff = 10
-- 是否支持鼠标操作
vim.o.mouse = "a"
-- 补全菜单高度显示20行
vim.o.pumheight = 20
-- 是否启用系统剪切板
vim.o.clipboard = "unnamedplus"
-- 是否开启备份文件
vim.o.backup = false
vim.o.writebackup = false
-- 是否开启交换文件
-- vim.o.swapfile = false
-- 是否特殊显示空格等字符
vim.o.list = true
-- 不可见字符显示为一个点
-- vim.o.listchars = "space:*"
-- 是否开启自动缩进
vim.o.autoindent = true
-- 设定自动缩进的策略为 plugin
vim.o.filetype = "plugin"
-- 是否开启高亮搜索
vim.o.hlsearch = true
-- 边输入边搜索
vim.o.incsearch = true
-- 是否在搜索时忽略大小写
vim.o.ignorecase = true
-- 是否开启在搜索时如果有大写字母，则关闭忽略大小写的选项
vim.o.smartcase = true
-- 命令行行高
vim.o.cmdheight = 1
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
-- 设置自动保存
vim.o.autowriteall = true
-- 禁止折行
vim.o.wrap = true
-- 行结尾可以跳到下一行
vim.o.whichwrap = "b,s<,>,[,],h,l"
-- 是否在插入括号时短暂跳转到另一半括号上
vim.o.showmatch = true
-- 命名行模式智能补全
vim.o.wildmenu = true
-- 设定命令的补全列表
vim.o.wildmode = "list:longest,full"
-- 代码补全
vim.o.completeopt = "menuone,preview,noselect"
-- 设定自带补全的来源
vim.o.complete = ".,s,k,w,b,u,i,t,d"
-- 是否开启单词拼写检查
vim.o.spell = true
-- 设定单词拼写检查的语言
vim.o.spelllang = "en_us,cjk"
-- 是否开启代码折叠
vim.o.foldenable = true
-- 指定代码折叠的策略是按照缩进进行的
vim.o.foldmethod = "indent"
-- 指定代码折叠的最高层级为 1
vim.o.foldlevel = 1
-- 打开默认不折叠
vim.o.foldlevelstart = 99
-- 缩进4个空格等于一个Tab
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 4
-- 空格替代tab
vim.o.expandtab = true
-- 打开状态栏标尺
vim.o.ruler = true
-- 逐行滚动
vim.o.smoothscroll = true
-- 分词: 带有如下符号的单词不被分割
vim.o.iskeyword = "-,@,$,%,#,48-57"
-- 滚动的时候距离上下边框空出3行
vim.o.scrolloff = 3
