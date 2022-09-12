local M = {}

local nls_utils = require("user.lsp.null-ls_settings.utils")
local method = require("null-ls").methods.DIAGNOSTICS

function M.list_registered(filetype)
	local registered_providers = nls_utils.list_registered_providers_names(filetype)
	return registered_providers[method] or {}
end

return M
