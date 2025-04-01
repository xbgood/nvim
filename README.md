
# buffer
```lua
vim a b c d   打开abcd四个buffer文件
:e file       新开buffer创建一个file文件
:badd file    新开buffer创建一个file文件，光标保持当前buffer
:new file     横向打开file文件
:vnew file    纵向打开file文件

:bn           正向遍历buffer :bnext
:bp           前向遍历buffer :bprevious
:bf           跳转到开头的buffer :bfirst
:bl           跳转到结尾的buffer :blast
:ls           列出所有buffer
:bd           关闭当前buffer (bdelete)
:3,5bd        关闭3-5 buffer

,bl           列出所有buffer
,bc           关闭当前buffer
C-h/l         切换到上/下一个缓冲区
C-q           关闭当前buffer
```

# buffer, window, tab
```lua
vim file1 file2 file3       以buffer的形式打开三个文件，这是最常用的
vim -p file1 file2 file3    以tab的形式打开三个文件
vim -o/O file1 file2 file3  以window的形式打开文件并分屏，用-O垂直分屏用于对比文件
```

# quickfix
```lua
,cn cnext     光标跳到下一个编译错误
,cp cprevious 光标跳到上一个编译错误
,cw cwindow   如果有错误列表，则打开quickfix窗口
,cx cclose    关闭quickfix窗口
,co copen     打开quickfix窗口

:cc           显示错误详细信息
:cl           列出所有的编译错误
:cnfile       移动到下一个文件的第一个匹配处
:cpfile       移动到上一个文件的最后匹配处

```
# Comment
```lua
gcc    行注释
gbc    块注释
gc     可视模式下的注释
gb     可视模式下的块注释
gcO    在当前行上方新增行注释
gco    在当前行下方新增行注释
gcA    在当前行行尾新增行注释
```


# flash
```lua
s     搜索并跳转到单词
```

# yazi.nvim
```lua
,1 打开yazi

目录导航：
    j：向下移动光标
    k：向上移动光标
    h：返回上一级目录
    l：进入选中目录

处理文件：
    d：删除选中文件
    x：剪切选中文件
    y：复制选中文件
    p：粘贴文件
    r：重命名文件

其他：
    .：显示隐藏文件
    q：退出
    ~：打开帮助
    Z：使用 fzf 跳转到目录或显示文件（需要安装 fzf ）
```

# nvim-tree
```lua
,1      打开文件目录导航
,fc     打开当前文件所在的目录

-- 默认按键
-     ：返回上层目录
o     ：打开
a     ：新增
r     ：重命名
x     ：剪切
c     ：复制
d     ：删除
p     ：粘贴
y     ：复制文件名称
Y     ：复制文件相对路径
gy    ：复制文件绝对路径
s     ：使用系统默认程序打开目录或文件
<Tab> ：将文件添加到缓冲区，但不移动光标
<C-v> ：垂直分屏打开文件
<C-x> ：水平分屏打开文件
<C-]> ：进入光标下的目录
<C-r> ：重命名目录或文件，删除已有目录名称
I     ：切换隐藏文件/目录的可见性
H     ：切换点文件的可见性
R     ：刷新资源管理器

另外，文件资源管理器操作和操作文档方式一致，可按 / ? 进行搜索
```

# blink.cmp
```lua
Tab       下一条补全
Shift-Tab 上一条补全
C-n       下一条补全
C-p       上一条补全
C-d       代码左移4格
C-f       代码右移4格
C-e       关闭或出现补全
<CR>      选择补全
```

# nvim-dap
对于脚本语言，按 `f9` 打上断点，然后按 `f5` 即可开始断点执行。

对于编译语言如 `c/c++` 等，需要先编译成可执行文件，再按 `f9` 打上断点后，按 `f5` 开始执行，执行的时候需要输入可执行文件名，如 `a.out`，然后将可以调试了。

```lua
F5   continue  开始执行
F9   toggle breakpoint 打上断点
F10  step into 进入函数单步调试
F11  step over 跳过函数执行
F12  step out
F8   terminate 关闭调试界面

,dq  关闭dap的调试
,dl  运行到上一次的运行结果
,du  打开关闭dap的ui界面
,dt  step back
,de  toggle pause
,dr  toggle repl
,dd  disconnect
,dR  run to cursor
,dc  添加自定义名字的断点
,di  添加条件变量

,de  evaluate
,dE  evaluate input

,dh  dap hover
,dp  dap preview

,df  dap frames
,ds  dap scopes
```
dapui 的配置主要以 element为基础，每个 element 代表一个提供对应功能的窗口。我们先来根据它默认的配置来讲解每部分的含义

