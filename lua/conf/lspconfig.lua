-- require('lspconfig').ltex.setup{}
vim.lsp.enable('texlab')
vim.lsp.enable('ast_grep')
vim.lsp.enable('cssls')
vim.lsp.enable('jsonls')
vim.lsp.enable('yamlls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('marksman')

vim.lsp.config('bashls', {
    cmd = { 'bash-language-server', "start" },
    filetypes = { "sh" },
    single_file_support = true,
})
vim.lsp.config('asm_lsp', {
    filetypes = { "s", "asm", "vmasm" },
    cmd = { "asm-lsp" },
    single_file_support = true,
})
vim.lsp.config('clangd', {
    cmd = { 'clangd' },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    single_file_support = true,
})
vim.lsp.config('cmake', {
    cmd = { 'cmake-language-server' },
    filetypes = { 'cmake' },
    init_options = { buildDirectory = "build" },
    single_file_support = true,
})
vim.lsp.config('emmet_ls', {
    filetypes = { "astro", "css", "eruby", "html", "htmldjango",
        "javascriptreact", "less", "pug", "sass", "scss",
        "svelte", "typescriptreact", "vue", "htmlangular" },
    cmd = { "emmet-ls", "--stdio" },
    single_file_support = true,
})
vim.lsp.config('rust-analyzer', {
    cmd = { 'rust-analyzer' },
    filetypes = { "rust" },
    single_file_support = true,
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = true,
            }
        }
    },
})
vim.lsp.config('lua_ls', {
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
})
vim.lsp.config('pyright', {
    init_options = { doucumentFormatting = true, },
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
})
