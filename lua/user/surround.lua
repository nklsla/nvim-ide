local status_ok, nsurr = pcall(require, "nvim-surround")
if not status_ok then
	print(nsurr)
	return
end

nsurr.setup({
	-- Configuration here, or leave empty to use defaults
	-- See https://github.com/kylechui/nvim-surround
	-- :h nvim-surround.configuration
})