首先最上面的 icons 表示，各个部分显示的图标，这里分别定义了展开的，合并的以及当前位置的图标信息，我们可以观察一下变量栏或者调用栈显示信息的左侧就可以看到这里定义的图标。
mappings 代表的是部分窗口动作定义的快捷键。例如上面定义的 expand = { “<CR>”, “<2-LeftMouse>” }表示可以在待展开项上按下回车或者鼠标左键双击来展开。

element_mappings表示的是我们为某些窗口特意定制的一些快捷键。例如上面注释的是针对调用栈定义的快捷键。

layouts代表布局，每个布局都有一个子table，而每个子table主要由 elements、size、position组成，它们分别代表采取该种布局的元素(也可以说是窗口)，窗口大小以及窗口的位置。窗口一般通过id来描述，每种窗口都有固定的ID，根据官方文档的描述，它支持这么几种窗口:

- scopes显示全局或者当前局部变量，它支持的操作主要是 edit编辑变量的值、expand展开结构化的变量、repl将变量拷贝到repl窗口
- stacks显示当前正在运行的线程以及它们对应的调用栈，它主要支持的操作是 open :运行代码到当前被选中的位置， toggle:打开或者关闭该窗口
- watches显示我们需要追踪的变量，它支持的主要操作是 edit: 输入想要追踪的变量或者给对应的变量赋值。expand: 展开结构化的变量，remove:删除当前监视的变量，repl:将变量拷贝到repl窗口
- breakpoints显示当前激活的断点。它支持的主要操作有 open:执行代码到当前选中的断点处, toggle :激活或者使当前断点无效
- repl显示repl窗口
- console显示控制台窗口

这些窗口的这些操作的快捷键我们已经通过上方的 mappings做了定义了，只要保持光标在对应窗口然后按下快捷键就可以执行对应的窗口命令了。如果想要单独对窗口进行快捷键定义可以在element_mappings 中被注释的代码

controls 部分配置的是在repl窗口上方显示的那一堆调试按钮。由于我们定义了一些快捷键，这些按钮没太大的作用。这里我不需要它显示调试用的按键，所以我就在 controls 项中设置 enabled = false 禁用它。

floating、window、render则定义的是悬浮窗口样式和普通窗口的一些样式。这里就不深究了。

repl 窗口的主要命令如下:
```sh
    .exit: 退出/关闭一个 repl 窗口
    .c/.continue: 继续执行代码
    .n/.next: 执行下一行代码
    .into: 跳转到函数中继续执行
    .out: 跳出函数
    .scopes: 打印当前栈的一些变量信息
    .threads: 打印线程信息
    .frames: 打印当前线程的调用栈
    .capabilities: 打印当前适配器实现的一些功能
    .p 暂停当前运行的程序
    .up                 Same as |dap.up|
    .down               Same as |dap.down|
    .goto               Same as |dap.goto_|
```
见 dap.repl.commands


# lspsaga
```lua
go       查看错误的提示
gl       集中列出所有的错误提示

g[       跳转到上一个错误提示
g]       跳转到下一个错误提示

gd       显示函数定义
gD       跳转到函数定义处

gs       将当前行的改动提交到暂存区 git add。stage hunk
gS       将当前buffer的改动提交到暂存区 stage buffer

gt       显示当前变量的类型
gT       跳转到当前变量的类型定义处

gf       列出该变量出现行，类似fzf搜索
gi       显示 implementation #TODO
gr       列出光标下所有引用

K        normal模式下查看函数原型
Ctrl+k   insert模式下查看函数原型

gm       重命名变量名
ga       修正错误code action

,2       显示函数树导航
,wa      添加工作目录
,wr      移除工作目录
,wl      列出工作目录

,cf      代码格式化
```

# gitsigns

git 中用 `hunk` 表示一个文件中邻近区域中的代码修改块。

