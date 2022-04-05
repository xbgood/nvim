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

-- markdown image-paste
vim.cmd("autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>")

-- markdown preview
vim.cmd([[
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
]])


-- markdown table
vim.cmd([[
nnoremap <silent> <leader>mp :call org#main#runCodeBlock()<CR>
]])
