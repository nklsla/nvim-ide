local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

-- :h comment.config
-- for help

comment.setup {
    -- Mapping for ctrl-/ in normal and visual mode
    toggler = {
        line = '<C-_>'
    },
    opleader = {
        line = '<C-_>'
    }
}
