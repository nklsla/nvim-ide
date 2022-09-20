-- local colorscheme = "tokyonight"
local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	print(_)
	return
end

-- override scheme settings
vim.cmd("highlight CursorLineNr guifg=yellow")
vim.cmd("highlight LineNr guifg=lightblue")