```lua
[h 查看上一处的改动 prev hunk
]h 查看下一处的改动 next hunk

,gu 撤销当前行提交到暂存区的hunk，即 undo stage hunk
,gr 重置当前行的hunk，相当于回到修改前的状态reset hunk

,gk 查看上一处的改动 prev hunk
,gj 查看下一处的改动 next hunk
,gR Git Reset buffer

,gt 显示/关闭当前buffer被删除的行
,gl 显示当前文件的修改列表

-- ,gd 新建窗口显示当前文件的差异，即 git diff
,gD 新建窗口显示当前文件的差异，即 git diff ~

,gp 浮动显示预览当前行的修改，即 diff
,gi 在当前行上面显示修改

,ge 选择当前修改过的代码 select hunk
,gc 在当前行的后面灰色显示上次该行的提交记录 toggle current line blame
,gQ 显示当前项目的所有修改列表
```

# snacks
```lua
,us    打开/关闭 spell拼写检查
,uw    打开/关闭 折行
,uL    打开/关闭 相对行号
,ul    打开/关闭 行号
,ud    打开/关闭 diagnostics
,uc    打开/关闭 conceal
,uT    打开/关闭 treesitter
,ub    打开/关闭 背景
,uh    打开/关闭 内嵌提示，inlay hint，函数的参数名提示等
,ug    打开/关闭 indentline
,uD    打开/关闭 只显示关注的代码，跳暗未使部分dim

,uz    打开/关闭 无干扰zen编程
,uC    搜索主题
Ctrl+/ 打开终端
,cR    重命名文件 
,s/    打开搜索过的文本记录

-- notifier
,sn    打开历史提醒记录
,uy    显示所有的提醒
,un    隐藏提醒记录

-- lsp
,ss  搜索函数树 lsp symbols
,sS  搜索 lsp workspace symbols

-- scratch
,.     打开/关闭 当前buffer的记事本
,st    打开 所有buffer 的记事本

-- lazygit
,lf  lazygit 当前文件的历史记录
,lg  打开lazygit
,ll  lazygit打开log记录

-- Find 搜索文件
,fc  查找nvim配置文件
,ff  查找当前目录下的文件
,fg  查找git所在项目的文件
,fr  查找最近打开的文件
,ft  查找文件更加聪明的算法
,fb  查找当前打开的buffer
,fB  查找所有的buffers，包括隐藏buffers
,fp  搜索项目project

-- Git
,gd  git diff     搜索diff   
,gf  git log file 搜索当前文件的log
,gg  git log      搜索项目的log
,gb  git branches 显示branch
,gB  git browse   在浏览器中打开github项目
,gs  git status   显示当前项目的status
,gS  git stash

-- diagnostics
,sd  搜索diagnostics
,sD  搜索 Buffer diagnostics

-- 搜索文本
,sg  Grep搜索
,sw  搜索当前光标所在单词在当前目录中的所有文件的位置
,sb  搜索打开的buffer的单词
,sB  搜索单词显示行号

-- search
,sa  搜索自动执行的命令 autodcmds
,sc  搜索使用过的历史命令 command history
,sC  搜索系统的所有命令 commands
,se  添加snacks的文件浏览器 explorer
,sh  搜索帮助 help
,sH  搜索高亮 highlights
,si  搜索所有的图标 icons
,sj  搜索跳转历史 jumps
,sk  搜索快捷键 keymaps
,sl  搜索 loclist
,sm  搜索标记 marks
,sM  搜索 man pages
,sr  搜索 registers
,sR  搜索 Resume
,sq  搜索 quickfix list
,su  搜索 undo tree
```

# surround
```lua
cs 字符 字符：修改包裹
ds 字符     ：删除包裹
ys 范围 字符：增加包裹
```

# grug-far
替换文本的插件
```lua
,sf    只替换当前文件
,sw    搜索当前单词
```

# 多光标
## vim-visual-multi
用法：
用f+字符来搜索下一个字符，可以快速定位到字符。
用 C-n 选中单词，然后使用n选择下一个同样的单词，按q跳过当前单词并选中下一个。
选中完成后，可以使用i,a,I,A 等vim编辑操作进入insert模式，开始修改文本.

快捷键：
```bash
Shift-arrows 精确选择一个字符
C-n          选择单词
C-up/down    创建垂直选择
q            跳过当前选择，选中下一个
Q            移除当前的选择
n            向后选择
N            向前选择
Esc          退出
```

