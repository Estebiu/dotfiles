local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("mason-lspconfig").setup({})
require("mason-lspconfig").setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function (server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {
			capabilities = capabilities,
		}
	end,
	-- Next, you can provide targeted overrides for specific servers.
	-- For example, a handler override for the rust_analyzer:
	["rust_analyzer"] = function ()
		require("rust-tools").setup {
			capabilities = capabilities
		}
	end
}
