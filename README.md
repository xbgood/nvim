# telescope
```lua
<CR> 打开选中的搜索结果
<Tab> 选中当前的搜索结果，可搭配 <CR> 一次性打开多个
<C-v> 垂直拆分打开选中的搜索结果
<C-c> 退出搜索框
<C-n> 选择下一项目（插入模式下）
<C-p> 选择上一个项目（插入模式下）
j     选择下一个项目（普通模式下）
k     选择上一个项目（普通模式下）
,ff   查找文件
,fg   查找文字
,fb   查找buffer
,fh   查找帮助文档
,fo   查找最近打开的文件
,fm   查找mark标记
```

# bufferline
```lua
vim a b c d 打开abcd四个buffer文件
:e file 打开一个buffer文件
:new 横向创建buffer文件
:vnew 纵向创建buffer文件
:badd 创建一个buffer文件，光标保持当前buffer
:bn 正向遍历buffer
:bp 前向遍历buffer
:bf 跳转到开头的buffer
:bl 跳转到结尾的buffer
:ls 列出所有buffer
:bd 关闭当前buffer (bdelete)
:3,5bd 关闭3-5 buffer

C-q 关闭当前buffer
C-h 切换到上一个缓冲区
C-l 切换到下一个缓冲区
,bh 关闭左侧缓冲区
,bl 关闭右侧缓冲区
```

# copilot
C-l 确认补全
M-[ 查看上一个补全
M-] 查看下一个补全
C-[ 关闭补全

# Comment
gcc 行注释
gCC 块注释
gc 可视模式下的注释
gC 可视模式下的块注释
gco 在当前行下方新增行注释
gcO 在当前行上方新增行注释
gcA 在当前行行尾新增行注释

# keybinds
```lua
插入模下 jj 退出插入模式
用 H 和 L 代替 ^ 与 $    
将 C-u 和 C-d 调整为上下滑动 10 行而不是半页    
插入模式下的上下左右移动
修改分屏大小    
正常模式下按 ESC 取消高亮显示    
通过 leader cs 切换拼写检查    

jj 插入模式下jj退出插入模式
H/L 替换掉^$
C-u/d 上下滑动10行
A-j/k/l/h 插入模式下的上下左右移动
C-up/down/right/left 修改分屏大小
,cs 切换拼写检查

```

# nvim-tree
```lua
,1 打开文件目录导航
,fc 打开当前文件所在的目录

-- 默认按键
-     ：返回上层目录
o     ：打开目录或文件
a     ：新增目录或文件
r     ：重命名目录或文件
x     ：剪切目录或文件
c     ：复制目录或文件
d     ：删除目录或文件
y     ：复制目录或文件名称
Y     ：复制目录或文件相对路径
gy    ：复制目录或文件绝对路径
p     ：粘贴目录或文件
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


# nvim-hlslens
```lua
# 反向搜索当前所在的单词
* 正向搜索当前所在的单词
```

# hop
```lua
,hw 搜索并跳转到单词
,hl 搜索并跳转到行
,hc 搜索并跳转到字符，按了,hc后需要输入一个字符
```

# lsp_signature
```lua
C-j toggle_key
```

# neoformat
```lua
格式化程序
,cf 格式化快捷键
```

# nvim-cmp
```lua
C-p 上一条补全
C-n 下一条补全
<CR> 选择补全
C-k 关闭或出现补全
Tab 选择补全
```

# nvim-lsp-installer
```lua
gd 跳转到定义
gr 列出光标下所有引用
go 工作区诊断
,ca 显示代码可用操作
,cn 变量重命名
gh 查看帮助信息
g[ 跳转到上一个问题
g] 跳转到下一个问题
```

# surround XXXXXXX
```lua
-- cs 字符 字符：修改包裹
-- ds 字符     ：删除包裹
-- ys 范围 字符：增加包裹
```

# nvim-spectre
```lua
,rp  全项目替换
,rf 只替换当前文件
,rw 全项目中搜索当前单词
```

# vim-multiple-cursors
```lua
用法：
用f+字符来搜索下一个字符，可以快速定位到字符。
用gb选中任意文本后，使用 Ctrl+n 和 Ctrl+p 找到下一个匹配的字符

选中完成后，可以使用i,c等vim编辑操作进入insert模式，开始修改文本.

快捷键：
gb 开始选择单词
C-x 跳过当前选择，选中下一个
C-n 向后选择
C-p 向前选择
Esc 退出
```

# vista
```lua
,2 显示目录导航
```

# toggleterm
```lua
Esc 推出浮动终端
,tf 打开浮动终端
```

# undotree
```lua
查看undotre
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
,p 插入图片
```


# AsyncTask
用AsyncTask编译运行代码。

```lua
,cb 编译
,cr 运行
```


# autojump
### 跳转到指定目录

> j+目录名
>
>```bash
>~ ➤ j rpc
>/home/wallen/Codes/C++/Bonus/rpc
>rpc ➤
>```

### 跳转到指定目录的子目录
jc，也可以跳转当前目录的子目录

## 查看权重
j --stat

### 用系统文件管理器打开目录
jo,这里用的是ranger

