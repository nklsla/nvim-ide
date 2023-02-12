local status_ok, coderun = pcall(require, "code_runner")
if not status_ok then
	print(coderun)
	return
end

coderun.setup({
	-- choose default mode (valid term, tab, float, toggle, buf)
	mode = "term",
	-- Focus on runner window(only works on toggle, term and tab mode)
	focus = false,
	-- startinsert (see ':h inserting-ex')
	startinsert = false,
	term = {
		--  Position to open the terminal, this option is ignored if mode is tab
		position = "bot",
		-- window size, this option is ignored if tab is true
		size = 14,
	},
	filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u",
		typescript = "deno run",
		-- rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
		rust = "cd $dir && cargo run",
		cpp = "cd $dir && g++ -o $fileNameWithoutExt $fileName && $dir/$fileNameWithoutExt",
	},
	float = {
		-- Window border (see ':h nvim_open_win')
		border = "none",

		-- Num from `0 - 1` for measurements
		height = 0.8,
		width = 0.8,
		x = 0.5,
		y = 0.5,

		-- Highlight group for floating window/border (see ':h winhl')
		border_hl = "FloatBorder",
		float_hl = "Normal",

		-- Transparency (see ':h winblend')
		blend = 0,
	},
	filetype_path = vim.fn.stdpath("data")
		.. "/site/pack/packer/start/code_runner.nvim/lua/code_runner/code_runner.json",
	-- project_path = vim.fn.stdpath("data")
	-- 	.. "/site/pack/packer/start/code_runner.nvim/lua/code_runner/project_manager.json",
	-- project = {},
})
