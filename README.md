# telescope
```lua
,ff           查找文件
,fw           查找文字
,fb           查找buffer
,fh           查找帮助文档
,fo           查找最近打开的文件
,fm           查找mark标记
C-d/u         预览内容上下移动
C-v           垂直拆分打开选中的搜索结果
C-x           水平拆分打开选中的搜索结果
C-c           退出搜索框关闭telescope
C-t           打开一个新的tab查看当前文件
Esc           正常模式下关闭telescope
C-n/p         选择下/上一项目（插入模式下）
j/k           选择下/上一个项目（普通模式下）
<CR>          打开选中的搜索结果
<Tab>         选中当前的搜索结果，可搭配 <CR> 一次性打开多个
```

# bufferline
```lua
:bn           正向遍历buffer
:bp           前向遍历buffer
:bf           跳转到开头的buffer
:bl           跳转到结尾的buffer
:ls           列出所有buffer
C-q           关闭当前buffer
,bh           关闭左侧缓冲区
,bl           关闭右侧缓冲区
:bd           关闭当前buffer (bdelete)
:3,5bd        关闭3-5 buffer
C-h/l         切换到上/下一个缓冲区
vim a b c d   打开abcd四个buffer文件
:e file       新开buffer创建一个file文件
:badd file    新开buffer创建一个file文件，光标保持当前buffer
:new file     横向打开file文件
:vnew file    纵向打开file文件
```

# Comment
```lua
gcc    行注释
gCC    块注释
gc     可视模式下的注释
gC     可视模式下的块注释
gcO    在当前行上方新增行注释
gco    在当前行下方新增行注释
gcA    在当前行行尾新增行注释

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

# nvim-cmp
```lua
Tab       选择补全
Shift-Tab 取消预选
C-n       下一条补全
C-p       上一条补全
C-d       代码左移4格
C-f       代码右移4格
C-e       关闭或出现补全
<CR>      选择补全
```

# nvim-lspconfig
```lua
g[       跳转到上一个问题
g]       跳转到下一个问题
gD       跳转到函数声明处
gd       跳转到函数定义
gr       列出光标下所有引用
gh       查看帮助信息
gp       查看函数悬浮文档
go       查看错误的提示
gl       集中列出所有的错误提示
gi       执行代码？
,gd      预览函数定义
,cf      代码格式化
,cc      用astyle格式化c/cpp程序
,ca      修复错误
,rn      变量重命名
,td      列出变量类型
,wa      添加工作目录
,wr      移除工作目录
,wl      列出工作目录
K        normal模式下查看函数原型
ctrl + k insert模式下查看函数原型
```

# hop
```lua
,hw     搜索并跳转到单词
,hl     搜索并跳转到行
,hc     搜索并跳转到字符，按了,hc后需要输入一个字符
,he     搜索并跳转到单词的尾部
```

# surround
```lua
cs 字符 字符：修改包裹
ds 字符     ：删除包裹
ys 范围 字符：增加包裹
```

# nvim-spectre
```lua
,sp    全项目替换
,sf    只替换当前文件
,sw    全项目中搜索当前单词
```

# vim-multiple-cursors
用法：
用f+字符来搜索下一个字符，可以快速定位到字符。
用gb选中任意文本后，使用 Ctrl+n 和 Ctrl+p 找到下一个匹配的字符

选中完成后，可以使用i,c等vim编辑操作进入insert模式，开始修改文本.

```lua
快捷键：
gb     开始选择单词
C-x    跳过当前选择，选中下一个
C-n    向后选择
C-p    向前选择
Esc    退出
```

# vista
```lua
,2 显示目录导航
```

# nvim-hlslens
```lua
* 正向搜索当前所在的单词
# 反向搜索当前所在的单词
```

# toggleterm
```lua
Esc 推出浮动终端
,tf 打开浮动终端
,tt 打开底部终端
```

# AsyncTask
用AsyncTask编译运行代码。
```lua
,cb 编译
,cr 运行
```

# undotree
查看undotre
```lua
,3
```

# notify
```lua
,fn 显示历史弹窗记录
```

# todo-comments
```lua
,ft 查看todo标签
```

# markdown
markdown 插入图片和预览文档
```lua
,mp 预览markdown文档
,p  插入图片
```

# 其他组建
查询nvim各个组建的启动耗时
```lua
nvim --startuptime ./nvimstart.log
```

# keybinds
```lua
jj                      插入模式下退出插入模式
Alt-h/j/k/l             插入模式下的上下左右移动
,cs                     切换拼写检查
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
X       剪切光标前边的字符
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
```lua
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
V       选择一整行
v}/v{   选中下/上一个段落，可按}或{来扩大范围
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

# buffer、window、tab
```lua
vim file1 file2 file3       以buffer的形式打开三个文件，这是最常用的
vim -p file1 file2 file3    以tab的形式打开三个文件
vim -o/O file1 file2 file3  以window的形式打开文件并分屏，用-O垂直分屏用于对比文件
```
