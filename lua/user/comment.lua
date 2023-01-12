local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	print(comment)
	return
end

-- :h comment.config
-- for help

comment.setup({
	-- Mapping for ctrl-/ in normal and visual mode
	-- In (n)vim the _ will represent / in this case
	toggler = {
		line = "<C-_>",
	},
})
