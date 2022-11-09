local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local function config(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = function()
      nnoremap("<leader>eo", function() vim.diagnostic.open_float() end)
      nnoremap("<leader>en", function() vim.diagnostic.goto_next() end)
      nnoremap("<leader>ep", function() vim.diagnostic.goto_prev() end)
      nnoremap("<leader>ea", '<cmd>Telescope diagnostics<CR>')
      nnoremap("<leader>vgi", function() vim.lsp.buf.implementation() end)
			nnoremap("<leader>vgd", function() vim.lsp.buf.definition() end)
			nnoremap("<leader>a", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
                filter = function(code_action)
                    if not code_action or not code_action.data then
                        return false
                    end

                    local data = code_action.data.id
                    return string.sub(data, #data - 1, #data) == ":0"
                end,
                apply = true
            }) end)
			nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
			nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup(config({
  capabilities = capabilities
}))

require'lspconfig'.angularls.setup(config())

require'lspconfig'.tailwindcss.setup(config())

require'lspconfig'.tsserver.setup(config());

local on_attach = function(client)
    require'completion'.on_attach(client)
end

require'lspconfig'.rust_analyzer.setup(config({
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
}))
