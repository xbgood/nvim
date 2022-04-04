-- 自动切换输入法（Fcitx 框架）
vim.g.FcitxToggleInput = function()
    local input_status = tonumber(vim.fn.system("fcitx-remote"))
    if input_status == 2 then
        vim.fn.system("fcitx-remote -c")
    end
end

-- vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")

-- 指定 undotree 缓存存放路径
vim.g.undotree_dir = "~/.cache/nvim/undodir"

-- 指定代码片段存储路径，这个目录我们在第二章节的时候已经创建好了
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet/"

vim.cmd(
[[
autocmd InsertLeave * call FcitxToggleInput()
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        if !isdirectory('build')
            execute "!mkdir build"
        endif
        execute 'silent !gcc % -lpthread -o build/%<'
        execute '!time ./build/%<'
    elseif &filetype == 'cpp'
        if !isdirectory('build')
            execute "!mkdir build"
        endif
        exec 'silent !g++ -std=c++11 % -Wall -o ./build/%<'
        " :term ./%< && rm ./%<
        exec '!time ./build/%<'
    elseif &filetype == 'python'
        set splitbelow
        :term python %
        " exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'rust'
        set splitbelow
        :term cargo run
    elseif &filetype == 'go'
        set splitbelow
        :term go run %
    elseif &filetype == 'markdown'
        exec 'MarkdownPreview'
    endif
endfunc

map <F5> :call CompileRunGcc()<CR>
imap <F6> <ESC> :call CompileRunGcc()<CR>
]]
)