## jake-stewart/multicursor.nvim
用法：
用 C-n 选中单词，然后使用n选择下一个同样的单词，按q跳过当前单词并选中下一个。
选中完成后，可以使用i,a,I,A 等vim编辑操作进入insert模式，开始修改文本.

快捷键：
```bash
C-n          选择单词
up/down      创建垂直选择
left/right   在选择的光标之间跳转
,x           删除一个光标
q            跳过当前选择，选中下一个
Q            移除当前的选择
n            向后选择
N            向前选择
Esc          退出
```

# undotree
查看undotre
```lua
,3
```

# toggleterm
```lua
Ctrl-t 打开/关闭循环切换终端
```

# overseer
用overseer 编译运行代码。
```lua
,cr 运行
,cb 编译
,cq 打开overseerQuickAction
```

# markdown
## markdown-preview.nvim
markdown 插入图片和预览文档
```lua
,pp  预览markdown文档
,pi  插入图片
```

# 其他组建
查询nvim各个组建的启动耗时
```lua
nvim --startuptime ./nvimstart.log
```

# keybinds
```lua
Ctrl-[/c/o              退出插入模式，作用和esc一样
Alt-w/e                 插入模式下自动退出并前进一个单词
Alt-b                   插入模式下自动退出并后退一个单词
Alt-h/j/k/l             自定义的快捷键，插入模式下的上下左右移动
```

# 查找替换
```lua
:s/hello/sky/          替换当前行第一个 hello 为 sky
:s/hello/sky/g         替换当前行所有 hello 为 sky
:%s/hello/sky/         替换所有行的第一个 vivian 为 sky
:%s/hello/sky/g        替换所有行中所有 hello 为 sky
:n,$s/hello/sky/       替换第 n 行开始到最后一行中每一行的第一个 hello 为 sky
:n,$s/hello/sky/g      替换第 n 行开始到最后一行中每一行所有 hello 为 sky
:2,12s/hello/sky/g     从2行到12行替换
:.,+2s/hello/sky/g     当前行.和接下来的两行
:%s/hello/sky/i        全局替换，并且忽略大小写，换成I表示大小写敏感
```

# 光标跳转
## 单词跳转
word和WORD的区别是否上一个单词，通过分隔符来区别，通过iskeyword设置。
```bash
w       移动到下一个word的开头
e       移动到下一个word的结尾
b       移动到上一个word的开头
w       移动到一个WORD的开头
E       移动到一个WORD的结尾
B       移动到上一个WORD的开头
```

## 标记
```bash
ma {a-zA-Z} 打标记，ma表示打了一个名为a的标记，后续使用`a或者'a跳转回去
''或``             来回跳转
:markds            显示所有的mark
:delm{arks}!       删除所有的marks
:delm{arks} {mark} 删除指定的mark
```

## 跳转
```bash
0             跳到光标所在的行首
^             跳到光标所在的第一个字符
$             跳到一行的尾部
ctrl + i      光标向前一个停留的位置跳转
ctrl + o      光标先后一个停留的位置跳转
:ju{mps}      显示所有跳转
:cle{arjumps} 清空所有的跳转
```

## 滚屏
```bash
ctrl + u    向上滚动半屏
ctrl + d    向下滚半屏
ctrl + f    向下滚整屏
ctrl + b    向上滚整屏
```

## 文本跳转
```bash
(/)   上/下一个语句移动
{/}   上/下一个段落的移动
[m    上一个函数开头
[M    上一个函数结尾
]m    下一个函数开头
]M    下一个函数结尾
H/M/L 窗口 第一行/中间一行/最后一行
gg    跳转到文件开头
G     跳转到文件结尾
```

# 代码折叠
代码折叠是折叠有缩进的，根据缩进来折叠代码，所有有的代码可能没法折叠的。
```bash
zc    折叠当前行所在的内容
zC    对所在范围内所有嵌套的折叠点进行折叠
zo    展开折叠
zO    对所在范围内所有嵌套的折叠点展开
[z    到当前打开的折叠的开始处。
]z    到当前打开的折叠的末尾处。
zj    向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
zk    向上移动到前一折叠的结束处。关闭的折叠也被计入。
zm    关闭所有折叠
zM    关闭所有折叠及其嵌套的折叠
zr    打开所有折叠
zR    打开所有折叠及其嵌套的折叠
zn    禁用折叠
zN    启用折叠
zj    移动至下一个折叠
zk    移动至上一个折叠
zd    删除当前折叠
zE    删除所有折叠
```

# vim快捷键
```lua
i       是insert，插入模式
a       是append，追加插入
o       即 open，从光标所在行后新建一行, 转插入模式。
s       是substitute，删除光标所在字符，并转插入模式
I       从段首开始插入
A       从段尾进行追加
O       从光标所在行前新建一行，开始编辑
S       删除整行开始编辑
c       是change，复合操作符，删除并转插入模式，其后接删除用法与 d 相同，只是还会转插入模式而已
C       从光标处删除至行末, 开始编辑。同c$
ZZ      保存退出
-       光标向上移动一行非空处
+       光标向下移动一行非空处
F + x   光标移动到前面最近一个x字符
f + x   光标移动到后面最近一个x字符（x为单个字符）
t + x   到下一个x的前一个字符(按t前进，按T后退)
```

## 删除命令
```lua
x       剪切光标后边的字符

