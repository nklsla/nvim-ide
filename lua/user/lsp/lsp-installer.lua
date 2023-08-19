local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Add installed servers here
local servers = {
	-- "sumneko_lua",
	"lua_ls",
	-- "cssls",
	-- "html",
	-- "tsserver",
	"pyright",
	-- "bashls",
	-- "jsonls",
	"yamlls",
	"clangd",
	-- "rust_analyzer",
}

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

-- Add options from respecitve files
local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server == "lua_ls" then
		local lua_ls = require("user.lsp.settings.lua_ls")
		opts = vim.tbl_deep_extend("force", lua_ls, opts)
	end

	if server == "pyright" then
		local pyright_opts = require("user.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "clangd" then
		local clangd = require("user.lsp.settings.clangd")
		opts = vim.tbl_deep_extend("force", clangd, opts)
	end

	-- if server == "rust_analyzer" then
	-- 	local rust_analyzer = require("user.lsp.settings.rust_analyzer")
	-- 	opts = vim.tbl_deep_extend("force", rust_analyzer, opts)
	-- end

	lspconfig[server].setup(opts)
end
