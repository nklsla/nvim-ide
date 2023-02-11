local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- variable used to "Format on save"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Variables for readability
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	debug = true,
	sources = {
		-- Formatters
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.clang_format,
		formatting.taplo,
		-- formatting.rustfmt,
		-- formatting.astyle,

		-- Diagnostics
		diagnostics.flake8,
		diagnostics.cpplint,
	},
	-- Function to "Format on save"
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
