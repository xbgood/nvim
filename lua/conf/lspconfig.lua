-- require('lspconfig').ltex.setup{}
require('lspconfig').texlab.setup {}
require('lspconfig').ast_grep.setup {}
require('lspconfig').cssls.setup {}
require('lspconfig').jsonls.setup {}
require('lspconfig').yamlls.setup {}
require('lspconfig').ts_ls.setup {}
require('lspconfig').gopls.setup {}
require('lspconfig').marksman.setup {}
require('lspconfig').bashls.setup {
    cmd = { 'bash-language-server', "start" },
    filetypes = { "sh" },
    single_file_support = true,
}
require('lspconfig').asm_lsp.setup {
    filetypes = { "s", "asm", "vmasm" },
    cmd = { "asm-lsp" },
    single_file_support = true,
}
require('lspconfig').clangd.setup {
    cmd = { 'clangd' },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    single_file_support = true,
}
require('lspconfig').cmake.setup {
    cmd = { 'cmake-language-server' },
    filetypes = { 'cmake' },
    init_options = { buildDirectory = "build" },
    single_file_support = true,
}
require('lspconfig').emmet_ls.setup {
    filetypes = { "astro", "css", "eruby", "html", "htmldjango",
        "javascriptreact", "less", "pug", "sass", "scss",
        "svelte", "typescriptreact", "vue", "htmlangular" },
    cmd = { "emmet-ls", "--stdio" },
    single_file_support = true,
}
require('lspconfig').rust_analyzer.setup {
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
}
require('lspconfig').lua_ls.setup {
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
require('lspconfig').pyright.setup {
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
}
