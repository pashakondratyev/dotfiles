local lspstatus = require("lsp-status")
lspstatus.config({
    status_symbol = "⬤ ",
    current_function = true,
    diagnostics = false,
    kind_labels = require("lspkind").presets["default"],
})
lspstatus.register_progress()


local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, buffer)
    nnoremap("gd", function() vim.lsp.buf.definition() end)
    nnoremap("gr", function() vim.lsp.buf.references() end)
    nnoremap("gD", function() vim.lsp.buf.declaration() end)
    nnoremap("<leader>rn", function() vim.lsp.buf.rename() end)
    nnoremap("<leader>ca", function() vim.lsp.buf.code_action() end)
    nnoremap("K", function() vim.lsp.buf.hover() end)
end

require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "",
            server_pending = "",
            server_uninstalled = "ﮊ",
        },
    },
})

require("lspconfig").tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

require("lspconfig").jdtls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- set up LSP signs
for type, icon in pairs({
    Error = "",
    Warn = "",
    Hint = "",
    Info = "",
}) do
local hl = "DiagnosticSign" .. type
vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
