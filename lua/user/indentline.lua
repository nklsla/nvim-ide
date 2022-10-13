local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	print(indent_blankline)
	return
end

vim.cmd([[highlight IndentBlanklineContextChar guifg=#00FF00 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextStart guisp=#00FF00 gui=underline]])

indent_blankline.setup({
	char = "▏",
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	use_treesitter = true,
	show_current_context = true,
	show_current_context_start = true,
	buftype_exclude = { "terminal", "nofile" },
	filetype_exclude = {
		"help",
		"packer",
		"NvimTree",
	},
})
