-- https://github.com/neovim/nvim-lspconfig
-- 更多样式定制，参见：https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }

-- 查看错误的提示
vim.keymap.set('n', 'go', "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
-- vim.keymap.set('n', 'go', vim.diagnostic.open_float, opts) -- 和上面的一样效果，就是显示不如上面好看
-- 集中列出所有的错误提示
vim.keymap.set('n', 'gl', vim.diagnostic.setloclist, opts)
-- 跳转到上一个错误提示的地方
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
-- 跳转到下一个错误提示的地方
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- 跳转到函数声明
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- 跳转到函数定义
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- 列出引用过该变量或函数的地方
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- 查看函数文档
    vim.keymap.set('n', 'gp', "<cmd>Lspsaga hover_doc<CR>", bufopts)
    -- vim.keymap.set('n', 'gp', vim.lsp.buf.hover, bufopts)
    -- 预览函数定义
    vim.keymap.set('n', '<leader>gd', "<cmd>Lspsaga preview_definition<CR>", bufopts)
    -- 帮助信息
    vim.keymap.set('n', 'gh', "<cmd>Lspsaga lsp_finder<CR>", bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- 查看函数原型
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.hover, bufopts) -- 插入模式下看函数原型
    -- vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, bufopts)
    -- 添加工作目录
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- 移除当前文件的详细目录
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- 列出当前nvim的工作目录
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    -- 列出当前变量的类型
    vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, bufopts)
    -- 重命名变量名
    vim.keymap.set('n', '<leader>rn', "<cmd>Lspsaga rename<CR>", bufopts)
    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts) -- 和上面的一样的功能，就是显示和细节不一样，总的来说下面的好看点。
    -- 修正错误code action
    vim.keymap.set('n', '<leader>ca', "<cmd>Lspsaga code_action<CR>", bufopts)
    -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- 和上面一样的功能，上面好看

    -- 代码自动格式化，不过这个用neoformat插件ok
    vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {}
    }
}
require 'lspconfig'.awk_ls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { 'awk-language-server'},
    filetypes = {'awk'},
    single_file_support = true,
}
require 'lspconfig'.bashls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {'bash-language-server', "start"},
    filetypes = {"sh"},
    single_file_support = true,
}
require 'lspconfig'.clangd.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {'clangd'},
    filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
    single_file_support = true,
}
require 'lspconfig'.cmake.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {'cmake-language-server'},
    filetypes = {'cmake'},
    init_options = {buildDirectory = "build"},
    single_file_support = true,
}
require 'lspconfig'.gopls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
require 'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
