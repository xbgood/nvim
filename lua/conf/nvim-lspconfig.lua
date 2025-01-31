-- https://github.com/neovim/nvim-lspconfig
-- 更多样式定制，参见：https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }

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

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- 显示函数定义
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gd', "<cmd>Lspsaga peek_definition<CR>", { desc = "Lsp Show Definition" })

    -- 跳转到函数声明
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gD', "<cmd>Lspsaga goto_definition<CR>", { desc = "Lsp Goto Definition" })

    -- 显示当前变量的类型
    -- vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gt', "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Lsp Show Type Definition" })

    -- 跳转到当前变量的类型
    vim.keymap.set('n', 'gT', "<cmd>Lspsaga goto_type_definition<CR>", { desc = "Lsp Goto Type Definition" })

    -- 列出引用过该变量或函数的地方
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Lsp References" })

    -- 类似fzf显示使用过该变量的行
    vim.keymap.set('n', 'gf', "<cmd>Lspsaga finder<CR>", { desc = "Lsp Finder" })

    -- 查看函数原型
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) -- 下面的更加美观
    vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", { desc = "Lsp Hover Doc" })
    -- vim.keymap.set('i', '<C-k>', vim.lsp.buf.hover, bufopts) -- 插入模式下看函数原型
    vim.keymap.set('i', '<C-k>', "<cmd>Lspsaga hover_doc<CR>", { desc = "Lsp Hover Doc" })


    -- 重命名变量名
    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts) -- 和下面的一样的功能，就是显示和细节不一样，总的来说下面的好看点。
    vim.keymap.set('n', 'gm', "<cmd>Lspsaga rename<CR>", { desc = "Lsp Rename" })

    -- 修正错误code action
    -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- 和下面一样的功能，下面好看
    vim.keymap.set('n', 'ga', "<cmd>Lspsaga code_action<CR>", { desc = "Lsp Code Action" })

    -- 函数树，替代来aerial.nvim
    vim.keymap.set('n', '<leader>2', "<cmd>Lspsaga outline<CR>", { desc = "Lsp Outline" })

    -- 添加工作目录
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder" })

    -- 移除当前文件的详细目录
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace Folder" })

    -- 列出当前nvim的工作目录
    vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        { desc = "List Workspace Folders" })

    -- vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- 代码自动格式化，不过这个用插件ok
    vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true, } end, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- require('lspconfig').ltex.setup{}
require('lspconfig').texlab.setup{}
require('lspconfig').ast_grep.setup { }
require('lspconfig').cssls.setup {}
require('lspconfig').jsonls.setup {}
require('lspconfig').prosemd_lsp.setup{}
require('lspconfig').yamlls.setup{}
require('lspconfig').ts_ls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {}
    }
}
require('lspconfig').bashls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { 'bash-language-server', "start" },
    filetypes = { "sh" },
    single_file_support = true,
}
require('lspconfig').clangd.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { 'clangd' },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    single_file_support = true,
}
require('lspconfig').cmake.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { 'cmake-language-server' },
    filetypes = { 'cmake' },
    init_options = { buildDirectory = "build" },
    single_file_support = true,
}
require('lspconfig').gopls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig').lua_ls.setup {
    flags = lsp_flags,
    on_attach = on_attach,
    name = 'lua_ls',
    cmd = { 'lua-language-server' },
    single_file_support = true,
    filetypes = { 'lua' },
    log_level = 2,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT', },
            diagnostics = { globals = { 'vim' }, },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true,
                },
            },
            telemetry = { enable = false, },
        },
    },
}
require('lspconfig').emmet_ls.setup {
    on_attach = on_attach,
    filetypes = { "astro", "css", "eruby", "html", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "svelte", "typescriptreact", "vue", "htmlangular" },
    cmd = { "emmet-ls", "--stdio" },
    single_file_support = true,
}
require('lspconfig').asm_lsp.setup {
    on_attach = on_attach,
    filetypes = { "s", "asm", "vmasm" },
    cmd = { "asm-lsp" },
    single_file_support = true,
}
require('lspconfig').pyright.setup {
    init_options = { doucumentFormatting = true, },
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "python" },
    cmd = { "pyright-langserver", "--stdio" },
    single_file_support = true,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
            },
        },
    },
}
