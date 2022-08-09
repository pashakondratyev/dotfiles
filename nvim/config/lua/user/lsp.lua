local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, buffer)
  nnoremap("gd", function() vim.lsp.buf.definition() end)
  nnoremap("gr", function() vim.lsp.buf.references() end)
  nnoremap("<leader>rn", function() vim.lsp.buf.rename() end)
  nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
  nnoremap("K", function() vim.lsp.buf.hover() end)
end

require("lspconfig").tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig").sumneko_lua.setup({
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
