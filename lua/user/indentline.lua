local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	print(indent_blankline)
	return
end

vim.cmd([[highlight IndentBlanklineContextChar guifg=#61AFEF   gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextStart guisp=#61AFEF   gui=underline]])
-- vim.cmd([[highlight IndentBlanklineSpaceCharBlankline guifg=#61AFEF    gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineContextStart guisp=#61AFEF   gui=nocombine]])

-- vim.opt.termguicolors = true
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#00FF00 gui=nocombine]])
-- let g:indent_blankline_char_blankline = '┆'

-- indent_blankline.setup({
-- 	indent = {
-- 		-- char = "▏",
-- 		-- context_char = "┃", --"▏",
-- 		-- context_char_list = { "┃", "║", "╬", "█" },
-- 		-- char_list = { "▏", "|", "¦", "┆", "┊" },
--
-- 		char_tab = { "┃", "║", "╬", "█" },
-- 		char = { "▏", "|", "¦", "┆", "┊" },
-- 	},
-- 	show_trailing_blankline_indent = true,
-- 	show_first_indent_level = true,
-- 	use_treesitter = true,
-- 	show_current_context = true,
-- 	show_current_context_start = true,
-- 	buftype_exclude = {
-- 		"terminal",
-- 		"nofile",
-- 	},
-- 	-- char_highlight_list = {
-- 	-- 	"IndentBlanklineIndent1",
-- 	-- 	"IndentBlanklineIndent2",
-- 	-- 	"IndentBlanklineIndent3",
-- 	-- 	"IndentBlanklineIndent4",
-- 	-- 	"IndentBlanklineIndent5",
-- 	-- 	"IndentBlanklineIndent6",
-- 	-- },
-- 	filetype_exclude = {
-- 		"help",
-- 		"packer",
-- 		"NvimTree",
-- 	},
-- })
