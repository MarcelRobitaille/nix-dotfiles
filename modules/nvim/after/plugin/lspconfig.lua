local capabilities = vim.tbl_deep_extend("force",
	vim.lsp.protocol.make_client_capabilities(),
	require('cmp_nvim_lsp').default_capabilities()
)

vim.lsp.config("basedpyright", { capabilities = capabilities })
vim.lsp.enable("basedpyright")

vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = false;
			}
		}
	}
})
vim.lsp.enable("rust_analyzer")

vim.lsp.config("ccls", {
	capabilities = capabilities,
})
vim.lsp.enable("ccls")
