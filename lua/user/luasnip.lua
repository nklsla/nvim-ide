local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	print(luasnip)
	return
end
-- some shorthands...
local snip = luasnip.snippet
-- local node = luasnip.snippet_node
-- local text = luasnip.text_node
local insert = luasnip.insert_node
-- local func = luasnip.function_node
-- local choice = luasnip.choice_node
-- local dynamicn = luasnip.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

luasnip.add_snippets("rust", {
	snip("dprint", fmt('println!("{{:?}}", {});', { insert(1, "var") })),
})
