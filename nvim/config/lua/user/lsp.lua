local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
    }),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})


lsp.configure('jdtls', {
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        print('hello tsserver')
    end,
    settings = {
        java = {
            format = {
                settings = { url = "../../../../java/styles.xml"}
            }
        }
    }
})
local flake_ignores = {"E203", -- whitespace before :
                       "W503", -- line break before binary operator
                       "E501", -- line too long
                       "C901"} -- mccabe complexity

--[[ lsp.use('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {'W391', "W503", "W504"},
                    maxLineLength = 120
                },
                rope_autoimport = {
                    enabled = true;
                },
                flake8 = {
                    ignore = table.concat(flake_ignores, ',');
                },
                mccabe = {
                    enabled = false
                }
            }
        }
    }
})
]]--

local lsp_config = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason-lspconfig").setup({
    handlers = {
        basedpyright = function()
                lsp_config.basedpyright.setup({
                    capabilities = lsp_capabilities,
                    settings = {
                        basedpyright = {
                            analysis = {
                                autoSearchPaths = true,
								diagnosticMode = "openFilesOnly",
								useLibraryCodeForTypes = true,
								typeCheckingMode = "standard"
                            }
                        }
                    }
                })
        end,
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, {
        buffer = bufnr,
        remap = false,
        desc = "Go to references"
    })
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, {
        buffer = bufnr,
        remap = false,
        desc = "Rename"
    })
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, {
        buffer = bufnr,
        remap = false,
        desc = "Go to references"
    })
    vim.keymap.set("n", "gI", function() vim.lsp.buf.implementation() end, {
        buffer = bufnr,
        remap = false,
        desc = "Go to implementation"
    })
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local float_config = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
}

vim.diagnostic.config({
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
    float = float_config,
})

for name, icon in pairs(require("user.icons").diagnostics) do
    name = "DiagnosticSign" .. name
    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

lsp.setup()
