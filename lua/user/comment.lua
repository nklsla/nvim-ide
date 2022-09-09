local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    print(comment)
  return
end

-- :h comment.config
-- for help

comment.setup {
    -- Mapping for ctrl-/ in normal and visual mode
    toggler = {
        line = '<C-_>'
    },
}