3x      剪切3个字符
d0      剪切光标前的字符串
d^      剪切至行首
d$      剪切至行尾
dd      剪切光标所在行
dw      剪切下一个单词
de      剪切下一个单词
ndd     剪切 n 行
dG      删除光标到文件末的内容
dgg     删除光标到文件首的内容
d       剪切选定块到缓冲区
D       剪切至句末
dj      剪切本行和下一行
d5j     剪切本行和后五行
d}      剪切至段尾
d)      剪切至句末
dG      剪切至文末
dM      剪切至屏幕尾行
dfa     剪切至下一个 'a'
dta     剪切至下一个 'a'
d*      剪切至下一个相同的单词
diw     删除光标上的单词
daw     删除光标上的单词
das     删除一个句子
dib     删除内含 '(' ')' 块
dab     删除一个 '(' ')' 块
dip     删除内含段落
dap     删除一个段落
diB     删除内含 '{ ' ' }' 大块
daB     删除一个 '{ ' ' }' 大块
:a1,a2d 删除从 a1 行到 a2 行的文本内容
```

# 复制粘贴
```lua
yy     复制光标所在行
yw     复制当前单词
ynw    复制n个单词
y$     从当前位置复制到行尾
y^     从当前位置复制到第一个非空白字符
yG     从当前行复制到文件结束
p      粘贴到光标所在行的下边或右边（右下）
P      粘贴到光标所在行的上边或左边（左上）
nyy    从光标所在行向下复制 n 行
y0     从当前位置复制到行首
y20G   从当前行复制到第20行
y?bar  复制至上一个出现bar的位置
```

# 撤销
```lua
u        撤销上一次操作
ctrl + r 反撤销redo
```

# 组合键
## v开头的组合键：

```bash
vw      选中词，包括空格
vb      反向选择单词
vaw     选中词，包括后面的空格
viw     选中光标所在的的词，只选择单词
vis     选取一个句子，.结束
vi(     选取()中的内容
vi[     选取[]中的内容
vi"     选中文本中双引号的部分内容，不包括"
va"     选中文本中双引号的部分内容，包括"。a=around
vi'     选中单引号中的内容，不包括单引号
va'     选中单引号中的内容，包括单引号
vat     选中tag区域，包括tag
vit     选中tag区域，不包括tag
vl      选择内容，按l不断向右选择，jkh同理
vap     选择一段，不如v}好用
vip     选取一个段落，空行结束
vgg     从光标处选择到文件开头
vG      从光标处选择到文件结尾
V       选择一整行的文本
v}/v{   选中下/上一个段落，可按}或{来扩大范围
```

### 选择文本scope
```bash
vi + i/w/b/p/t/s/'/{/"

va + i/w/b/p/t/s/'/{/"

vi 选择的内容比va少点前后的范围，比如括号，空白等。

i/w/b/p/t/s/'/{/" 分别是选择： 内部/词/块/段/tag/句/单引号内/{括号内/双引号内
```

## c开头的组合键：
```lua
c3w    修改3个单词
cw     从光标所在的位置开始到该单词结束进行修改，最后进入编辑状态
cW     修改到字串尾的内容
ciw    删除当前光标所在单词并进入插入模式
ciW    修改整字串
caw    修改整词包括词尾空格
caW    修改整字串包括字串尾空格
cfx    修改从光标到下一个字符 x 之间的文本
cFx    修改从光标到上一个字符 x 之间的文本
c0/c^  修改到行首的内容
cc/S   删除当前行，进入编辑模式
cis    修改当前句
cas    修改当前句包括句尾空格
cip    修改当前段
cap    修改当前段包括段尾空行
c$/C   表示删除光标当前位置到本行结尾处的内容并进入Vim插入模式
cfx    修改从光标到下一个字符 x 之间的文本
cFx    修改从光标到上一个字符 x 之间的文本
cn|    修改从光标到当前行的第 n 个字符间的所有字符，n 正整数
cnG    修改当前行到第 n 行之间的所有行
cG     表示修改当前行直至末行，相当于dG+i
```

## d开头的组合键：
```lua
dw        删除到词尾的内容
diw       删除整词
daw       删除整词包括词尾空格
dW        删除到字串尾的内容
diW       删除整字串
daW       删除整字串包括字串尾空格
D         删除到行尾的内容
dis       删除当前句
das       删除当前句包括句尾空格
dip       删除当前段
dap       删除当前段包括段尾空行
dtx       删除文本直到字符“x”（不包括字符“x”）
dfx       删除文本直到字符“x”（包括字符“x”）
d{/c{     删除上一个段落
d}/c}     删除下一个段落
diw/ciw   删除一个词
dit/cit   删除一个tag
d2w/2dw   删除两个单词
```

# 分屏
## 打开分屏:
```lua
sp [filename]      水平分屏的同时指定打开的文件的名字
split [filename]   水平方向分屏打开新文件
vsp [filename]     垂直分屏的同时指定打开的文件的名字
vsplit [filename]  垂直方向分屏打开新文件
vs [filename]      垂直分屏
sv [filename]      水平分屏
new [filename]     打开一个水平窗口
vnew [filename]    打开一个垂直窗口
sview [filename]   打开一个只读分屏
w [filename]       新建一个文件
Ctrl+w s           将当前打开的文件进行水平分割
Ctrl+w v           将当前打开的文件进行垂直分割
```

## 关闭分屏：
```lua
ctrl+w c   关闭当前的分屏
ctrl+w q   关闭当前窗口，如果只剩最后一个了，则退出Vim
only       关闭除当前分屏外的其他分屏，ctrl+w o也是一样效果
hide       关闭当前窗口
quit/q     退出当前所在分屏
qall       同时退出多个屏幕
wqall      同时保存退出多个屏幕
```

## 屏幕尺寸：
```lua
Ctrl+w =                 使所有窗口恢复均等
Ctrl+w +                 增加高度
Ctrl+w -                 减少高度
10 Ctrl+w +              增加10行高度
Ctrl+w N +               当前屏高度加N
res[ize] N               使用指定当前屏的调整高度
ctrl+w >                 增加当前窗口宽度
ctrl+w <                 减少当前窗口宽度
Ctrl+up/right/down/left  修改分屏大小
```

## 移动分屏:
这个功能还是使用了Vim的光标键，只不过都是大写。
```lua
ctrl+w H    把当前分屏移动到最左边
ctrl+w K    把当前分屏移动到上面并扩展到整屏的宽度
ctrl+w J    把当前分屏移动到最下边
ctrl+w L    把当前分屏移动到最右边
ctrl+w x    当前窗口与下一个窗口对调
ctrl+w R    向上旋转窗口
ctrl+w r    向下旋转窗口
```

## 移动光标:
Vi中的光标键是h, j, k, l，要在各个屏间切换，只需要先按一下Ctrl+w
```lua
Ctrl+w h                  把光标移到左边的屏幕中
Ctrl+w l                  把光标移到右边的屏幕中
Ctrl+w j                  把光标移到下边的屏幕中
Ctrl+w k                  把光标移到上边的屏幕中
Ctrl+w w                  光标在打开的屏幕之间顺时针选择
Ctrl+w p                  把光标移到上一个屏中
Ctrl+up/down/right/left   切换屏幕
```

