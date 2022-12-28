-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
    -- 确保安装，根据需要填写
    ensure_installed = {
        "sumneko_lua",
        "pyright",
        "clangd",
        "rust_analyzer",
        "bashls",
        "emmet_ls",
        "html",
        "jsonls",
        "yamlls",
        "gopls",
        "awk_ls",
        "cmake",
        "cssls",
        "prosemd_lsp",
        "tsserver",
        "sqlls",
    },
})
