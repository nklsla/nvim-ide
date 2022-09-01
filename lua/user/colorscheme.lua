local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

-- override scheme settings
vim.cmd "highlight CursorLineNr guifg=yellow"
vim.cmd "highlight LineNr guifg=lightblue"
